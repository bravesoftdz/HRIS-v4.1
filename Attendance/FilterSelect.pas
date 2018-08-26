unit FilterSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzButton, Vcl.ComCtrls, RzTreeVw, ResourceFilter,
  Vcl.Imaging.pngimage;

type
  TfrmFilterSelect = class(TfrmBasePopup)
    pnlFilter: TRzPanel;
    pnlSelect: TRzPanel;
    btnSelect: TRzShapeButton;
    pnlCancel: TRzPanel;
    btnCancel: TRzShapeButton;
    tvFilter: TRzTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tvFilterDblClick(Sender: TObject);
  private
    { Private declarations }
    Filters: array of TResourceFilter;
    procedure PopulateTree;
    procedure RetrieveFilters;
  protected
    { Public declarations }
  end;

var
  frmFilterSelect: TfrmFilterSelect;

implementation

{$R *.dfm}

uses
  TimelogData;

procedure TfrmFilterSelect.PopulateTree;
var
  i, cnt: integer;

  function GetParentNode: TTreeNode;
  var
    n: integer;
  begin
    Result := nil;
    for n := 0 to tvFilter.Items.Count - 1 do
      if not Assigned(tvFilter.Items[n].Data) then
      begin
        if tvFilter.Items[n].SelectedIndex = Integer(Filters[i].FilterType) then
        begin
          Result := tvFilter.Items[n];
          Exit;
        end;
      end;
  end;

begin
  with tvFilter do
  begin
    cnt := Length(Filters) - 1;
    for i := 0 to cnt do
      Items.AddChildObject(GetParentNode,Filters[i].Name,Filters[i]);
  end;
end;

procedure TfrmFilterSelect.RetrieveFilters;
var
  rf: TResourceFilter;
begin
  with dmTimeLog do
  begin
    dstResourceTypes.Open;

    while not dstResourceTypes.Eof do
    begin
      rf := TResourceFilter.Create;

      rf.ResourceTypeName := dstResourceTypes.FieldByName('resource_type').AsString;
      rf.Code := dstResourceTypes.FieldByName('code').AsString;
      rf.Name := dstResourceTypes.FieldByName('name').AsString;

      SetLength(Filters,Length(Filters) + 1);

      Filters[Length(Filters) - 1] := rf;

      dstResourceTypes.Next;
    end;

    dstResourceTypes.Close;
  end;
end;

procedure TfrmFilterSelect.tvFilterDblClick(Sender: TObject);
begin
  inherited;
  if Assigned(tvFilter.Selected.Data) then ModalResult := mrOk;
end;

procedure TfrmFilterSelect.btnSelectClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmFilterSelect.FormClose(Sender: TObject; var Action: TCloseAction);
var
  rf: TResourceFilter;
begin
  if ModalResult = mrOK then
  begin
    rf := TResourceFilter(tvFilter.Selected.Data);
    if Assigned(rf) then resFilter := rf;
  end;

  inherited;
end;

procedure TfrmFilterSelect.FormCreate(Sender: TObject);
begin
  RetrieveFilters;
  PopulateTree;

  inherited;
end;

procedure TfrmFilterSelect.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then ModalResult := mrOK;
  inherited;
end;

procedure TfrmFilterSelect.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

end.
