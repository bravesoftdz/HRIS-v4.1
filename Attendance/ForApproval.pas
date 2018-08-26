unit ForApproval;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Data.DB, RzButton, Vcl.Grids, Vcl.DBGrids, RzDBGrid,
  RzCmboBx, RzDBLbl, JvExControls, JvLabel, RzTabs, Vcl.Imaging.pngimage,
  RzRadChk, Entitlement, ADODB, RefreshIntf;

type
  TfrmForApproval = class(TfrmBaseDocked,IRefresh)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pnlDetail: TRzPanel;
    pnlApprove: TRzPanel;
    btnApprove: TRzShapeButton;
    RzLabel1: TRzLabel;
    cmbEntitlement: TRzComboBox;
    pnlDeny: TRzPanel;
    btnDeny: TRzShapeButton;
    pcDetails: TRzPageControl;
    tsUndertime: TRzTabSheet;
    tsLeave: TRzTabSheet;
    JvLabel3: TJvLabel;
    RzDBLabel4: TRzDBLabel;
    JvLabel4: TJvLabel;
    RzDBLabel5: TRzDBLabel;
    JvLabel5: TJvLabel;
    RzDBLabel6: TRzDBLabel;
    JvLabel6: TJvLabel;
    RzDBLabel7: TRzDBLabel;
    JvLabel7: TJvLabel;
    RzDBLabel8: TRzDBLabel;
    JvLabel1: TJvLabel;
    JvLabel10: TJvLabel;
    RzDBLabel1: TRzDBLabel;
    JvLabel40: TJvLabel;
    RzDBLabel21: TRzDBLabel;
    JvLabel11: TJvLabel;
    RzDBLabel2: TRzDBLabel;
    RzDBLabel3: TRzDBLabel;
    JvLabel2: TJvLabel;
    RzDBLabel16: TRzDBLabel;
    JvLabel8: TJvLabel;
    RzDBLabel9: TRzDBLabel;
    JvLabel9: TJvLabel;
    RzDBLabel10: TRzDBLabel;
    JvLabel12: TJvLabel;
    RzDBLabel11: TRzDBLabel;
    JvLabel13: TJvLabel;
    RzDBLabel12: TRzDBLabel;
    imgConflict: TImage;
    cbxConflicts: TRzCheckBox;
    RzLabel2: TRzLabel;
    cmbPeriod: TRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cmbEntitlementClick(Sender: TObject);
    procedure btnApproveClick(Sender: TObject);
    procedure btnDenyClick(Sender: TObject);
    procedure grListDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grListCellClick(Column: TColumn);
    procedure grListKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbxConflictsClick(Sender: TObject);
    procedure cmbPeriodClick(Sender: TObject);
  private
    { Private declarations }
    procedure Retrieve;
    procedure FilterList;
    procedure ConfigureGrid;
    procedure SetActiveTab;
    procedure CheckConflicts;

    procedure ChangeStatus(const status: TStatus);
  public
    { Public declarations }
    procedure RefreshDisplay;
  end;

var
  frmForApproval: TfrmForApproval;

const
  // combobox item index
  LEAVES = 0;
  UNDERTIME = 1;
  OVRRIDE = 2;

implementation

{$R *.dfm}

uses
  TimelogData, FormsUtil, HRISDialogs, DBUtil, AppData, PayrollCode;

procedure TfrmForApproval.btnApproveClick(Sender: TObject);
begin
  inherited;
  ChangeStatus(stApprove);
end;

procedure TfrmForApproval.cmbEntitlementClick(Sender: TObject);
begin
  inherited;
  FilterList;
  SetActiveTab;
  ConfigureGrid;
  CheckConflicts;

  cbxConflicts.Visible := cmbEntitlement.ItemIndex = LEAVES;
end;

procedure TfrmForApproval.cmbPeriodClick(Sender: TObject);
begin
  Retrieve;
end;

procedure TfrmForApproval.FormCreate(Sender: TObject);
begin
  inherited;
  PopulatePayrollPeriodComboBox(cmbPeriod);

  Retrieve;

  cmbEntitlement.ItemIndex := 0;

  FilterList;
  SetActiveTab;
  ConfigureGrid;
  CheckConflicts;
end;

procedure TfrmForApproval.grListCellClick(Column: TColumn);
begin
  CheckConflicts;
end;

procedure TfrmForApproval.grListDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with grList, grList.DataSource.DataSet do
  begin
    if FieldByName('status').AsString = 'APP' then  Canvas.Brush.Color := clGreen
    else if FieldByName('status').AsString = 'DND' then  Canvas.Brush.Color := clRed;
  end;

  grList.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmForApproval.grListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key in [VK_UP,VK_DOWN,VK_LEFT,VK_RIGHT] then CheckConflicts;
end;

procedure TfrmForApproval.FilterList;
var
  filterStr: string;
begin
  try
    with grList.DataSource.DataSet, cmbEntitlement do
    begin
      case ItemIndex of
        LEAVES: filterStr := '(entitlement = 0)';
        UNDERTIME: filterStr := '(entitlement = 1)';
        OVRRIDE: filterStr := '(entitlement = 2)';
      end;

      Filter := filterStr;
    end;
  except
    on E: Exception do ShowErrorBox(E.Message);
  end;

end;

procedure TfrmForApproval.SetActiveTab;
begin
  with cmbEntitlement, pcDetails do
  begin
    case ItemIndex of
      LEAVES: ActivePage := tsLeave;
      UNDERTIME: ActivePage := tsUndertime;
      OVRRIDE: ActivePage := tsUndertime;
    end;
  end;
end;

procedure TfrmForApproval.ConfigureGrid;
begin
  with grList, cmbEntitlement do
  begin
    Columns[0].Visible := ItemIndex in [LEAVES];
    Columns[1].Visible := ItemIndex in [LEAVES,UNDERTIME];
    Columns[2].Visible := ItemIndex in [LEAVES,UNDERTIME,OVRRIDE];
    Columns[3].Visible := ItemIndex in [UNDERTIME];
    Columns[4].Visible := ItemIndex in [UNDERTIME];
    Columns[5].Visible := ItemIndex in [LEAVES,UNDERTIME,OVRRIDE];
    Columns[6].Visible := ItemIndex in [LEAVES];
  end;
end;

procedure TfrmForApproval.btnDenyClick(Sender: TObject);
begin
  inherited;
  ChangeStatus(stDeny);
end;

procedure TfrmForApproval.cbxConflictsClick(Sender: TObject);
var
  filterStr, wholedayConflict, morningConflict, afternoonConflict: string;
begin
  if cbxConflicts.Checked then
  begin
    filterStr := grList.DataSource.DataSet.Filter;

    wholedayConflict := '(((entitlement = 0) and (' +
                        '(am_pm = '''') and (time_in_am_f <> '''')' +
                        '))' +
                        'or ((entitlement = 0) and (' +
                        '(am_pm = '''') and (time_in_pm_f <> '''')' +
                        ')))';

    morningConflict := '((entitlement = 0) and (' +
                        '(am_pm = ''A'') and (time_in_am_f <> '''')' +
                        '))';

    afternoonConflict := '((entitlement = 0) and (' +
                        '(am_pm = ''P'') and (time_in_pm_f <> '''')' +
                        '))';

    filterStr := wholedayConflict + ' or ' + morningConflict + ' or ' + afternoonConflict;

    grList.DataSource.DataSet.Filter := filterStr;
  end
  else FilterList;

  CheckConflicts;
end;

procedure TfrmForApproval.ChangeStatus(const status: TStatus);
begin
  if cmbEntitlement.ItemIndex = LEAVES then
  begin
    if leaveApp.ConflictExists then
          if ShowWarningBox('Conflicts have been found. ' +
                'Approval will result in the cancellation of the timelogs. ' +
                'Do you want to continue?') in [mrClose,mrNo] then Exit;
                leaveApp.ChangeStatus(status);
  end
  else utApp.ChangeStatus(status);

  RefreshDataSet(grList.DataSource.DataSet.RecNo - 1,grList.DataSource.DataSet);
end;

procedure TfrmForApproval.CheckConflicts;
begin
  if cmbEntitlement.ItemIndex = LEAVES then imgConflict.Visible := leaveApp.ConflictExists;
end;

procedure TfrmForApproval.Retrieve;
begin
  with grList do
  begin
    Visible := false;
    Application.ProcessMessages;

    (DataSource.DataSet as TADODataSet).Parameters.ParamByName('@payroll_code').Value :=
        TPayrollCode(cmbPeriod.Items.Objects[cmbPeriod.ItemIndex]).Code;

    OpenGridDataSources(pnlList);

    Visible := true;
  end;
end;

procedure TfrmForApproval.RefreshDisplay;
begin
  Application.ProcessMessages;

  // change panel caption
  pnlList.Caption := 'Refreshing data. Please wait...';

  Retrieve;
end;

end.
