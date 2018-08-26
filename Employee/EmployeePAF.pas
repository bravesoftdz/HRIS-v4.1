unit EmployeePAF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Data.DB, Vcl.Grids,
  Vcl.DBGrids, RzDBGrid, EmployeeController;

type
  TfrmEmployeePAF = class(TfrmBase)
    grSearch: TRzDBGrid;
    procedure grSearchDblClick(Sender: TObject);
  private
    { Private declarations }
    Controller: TEmployeeController;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const AController: TEmployeeController); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  EmployeeData;

constructor TfrmEmployeePAF.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

constructor TfrmEmployeePAF.Create(AOwner: TComponent;
  const AController: TEmployeeController);
begin
  inherited Create(AOwner);
  Controller := AController;
end;

procedure TfrmEmployeePAF.grSearchDblClick(Sender: TObject);
begin
  Controller.OpenPaf;
end;

end.
