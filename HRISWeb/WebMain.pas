unit WebMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniLabel, uniGUIBaseClasses,
  uniPanel, uniGUIFrame, Vcl.Imaging.pngimage, uniImage;

type
  TWebFrames = (frEmployeeDrawer,frTagRegistrationList,frShipList,frReportSettings);

  TWebMainForm = class(TUniForm)
    DockPanel: TUniPanel;
    lblWelcomeUser: TUniLabel;
    UniSimplePanel1: TUniSimplePanel;
    pnlProfile: TUniSimplePanel;
    imgProfile: TUniImage;
    pnlLeaves: TUniSimplePanel;
    imgLeaves: TUniImage;
    UniSimplePanel2: TUniSimplePanel;
    imgLogout: TUniImage;
    UniLabel2: TUniLabel;
    procedure UniFormAfterShow(Sender: TObject);
    procedure lblShipsClick(Sender: TObject);
    procedure imgProfileClick(Sender: TObject);
    procedure imgLogoutClick(Sender: TObject);
  private
    { Private declarations }
    procedure DockFrame(frame: TWebFrames);
  public
    { Public declarations }
  end;

function WebMainForm: TWebMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, WebEmployeeDrawer;

function WebMainForm: TWebMainForm;
begin
  Result := TWebMainForm(UniMainModule.GetFormInstance(TWebMainForm));
end;

procedure TWebMainForm.DockFrame(frame: TWebFrames);
var
  LFrame: TUniFrame;
begin
  // clear the dock panel
  if DockPanel.ControlCount <> 0 then (DockPanel.Controls[0] as TUniFrame).Free;

  case frame of
    frEmployeeDrawer: LFrame := TEmployeeDrawerFrame.Create(self);
  end;

  // dock the new frame
  LFrame.Parent := DockPanel;
  LFrame.Show;
end;

procedure TWebMainForm.imgLogoutClick(Sender: TObject);
begin
  Close;
end;

procedure TWebMainForm.imgProfileClick(Sender: TObject);
begin
  DockFrame(frEmployeeDrawer);
end;

procedure TWebMainForm.lblShipsClick(Sender: TObject);
begin
  DockFrame(frShipList);
end;

procedure TWebMainForm.UniFormAfterShow(Sender: TObject);
begin
  lblWelcomeUser.Caption := 'Welcome back ' + UniMainModule.User.FirstName + '.';
end;

initialization
  RegisterAppFormClass(TWebMainForm);

end.
