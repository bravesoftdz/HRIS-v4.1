unit PafMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked2, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, JvExControls, JvLabel, Vcl.Mask, RzEdit, RzBtnEdt,
  Vcl.DBCtrls, RzDBEdit, RzButton, RzRadChk, RzDBCmbo, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, PafController, SaveIntf, RzDBChk;

type
  TfrmPafMain = class(TfrmBaseDocked2,ISave)
    edEmployee: TRzButtonEdit;
    JvLabel7: TJvLabel;
    JvLabel1: TJvLabel;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    JvLabel5: TJvLabel;
    RzDBMemo1: TRzDBMemo;
    RzGroupBox3: TRzGroupBox;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    RzDBLookupComboBox4: TRzDBLookupComboBox;
    RzDBLookupComboBox5: TRzDBLookupComboBox;
    RzDBLookupComboBox6: TRzDBLookupComboBox;
    JvLabel2: TJvLabel;
    RzGroupBox1: TRzGroupBox;
    pnlDetail: TRzPanel;
    grSearch: TRzDBGrid;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel10: TJvLabel;
    RzDBNumericEdit1: TRzDBNumericEdit;
    JvLabel11: TJvLabel;
    lblTotalAllowance: TJvLabel;
    lblSummary: TJvLabel;
    lblSummaryOfChanges: TJvLabel;
    pnlApprove: TRzPanel;
    btnApprove: TRzShapeButton;
    pnlStatus: TRzPanel;
    pnlCancel: TRzPanel;
    btnCancel: TRzShapeButton;
    pnlAdd: TRzPanel;
    btnAdd: TRzShapeButton;
    pnlDelete: TRzPanel;
    btnDelete: TRzShapeButton;
    procedure edEmployeeButtonClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnApproveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzDBLookupComboBox4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    Controller: TPafController;
    procedure RefreshForm;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;

    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const AController: TPafController); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  PafData, FormsUtil, AppConstants;

procedure TfrmPafMain.btnAddClick(Sender: TObject);
begin
  inherited;
  Controller.AddAllowance;
end;

procedure TfrmPafMain.btnApproveClick(Sender: TObject);
begin
  inherited;
  Controller.ApprovePaf;
end;

procedure TfrmPafMain.btnCancelClick(Sender: TObject);
begin
  inherited;
  Controller.CancelPaf;
end;

procedure TfrmPafMain.btnDeleteClick(Sender: TObject);
begin
  inherited;
  Controller.RemoveAllowance;
end;

procedure TfrmPafMain.Cancel;
begin
  Controller.Cancel;
end;

constructor TfrmPafMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Controller := TPafController.Create;
  Controller.OnUpdate := RefreshForm;
end;

constructor TfrmPafMain.Create(AOwner: TComponent; const AController: TPafController);
begin
  if Assigned(AController) then
  begin
    inherited Create(AOwner);
    Controller := AController;
    Controller.OnUpdate := RefreshForm;
    Controller.Retrieve;
    Controller.FilterDepartments;
    RefreshForm;
  end else Create(AOwner);
end;

procedure TfrmPafMain.edEmployeeButtonClick(Sender: TObject);
begin
  Controller.FindEmployee;
end;

procedure TfrmPafMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Controller.Free;
  inherited;
end;

procedure TfrmPafMain.FormShow(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(self);
end;

procedure TfrmPafMain.RefreshForm;
begin
  edEmployee.Text := Controller.Employee.NameSurnameFirst;
  lblTotalAllowance.Caption := FormatCurr('###,###,##0.00',Controller.TotalAllowance);
  lblSummaryOfChanges.Caption := Controller.SummaryOfChanges;

  // status
  pnlStatus.Caption := Controller.Status;
  // colour
  if (Controller.Status = PAF_NEW) or (Controller.Status = PAF_PENDING) then pnlStatus.Color := clPurple
  else if Controller.Status = PAF_CANCELLED then pnlStatus.Color := clRed
  else pnlStatus.Color := clGreen;
end;

procedure TfrmPafMain.RzDBLookupComboBox4Click(Sender: TObject);
begin
  inherited;
  Controller.FilterDepartments;
end;

function TfrmPafMain.Save: boolean;
begin
  Result := Controller.Save;
end;

end.
