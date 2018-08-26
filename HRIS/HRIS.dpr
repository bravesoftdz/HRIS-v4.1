program HRIS;

uses
  AppUtil,
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Login in 'Login.pas' {frmLogin};

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
