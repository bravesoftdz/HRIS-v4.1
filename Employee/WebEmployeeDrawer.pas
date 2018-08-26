unit WebEmployeeDrawer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniLabel,
  EmployeeController;

type
  TEmployeeFrames = (frMain,frAddressAndContact,frFamilyAndRelatives,frPaf);

  TEmployeeDrawerFrame = class(TUniFrame)
    MenuPanel: TUniSimplePanel;
    MainLabel: TUniLabel;
    AddressAndContactLabel: TUniLabel;
    FamilyAndRelativesLabel: TUniLabel;
    PafRecordsLabel: TUniLabel;
    DockPanel: TUniSimplePanel;
    procedure MainLabelClick(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure AddressAndContactLabelClick(Sender: TObject);
    procedure FamilyAndRelativesLabelClick(Sender: TObject);
  private
    { Private declarations }
    Controller: TEmployeeController;
    procedure DockFrame(AFrame: TEmployeeFrames);
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, WebEmployeeMain, Employee,
  WebAddressAndContact, WebFamilyAndRelatives;

{ TEmployeeDrawerFrame }

procedure TEmployeeDrawerFrame.AddressAndContactLabelClick(Sender: TObject);
begin
  DockFrame(frAddressAndContact);
end;

procedure TEmployeeDrawerFrame.DockFrame(AFrame: TEmployeeFrames);
var
  LFrame: TUniFrame;
begin
  // clear the dock panel
  if DockPanel.ControlCount <> 0 then (DockPanel.Controls[0] as TUniFrame).Free;

  case AFrame of
    frMain: LFrame := TEmployeeMainFrame.Create(self,Controller.Employee);
    frAddressAndContact: LFrame := TAddressAndContactFrame.Create(self);
    frFamilyAndRelatives: LFrame := TFamilyAndRelativesFrame.Create(self,Controller);
  end;

  case AFrame of
    frMain: Controller.Selected := sdMain;
    frAddressAndContact: Controller.Selected := sdAddressAndContact;
    frFamilyAndRelatives: Controller.Selected := sdFamily;
  end;

  Controller.OnSelectionChanged;

  // dock the new frame
  LFrame.Parent := DockPanel;
  LFrame.Show;

end;

procedure TEmployeeDrawerFrame.FamilyAndRelativesLabelClick(Sender: TObject);
begin
  DockFrame(frFamilyAndRelatives);
end;

procedure TEmployeeDrawerFrame.MainLabelClick(Sender: TObject);
begin
  DockFrame(frMain);
end;

procedure TEmployeeDrawerFrame.UniFrameCreate(Sender: TObject);
var
  LEmployee: TEmployee;
begin
  Controller := TEmployeeController.Create;

  with UniMainModule.User do
  begin
    LEmployee := TEmployee.Create;
    LEmployee.IdNumber  := UserId;
    LEmployee.FirstName := FirstName;
    LEmployee.LastName := LastName;
  end;

  Controller.Employee := LEmployee;

  DockFrame(frMain);
end;

procedure TEmployeeDrawerFrame.UniFrameDestroy(Sender: TObject);
begin
  FreeAndNil(Controller);
end;

end.
