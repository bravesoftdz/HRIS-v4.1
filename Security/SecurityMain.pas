unit SecurityMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked2, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, SaveIntf, NewIntf, BaseDocked;

type
  TSecurityForms = (sfmChangePassword,sfmUsers,sfmRoles, sfmRights);

  TfrmSecurityMain = class(TfrmBaseDocked2, ISave, INew)
    pnlOptions: TRzPanel;
    pnlDock: TRzPanel;
    urlChangePassword: TRzURLLabel;
    urlUsers: TRzURLLabel;
    urlRoles: TRzURLLabel;
    urlRights: TRzURLLabel;
    procedure urlChangePasswordClick(Sender: TObject);
    procedure urlUsersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure urlRolesClick(Sender: TObject);
    procedure urlRightsClick(Sender: TObject);
  private
    { Private declarations }
    DOCKED_FORM: TSecurityForms;
    procedure GetActiveForm(var frm: TForm);
    procedure DockForm(const fm: TSecurityForms; const title: string = '');
  public
    { Public declarations }
    function Save: boolean;
    procedure New;
    procedure Cancel;
  end;

implementation

{$R *.dfm}

uses
  ChangePassword, HRISDialogs, Users, SecurityData, Roles, User, HRISGlobal,
  Rights;

{ TfrmSecurityMain }

procedure TfrmSecurityMain.Cancel;
var
  intf: ISave;
  frm: TForm;
begin
  try
    GetActiveForm(frm);
    if Assigned(frm) then
      if Supports(frm,ISave,intf) then
        intf.Cancel;
  except
    on e:Exception do
      ShowErrorBox2(e.Message);
  end;
end;

procedure TfrmSecurityMain.DockForm(const fm: TSecurityForms;
  const title: string);
var
  frm: TForm;
  control: integer;
begin
  if (pnlDock.ControlCount = 0) or (fm <> DOCKED_FORM) then
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
    case fm of
      sfmChangePassword: frm := TfrmChangePassword.Create(self);
      sfmUsers: frm := TfrmUsers.Create(self);
      sfmRoles: frm := TfrmRoles.Create(self);
      sfmRights: frm := TfrmRights.Create(self);
      else
        frm := TForm.Create(self);
    end;

    DOCKED_FORM := fm;

    frm.ManualDock(pnlDock);
    frm.Show;
  end
  else ShowInfoBox2('Window is already open.');
end;

procedure TfrmSecurityMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmSecurity.Destroy;
end;

procedure TfrmSecurityMain.FormCreate(Sender: TObject);
begin
  inherited;
  dmSecurity := TdmSecurity.Create(self);

  // hide or show links
  //urlUsers.Visible := ifn.User.HasRight(S9VIEW_USERS9View_system_users,false);
  //urlRoles.Visible := ifn.User.HasRight(S9VIEW_ROLES9View_system_roles,false);
end;

procedure TfrmSecurityMain.GetActiveForm(var frm: TForm);
begin
  frm := nil;
  // check if a popup is active
  if Application.MainForm <> Screen.ActiveForm then frm := Screen.ActiveForm
  else if pnlDock.ControlCount > 0 then frm := pnlDock.Controls[0] as TForm;
end;

procedure TfrmSecurityMain.New;
var
  intf: INew;
  frm: TForm;
begin
  try
    GetActiveForm(frm);
    if Assigned(frm) then
      if Supports(frm,INew,intf) then intf.New;
  except
    on e:Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmSecurityMain.urlUsersClick(Sender: TObject);
begin
  inherited;
  DockForm(sfmUsers);
end;

function TfrmSecurityMain.Save: boolean;
var
  intf: ISave;
  frm: TForm;
begin
  Result := false;
  try
    GetActiveForm(frm);
    if Assigned(frm) then
      if Supports(frm, ISave, intf) then
        if intf.Save then Result := true;
  except

  end;
end;

procedure TfrmSecurityMain.urlChangePasswordClick(Sender: TObject);
begin
  inherited;
  DockForm(sfmChangePassword);
end;

procedure TfrmSecurityMain.urlRightsClick(Sender: TObject);
begin
  inherited;
  DockForm(sfmRights);
end;

procedure TfrmSecurityMain.urlRolesClick(Sender: TObject);
begin
  inherited;
  DockForm(sfmRoles);
end;

end.
