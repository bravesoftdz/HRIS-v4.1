unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Vcl.StdCtrls, RzLabel, System.UITypes,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzPrgres,
  RzButton, BasePopup2;

type
  TfrmLogin = class(TfrmBasePopup2)
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edUsername: TRzEdit;
    edPassword: TRzEdit;
    lbErrorMessage: TLabel;
    imgLogo: TImage;
    prbStatus: TRzProgressBar;
    lblStatus: TLabel;
    pnlClose: TRzPanel;
    btnClose: TRzShapeButton;
    pnlLogin: TRzPanel;
    btnLogin: TRzShapeButton;
    lblVersion: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edUsernameChange(Sender: TObject);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure LoadModules;
    procedure LoadSettings;
    procedure SettingAccessRights;
    procedure PauseWindow(timer: integer);
    procedure GetLocations;
    function UserExists: boolean;
    function PasswordIsValid: boolean;
  public
    { Public declarations }
    class function LoggedIn: boolean;
  end;

var
  frmLogin: TfrmLogin;

const
  LIMITGLOBAL = 6;
  TICK = 80;
  INCREMENT = 16;

implementation

{$R *.dfm}

uses
  AppData, AppUtil, HRISGlobal, HRISDialogs, Location;

class function TfrmLogin.LoggedIn: boolean;
begin
  with TfrmLogin.Create(nil) do
  try
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

function TfrmLogin.UserExists: boolean;
var
  username: string;
begin
  with dmApplication.dstUser do
  begin
    username := Trim(edUsername.Text);

    Close;
    Parameters.ParamByName('@username').Value := username;
    Open;

    Result := RecordCount > 0;

    if not Result then lbErrorMessage.Caption := 'Invalid username or password.';
  end;
end;

procedure TfrmLogin.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then btnLogin.Click;
end;

procedure TfrmLogin.edUsernameChange(Sender: TObject);
begin
  inherited;
  lbErrorMessage.Visible := false;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  dmApplication := TdmApplication.Create(Application);

  lblVersion.Caption := 'Version ' + GetAppVersionStr(ParamStr(0));;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  prbStatus.Visible := false;
end;

procedure TfrmLogin.PauseWindow(timer: integer);
var
  StartTimer: integer;
  EndTimer: Integer;
begin
  // wait a few miliseconds
  StartTimer := GetTickCount;
  EndTimer   := StartTimer + timer;

  while StartTimer < EndTimer do
    StartTimer := GetTickCount;
end;

procedure TfrmLogin.pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
if (UserExists) and (PasswordIsValid) then
  begin
    try
      try
        edUsername.Enabled := false;
        edPassword.Enabled := false;
        btnLogin.Enabled := false;
        btnClose.Enabled := false;

        lblStatus.Visible := true;
        prbStatus.Visible := true;
        lbErrorMessage.Visible := false;

        self.Update;

        HRIS := THRISGlobal.Create;

        LoadModules;
        SettingAccessRights;
        LoadSettings;

        ModalResult := 1;
      except
        on e: Exception do
        begin
          ShowErrorBox2('An exception has been detected and the application needs to close. ' +
            'Please contact the administrator with the message below.' + #13#10 + #13#10 +
            e.Message);
          Application.Terminate;
        end;
      end;
    finally

    end;
  end
  else
  begin
    lbErrorMessage.Visible := true;
    edUsername.SetFocus;
  end;
end;

procedure TfrmLogin.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrAbort;
end;

procedure TfrmLogin.LoadSettings;
var
  limit: integer;
  i: integer;
  timer: integer;
begin
  limit := LIMITGLOBAL;
  i := 1;
  timer := TICK;

  prbStatus.Percent := 0;
  lblStatus.Caption := 'Loading settings.';
  self.Update;

  with dmApplication.dstConfig do
  begin
    Open;

    HRIS.CurrentDate := Date;
//
//    // location code
//    Locate('sysconfig_code','LOCATION_CODE',[]);
//    ifn.LocationCode := FieldbyName('sysconfig_value').AsString;
//
//    // location prefix
//    Locate('sysconfig_code','LOCATION_PREFIX',[]);
//    ifn.LocationPrefix := FieldbyName('sysconfig_value').AsString;
//
//    Close;
//
//    // photo path
//    ifn.PhotoPath := ExtractFilePath(Application.ExeName) + 'photos\';
//    if not DirectoryExists(ifn.PhotoPath) then
//      CreateDir(ifn.PhotoPath);
//
    // application images path
    HRIS.AppImagesPath := ExtractFilePath(Application.ExeName) + '_snapshots\';

    // version
    HRIS.Version := GetAppVersionStr(ParamStr(0));

    // get all locations
    GetLocations;

  end;

  while i <= limit do
  begin
    PauseWindow(timer);
    prbStatus.Percent := prbStatus.Percent + INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;
end;

procedure TfrmLogin.LoadModules;
var
  limit: integer;
  i: integer;
  timer: integer;
begin
  limit := LIMITGLOBAL;
  i := 1;
  timer := TICK;

  lblStatus.Caption := 'Loading modules.';
  while i <= limit do
  begin
    PauseWindow(timer);
    prbStatus.Percent := prbStatus.Percent + INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;
end;

procedure TfrmLogin.SettingAccessRights;
var
  limit, i, timer: integer;
  right: string;
begin
  limit := LIMITGLOBAL;
  i := 1;
  timer := TICK;

  prbStatus.Percent := 0;
  lblStatus.Caption := 'Setting user rights.';
  while i <= limit do
  begin
    PauseWindow(timer);
    prbStatus.Percent := prbStatus.Percent + INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;

  with dmApplication.dstUser do
  begin
    HRIS.User.UserId := FieldByName('id_num').AsString;
    HRIS.User.FirstName := FieldByName('employee_firstname').AsString;
    HRIS.User.LastName := FieldByName('employee_lastname').AsString;

    while not Eof do
    begin
      right := FieldbyName('privilege_code').AsString;
      HRIS.User.AddRight(right);
      Next;
    end;
  end;
end;

function TfrmLogin.PasswordIsValid: boolean;
var
  password: string;
begin
  with dmApplication.dstUser do
  begin
    password := FieldByName('password').AsString;

    Result := SameText(password, Trim(edPassword.Text));

    if not Result then
      lbErrorMessage.Caption := 'Invalid username or password.';
  end;
end;

procedure TfrmLogin.GetLocations;
var
  loc: TLocation;
begin
  with dmApplication.dstLocation do
  begin
    DisableControls;
    Open;

    while not Eof do
    begin
      loc := TLocation.Create;

      loc.LocationCode := FieldByName('location_code').AsString;
      loc.LocationName := FieldByName('location_name').AsString;
      loc.LocationType := FieldByName('locationtype_code').AsString;

      Next;
    end;

    Close;
  end;
end;

end.
