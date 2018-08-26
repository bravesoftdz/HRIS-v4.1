unit WebLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniButton, uniEdit, uniLabel,
  Vcl.Imaging.pngimage, uniGUIBaseClasses, uniImage, uniPanel, Data.DB, Data.Win.ADODB;

type
  TLoginForm = class(TUniLoginForm)
    UniLabel1: TUniLabel;
    edUsername: TUniEdit;
    UniLabel2: TUniLabel;
    edPassword: TUniEdit;
    btnLogin: TUniButton;
    lblError: TUniLabel;
    a: TUniSimplePanel;
    UniLabel3: TUniLabel;
    UniImage1: TUniImage;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Login;
    function UserIsValid: boolean;
  public
    { Public declarations }
  end;

function LoginForm: TLoginForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, WebMain, User;

function LoginForm: TLoginForm;
begin
  Result := TLoginForm(UniMainModule.GetFormInstance(TLoginForm));
end;

procedure TLoginForm.btnLoginClick(Sender: TObject);
begin
  Login;
end;

procedure TLoginForm.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Login;
end;

procedure TLoginForm.Login;
begin
  if UserIsValid then ModalResult := mrOK
  else lblError.Caption := 'Invalid username and/or password.';
end;

function TLoginForm.UserIsValid: boolean;
var
  username: string;
  LUser: TUser;
begin
  with UniMainModule, UniMainModule.dstUser do
  begin
    try
      MainConnection.Open;
      
      username := Trim(edUsername.Text);

      Close;
      Parameters.ParamByName('@username').Value := username;
      Open;

      Result := RecordCount > 0;

      if Result then
      begin
        LUser := TUser.Create;
        
        LUser.UserId := FieldByName('id_num').AsString;
        LUser.FirstName := FieldByName('employee_firstname').AsString;
        LUser.LastName := FieldByName('employee_lastname').AsString;

        User := LUser;
      end;
    finally
      Close;
    end;
  end;
end;

initialization
  RegisterAppFormClass(TLoginForm);

end.
