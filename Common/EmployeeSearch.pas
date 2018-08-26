unit EmployeeSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzButton;

type
  TfrmEmployeeSearch = class(TfrmBaseSearch)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  end;

implementation

{$R *.dfm}

uses
  AppData, Employee;

procedure TfrmEmployeeSearch.Add;
begin

end;

procedure TfrmEmployeeSearch.SearchList;
var
  filter: string;
begin
  inherited;
  if Trim(edSearchKey.Text) <> '' then
    filter := 'employee_name like ''*' + edSearchKey.Text + '*'''
  else
    filter := '';

  grSearch.DataSource.DataSet.Filter := filter;
end;

procedure TfrmEmployeeSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet do
  begin
    empl.IdNumber := FieldByName('id_num').AsString;
    empl.LastName := FieldByName('employee_lastname').AsString;
    empl.FirstName := FieldByName('employee_firstname').AsString;
  end;
end;

procedure TfrmEmployeeSearch.Cancel;
begin

end;

end.
