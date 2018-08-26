program Kiosk;

uses
  AppUtil,
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Login in 'Login.pas',
  BaseForm in '..\Base\BaseForm.pas' {frmBase},
  BasePopup2 in '..\Base\BasePopup2.pas' {frmBasePopup2};

{$R *.res}

begin
  if not RestoreIfRunning(Application.Handle) then
  begin
    if TfrmLogin.LoggedIn then
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TfrmMain, frmMain);
      Application.Run;
    end;
  end;
end.
