unit SyncMain;

interface

uses
  System.SysUtils, System.Classes, BaseDocked, Vcl.Controls, Vcl.StdCtrls,
  RzLabel, Vcl.ExtCtrls, RzPanel, Data.DB, Vcl.Grids, Vcl.DBGrids, RzDBGrid,
  RzRadGrp, RzButton, RzRadChk, System.UITypes, RzCmboBx;

type
  TfrmSyncMain = class(TfrmBaseDocked)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    rgDirection: TRzRadioGroup;
    chbAutoRefresh: TRzCheckBox;
    pnlSync: TRzPanel;
    btnSync: TRzShapeButton;
    pnlDelete: TRzPanel;
    btnDelete: TRzShapeButton;
    pnlDetail: TRzPanel;
    RzLabel1: TRzLabel;
    cmbType: TRzComboBox;
    RzLabel2: TRzLabel;
    cmbBranch: TRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgDirectionClick(Sender: TObject);
    procedure cmbTypeChange(Sender: TObject);
    procedure cmbBranchChange(Sender: TObject);
  private
    { Private declarations }
    procedure FilterList;
  public
    { Public declarations }
  end;

var
  frmSyncMain: TfrmSyncMain;

const
  // radio button items
  OUTGOING = 0;
  INCOMING = 1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  SyncData, FormsUtil, HRISDialogs;

procedure TfrmSyncMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmSync.Free;

  inherited;
end;

procedure TfrmSyncMain.FormCreate(Sender: TObject);
begin
  inherited;
  dmSync := TdmSync.Create(self);

  OpenGridDataSources(pnlList);

  PopulateBranchComboBox(cmbBranch,true);

  FilterList;
end;

procedure TfrmSyncMain.rgDirectionClick(Sender: TObject);
begin
  inherited;
  FilterList;
end;

procedure TfrmSyncMain.cmbBranchChange(Sender: TObject);
begin
  inherited;
  FilterList;
end;

procedure TfrmSyncMain.cmbTypeChange(Sender: TObject);
begin
  inherited;
  FilterList;
end;

procedure TfrmSyncMain.FilterList;
var
  filterStr: string;
  filters: TStringList;
  i: integer;
begin
  try
    filters := TStringList.Create;

    with grList.DataSource.DataSet, rgDirection do
    begin
      // outgoing or incoming
      case ItemIndex of
        OUTGOING: filters.Add('(direction = 0)');
        INCOMING: filters.Add('(direction = 1)');
      end;

      // type
      filters.Add('(event_object = ''' + cmbType.Value + ''')');
      // source
      if cmbBranch.ItemIndex > 0 then filters.Add('(source_location_name = ''' + Trim(cmbBranch.Text) + ''')');

      // build the filter
      for i := 0 to filters.Count - 1 do
      begin
        filterStr := filterStr + filters[i];

        if i < filters.Count - 1 then
          filterStr := filterStr + ' and ';
      end;

      Filter := filterStr;
    end;
  except
    on E: Exception do ShowErrorBox(E.Message);
  end;

end;

end.
