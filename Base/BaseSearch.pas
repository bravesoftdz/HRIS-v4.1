unit BaseSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzButton;

type
  TfrmBaseSearch = class(TfrmBasePopup)
    RzLabel2: TRzLabel;
    edSearchKey: TRzEdit;
    grSearch: TRzDBGrid;
    pnlSearch: TRzPanel;
    pnlSelect: TRzPanel;
    btnSelect: TRzShapeButton;
    pnlNew: TRzPanel;
    btnNew: TRzShapeButton;
    pnlCancel: TRzPanel;
    btnCancel: TRzShapeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
    procedure grSearchDblClick(Sender: TObject);
    procedure edSearchKeyChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure EnableControls;
  protected
    { Public declarations }
    procedure SearchList; virtual; abstract;
    procedure SetReturn; virtual; abstract;
    procedure Add; virtual; abstract;
    procedure Cancel; virtual; abstract;
  end;

var
  frmBaseSearch: TfrmBaseSearch;

implementation

{$R *.dfm}

procedure TfrmBaseSearch.btnNewClick(Sender: TObject);
begin
  inherited;
  Add;
  EnableControls;
end;

procedure TfrmBaseSearch.btnSelectClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmBaseSearch.edSearchKeyChange(Sender: TObject);
begin
  if Trim(edSearchKey.Text) <> '' then SearchList;
end;

procedure TfrmBaseSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if ModalResult = mrOK then
  begin
    if grSearch.DataSource <> nil then
      if grSearch.DataSource.DataSet <> nil then
      begin
        SetReturn;
        grSearch.DataSource.DataSet.Close;
      end;
  end;

  // remove any filters
  grSearch.DataSource.DataSet.Filter := '';
end;

procedure TfrmBaseSearch.FormCreate(Sender: TObject);
begin
  inherited;
  if grSearch.DataSource <> nil then
    if grSearch.DataSource.DataSet <> nil then
    begin
      grSearch.DataSource.DataSet.Open;
      EnableControls;
    end;
end;

procedure TfrmBaseSearch.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if grSearch.DataSource.DataSet.RecordCount > 0 then ModalResult := mrOK;
  inherited;
end;

procedure TfrmBaseSearch.grSearchDblClick(Sender: TObject);
begin
  inherited;
  if grSearch.DataSource.DataSet.RecordCount > 0 then
    ModalResult := mrOK;
end;

procedure TfrmBaseSearch.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmBaseSearch.EnableControls;
begin
  btnSelect.Enabled := grSearch.DataSource.DataSet.RecordCount > 0;
end;

end.
