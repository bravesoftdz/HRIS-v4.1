unit EmployeeSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch2, Data.DB, RzButton,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Employee;

type
  TfrmEmployeeSearch = class(TfrmBaseSearch2)
  private
    { Private declarations }
    FEmployee: TEmployee;
  protected
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; AEmployee: TEmployee); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  AppData;

{ TfrmEmployeeSearch }

constructor TfrmEmployeeSearch.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TfrmEmployeeSearch.Add;
begin
  inherited;

end;

procedure TfrmEmployeeSearch.Cancel;
begin
  inherited;

end;

constructor TfrmEmployeeSearch.Create(AOwner: TComponent; AEmployee: TEmployee);
begin
  inherited Create(AOwner);
  FEmployee := AEmployee;
end;

procedure TfrmEmployeeSearch.SearchList;
var
  LFilter: string;
begin
  inherited;
  with grSearch.DataSource.DataSet do
  begin
    LFilter := '(EMPLOYEE_LASTNAME LIKE ''*' + (edSearchKey.Text) + '*'')' +
              ' OR (EMPLOYEE_FIRSTNAME LIKE ''*' + (edSearchKey.Text) + '*'')';

    Filter := LFilter;
  end;
end;

procedure TfrmEmployeeSearch.SetReturn;
begin
  inherited;
  with grSearch.DataSource.DataSet, FEmployee do
  begin
    IdNumber := FieldByName('id_num').AsString;
    FirstName := FieldByName('employee_firstname').AsString;
    LastName := FieldByName('employee_lastname').AsString;
  end;
end;

end.
