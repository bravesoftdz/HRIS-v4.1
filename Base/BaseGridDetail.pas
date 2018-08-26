unit BaseGridDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked2, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzButton, System.ImageList, Vcl.ImgList,
  SaveIntf, NewIntf, BaseDocked;

type
  TfrmBaseGridDetail = class(TfrmBaseDocked2,ISave,INew)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pnlSearch: TRzPanel;
    Label1: TLabel;
    edSearchKey: TRzEdit;
    pnlDetail: TRzPanel;
    pnlAdd: TRzPanel;
    sbtnNew: TRzShapeButton;
    procedure FormCreate(Sender: TObject);
    procedure edSearchKeyChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNewClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SearchList; virtual; abstract;
    procedure BindToObject; virtual; abstract;

    function EntryIsValid: boolean; virtual; abstract;
    function NewIsAllowed: boolean; virtual; abstract;
    function EditIsAllowed: boolean; virtual; abstract;
  public
    { Public declarations }
    function Save: boolean; virtual;
    procedure Cancel; virtual;
    procedure New; virtual;
  end;

implementation

{$R *.dfm}

uses
  FormsUtil;

procedure TfrmBaseGridDetail.edSearchKeyChange(Sender: TObject);
begin
  inherited;
  SearchList;
end;

procedure TfrmBaseGridDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OpenDropdownDataSources(pnlDetail,false);
  OpenGridDataSources(pnlList,false);
  inherited;
end;

procedure TfrmBaseGridDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenGridDataSources(pnlList);
end;

procedure TfrmBaseGridDetail.FormShow(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(pnlDetail);
end;

function TfrmBaseGridDetail.Save: boolean;
begin
  Result := false;
  with grList.DataSource.DataSet do
  begin
    if State in [dsInsert,dsEdit] then
    begin
      BindToObject;
      if EntryIsValid then
      begin
        grList.DataSource.DataSet.Post;
        grList.Enabled := true;
        Result := true;
      end
    end;
  end;
end;

procedure TfrmBaseGridDetail.sbtnNewClick(Sender: TObject);
begin
  New;
end;

procedure TfrmBaseGridDetail.Cancel;
begin
  grList.DataSource.DataSet.Cancel;
  grList.Enabled := true;
end;

procedure TfrmBaseGridDetail.New;
begin
  if NewIsAllowed then
  begin
    grList.DataSource.DataSet.Append;

    // disable the grid
    grList.Enabled := false;

    // focus the first control
    grList.DataSource.DataSet.FieldByName(grList.Columns[0].FieldName).FocusControl;
  end;
end;

end.
