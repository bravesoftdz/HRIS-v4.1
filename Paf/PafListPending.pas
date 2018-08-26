unit PafListPending;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked2, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Data.DB, Vcl.Grids, Vcl.DBGrids, RzDBGrid;

type
  TfrmPafListPending = class(TfrmBaseDocked2)
    grList: TRzDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grListDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenPaf;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  AppData, FormsUtil, DockIntf, PafController, Employee;

procedure TfrmPafListPending.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OpenGridDataSources(self,false);
  inherited;
end;

procedure TfrmPafListPending.FormCreate(Sender: TObject);
begin
  inherited;
  OpenGridDataSources(self);
end;

procedure TfrmPafListPending.grListDblClick(Sender: TObject);
begin
  inherited;
  OpenPaf;
end;

procedure TfrmPafListPending.OpenPaf;
var
  intf: IDock;
  pafId: integer;
  pafController: TPafController;
  LEmployee: TEmployee;
begin
  inherited;
  if Supports(Application.MainForm,IDock,intf) then
  begin
    with grList.DataSource.DataSet do
    begin
      if RecordCount > 0 then
      begin
        pafId := FieldbyName('paf_id').AsInteger;

        LEmployee := TEmployee.Create;
        LEmployee.IdNumber := FieldbyName('id_num').AsString;
        LEmployee.LastName := FieldbyName('employee_lastname').AsString;
        LEmployee.FirstName := FieldbyName('employee_firstname').AsString;

        pafController := TPafController.Create(pafId,LEmployee);

        intf.DockForm(fmPaf,pafController);
      end;
    end;
  end;
end;

end.
