unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, BasePopup, BaseForm, Vcl.StdCtrls, RzLabel, System.UITypes,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzPrgres,
  RzButton, DateUtils;

type
  TfrmLogin = class(TfrmBasePopup)
    Label4: TLabel;
    Label5: TLabel;
    lblVersion: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edUsername: TRzEdit;
    edPassword: TRzEdit;
    lbErrorMessage: TLabel;
    prbStatus: TRzProgressBar;
    lblStatus: TLabel;
    pnlClose: TRzPanel;
    btnCancel: TRzShapeButton;
    pnlLogin: TRzPanel;
    btnLogin: TRzShapeButton;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edUsernameChange(Sender: TObject);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
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
  AppData, AppUtil, HRISGlobal, HRISDialogs, PayrollCode, Location;

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

    if not Result then
      lbErrorMessage.Caption := 'Invalid username or password.';
  end;
end;

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrAbort;
end;

procedure TfrmLogin.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrAbort;
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
        btnCancel.Enabled := false;

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
          ShowErrorBox('An exception has been detected and the application needs to close. ' +
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

procedure TfrmLogin.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnLogin.Click;
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

  // get version
  lblVersion.Caption := 'ver. ' + GetAppVersionStr(ParamStr(0));
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

procedure TfrmLogin.LoadSettings;
var
  limit: integer;
  i: integer;
  timer: integer;
  prCode, prPeriod, prFrom, prUntil: string;
begin
  limit := LIMITGLOBAL;
  i := 1;
  timer := TICK;

  prbStatus.Percent := 0;
  lblStatus.Caption := 'Loading settings.';
  self.Update;

  with dmApplication do
  begin
    dstConfig.Open;
    dstPayrollCode.Open;

    HRIS.CurrentDate := Date;

    // location code
    if dstConfig.Locate('sysconfig_code','LOCATION_CODE',[]) then
      HRIS.LocationCode := dstConfig.FieldbyName('sysconfig_value').AsString
    else
      HRIS.LocationCode := 'CO';

    // payroll code
    while not dstPayrollCode.Eof do
    begin
      prCode := dstPayrollCode.FieldByName('payroll_code').AsString;
      prPeriod := dstPayrollCode.FieldByName('payroll_period').AsString;
      prFrom := dstPayrollCode.FieldByName('payroll_from').AsString;
      prUntil := dstPayrollCode.FieldByName('payroll_until').AsString;

      HRIS.AddActivePayrollCode(TPayrollCode.Create(prCode,prPeriod,prFrom,prUntil));

      dstPayrollCode.Next;
    end;

    HRIS.Version := GetAppVersionStr(ParamStr(0));
    HRIS.AppImagesPath := ExtractFilePath(Application.ExeName) + '_images\';
    HRIS.MaximumUndertime := 120;

    GetLocations;

    HRIS.Settings.Load;

    dstConfig.Close;
    dstPayrollCode.Close;
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

    HRIS.Employee.IdNumber := FieldByName('id_num').AsString;
    HRIS.Employee.FirstName := FieldByName('employee_firstname').AsString;
    HRIS.Employee.LastName := FieldByName('employee_lastname').AsString;
    HRIS.Employee.LocationCode := FieldByName('location_code').AsString;
    HRIS.Employee.PositionTypeCode := FieldByName('positiontype_code').AsString;

    while not Eof do
    begin
      right := FieldbyName('privilege_code').AsString;
      HRIS.User.AddRight(right);
      Next;
    end;
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

      HRIS.AddLocation(loc);

      Next;
    end;

    Close;
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

end.
