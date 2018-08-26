unit EmployeeDrawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked2, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, BaseDocked, EmployeeController, SaveIntf, Employee;

type
  TEmployeeForms = (efMain,efAddressAndContact,efFamily,efPAF,efPayroll,efPhoto);

  TfrmEmployeeDrawer = class(TfrmBaseDocked2,ISave)
    pnlDock: TRzPanel;
    pnlMenu: TRzPanel;
    urlMain: TRzURLLabel;
    urlAddressAndContact: TRzURLLabel;
    urlFamily: TRzURLLabel;
    urlPhoto: TRzURLLabel;
    lblIdNumber: TRzLabel;
    urlPAFRecords: TRzURLLabel;
    urlPayroll: TRzURLLabel;
    procedure FormShow(Sender: TObject);
    procedure urlMainClick(Sender: TObject);
    procedure urlAddressAndContactClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure urlFamilyClick(Sender: TObject);
    procedure urlPAFRecordsClick(Sender: TObject);
    procedure urlPhotoClick(Sender: TObject);
  private
    { Private declarations }
    DOCKED_FORM: TEmployeeForms;
    Controller: TEmployeeController;
    LDockForm: TEmployeeForms;
    procedure DockForm(ef: TEmployeeForms; AObject: TObject = nil);
    procedure EnableControls;
    procedure SetTitle;
  public
    { Public declarations }
    function Save: boolean;
    procedure Cancel;

    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const AEmployee: TEmployee; ADockForm: TEmployeeForms = efMain); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  EmployeeMain, AddressAndContact, FamilyAndRelatives, EmployeePAF, EmployeePhoto;

{ TfrmEmployeeDrawer }

constructor TfrmEmployeeDrawer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmEmployeeDrawer.Cancel;
begin
  Controller.Cancel;
end;

constructor TfrmEmployeeDrawer.Create(AOwner: TComponent;
  const AEmployee: TEmployee; ADockForm: TEmployeeForms);
begin
  inherited Create(AOwner);

  LDockForm := ADockForm;

  Controller := TEmployeeController.Create;

  if Assigned(AEmployee) then
  begin
    Controller.Employee := AEmployee;
    Controller.Action := eaEditing;
  end
  else Controller.Add;
end;

procedure TfrmEmployeeDrawer.DockForm(ef: TEmployeeForms; AObject: TObject = nil);
var
  frm: TForm;
  control: integer;
begin
  //if (pnlDockMain.ControlCount = 0) or (DOCKED_FORM <> fm) then
  begin
    control := 0;

    while control < pnlDock.ControlCount do
    begin
      if pnlDock.Controls[control] is TForm then
      begin
        (pnlDock.Controls[control] as TForm).Close;
        (pnlDock.Controls[control] as TForm).Free;
      end;

      Inc(control);
    end;

    // instantiate form
    case ef of
      efMain: frm := TfrmEmployeeMain.Create(self,Controller.Employee);
      efAddressAndContact: frm := TfrmAddressAndContact.Create(self);
      efFamily: frm := TfrmFamilyAndRelatives.Create(self,Controller);
      efPhoto: frm := TfrmEmployeePhoto.Create(self,Controller.Employee);
      efPAF: frm := TfrmEmployeePAF.Create(self,Controller);
      else frm := nil;
    end;

    // controller
    case ef of
      efMain: Controller.Selected := sdMain;
      efAddressAndContact: Controller.Selected := sdAddressAndContact;
      efFamily: Controller.Selected := sdFamily;
      efPhoto: Controller.Selected := sdPhoto;
      efPAF: Controller.Selected := sdPAF;
      else Controller.Selected := sdNone;
    end;

    if Controller.Action = eaEditing then Controller.OnSelectionChanged;

    if Assigned(frm) then
    begin
      DOCKED_FORM := ef;

      frm.ManualDock(pnlDocK);
      frm.Show;
    end;
  end;
end;

procedure TfrmEmployeeDrawer.EnableControls;
begin
  pnlMenu.Enabled := Controller.IsEditing;
end;

procedure TfrmEmployeeDrawer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(Controller);
end;

procedure TfrmEmployeeDrawer.FormShow(Sender: TObject);
begin
  inherited;
  DockForm(LDockForm);
  EnableControls;
  SetTitle;
end;

function TfrmEmployeeDrawer.Save: boolean;
begin
  Result := Controller.Save;

  EnableControls;
  SetTitle;
end;

procedure TfrmEmployeeDrawer.SetTitle;
begin
  if Assigned(Controller.Employee) then
  begin
    lblTitle.Caption := Controller.Employee.Name;
    lblIdNumber.Caption := 'ID Number: ' + Controller.Employee.IdNumber;
  end;
end;

procedure TfrmEmployeeDrawer.urlAddressAndContactClick(Sender: TObject);
begin
  inherited;
  DockForm(efAddressAndContact);
end;

procedure TfrmEmployeeDrawer.urlFamilyClick(Sender: TObject);
begin
  inherited;
  DockForm(efFamily);
end;

procedure TfrmEmployeeDrawer.urlMainClick(Sender: TObject);
begin
  inherited;
  DockForm(efMain);
end;

procedure TfrmEmployeeDrawer.urlPAFRecordsClick(Sender: TObject);
begin
  inherited;
  DockForm(efPAF);
end;

procedure TfrmEmployeeDrawer.urlPhotoClick(Sender: TObject);
begin
  inherited;
  DockForm(efPhoto);
end;

end.
