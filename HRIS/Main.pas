unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, RzPanel,
  JvPageList, JvNavigationPane, JvExControls, RzButton, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, AppConstants, Vcl.StdCtrls, RzLabel,
  JvImageList, RzStatus, DockIntf, RzLstBox, Vcl.AppEvnts, Generics.Collections, RzTabs,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.Buttons;

type
  TfrmMain = class(TForm,IDock)
    pnlTitle: TRzPanel;
    imgClose: TImage;
    lblCaption: TRzLabel;
    pnlMain: TRzPanel;
    pnlDockMain: TRzPanel;
    mmMain: TMainMenu;
    File1: TMenuItem;
    Save1: TMenuItem;
    alMain: TActionList;
    acSave: TAction;
    acAddEmployee: TAction;
    Newclient1: TMenuItem;
    acAddPAF: TAction;
    Newloan1: TMenuItem;
    acSearchEmployee: TAction;
    New1: TMenuItem;
    lblDate: TLabel;
    lblVersion: TLabel;
    Client1: TMenuItem;
    Loan1: TMenuItem;
    Selectclient1: TMenuItem;
    Newpayment1: TMenuItem;
    Payment1: TMenuItem;
    Selectclient2: TMenuItem;
    imgMinimize: TImage;
    pcMenu: TRzPageControl;
    tsHome: TRzTabSheet;
    tsAdministration: TRzTabSheet;
    pnlAddEmployee: TRzPanel;
    imgAddEmployee: TImage;
    pnlCancel: TRzPanel;
    imgCancel: TImage;
    pnlAddPAF: TRzPanel;
    imgAddPAF: TImage;
    pnlEmployeeSearch: TRzPanel;
    imgEmployeeSearch: TImage;
    pnlSave: TRzPanel;
    imgSave: TImage;
    lblWelcome: TRzLabel;
    pnlSettings: TRzPanel;
    imgSettings: TImage;
    pnlPendingPAF: TRzPanel;
    imgPendingPAF: TImage;
    pnlSecurity: TRzPanel;
    imgSecurity: TImage;
    pnlLeaves: TRzPanel;
    imgLeaves: TImage;
    procedure FormCreate(Sender: TObject);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCloseClick(Sender: TObject);
    procedure imgAddEmployeeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAddEmployeeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgSaveClick(Sender: TObject);
    procedure imgCancelClick(Sender: TObject);
    procedure acSearchEmployeeExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgMinimizeClick(Sender: TObject);
    procedure imgAddEmployeeClick(Sender: TObject);
    procedure imgEmployeeSearchClick(Sender: TObject);
    procedure imgAddPAFClick(Sender: TObject);
    procedure imgPendingPAFClick(Sender: TObject);
    procedure imgSecurityClick(Sender: TObject);
    procedure imgLeavesClick(Sender: TObject);
  private
    { Private declarations }
    DOCKED_FORM: TForms;
    procedure SetCaptions;
    procedure Cancel;
    procedure Save;
  public
    { Public declarations }
    procedure DockForm(const fm: TForms; AObject: TObject = nil); overload;
    procedure DockForm(const fm: TForms; const title: string = ''); overload;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  EmployeeDrawer, NewIntf, SaveIntf, FormsUtil, HRISDialogs, EmployeeSearch, Employee,
  HRISGlobal, PafMain, PafController, PafListPending, SecurityMain, LeaveMain;

procedure TfrmMain.pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmMain.DockForm(const fm: TForms; AObject: TObject);
var
  frm: TForm;
  control: integer;
begin
  //if (pnlDockMain.ControlCount = 0) or (DOCKED_FORM <> fm) then
  begin
    control := 0;

    while control < pnlDockMain.ControlCount do
    begin
      if pnlDockMain.Controls[control] is TForm then
      begin
        (pnlDockMain.Controls[control] as TForm).Close;
        (pnlDockMain.Controls[control] as TForm).Free;
      end;

      Inc(control);
    end;

    // instantiate form
    case fm of
      fmEmployeeDrawer: frm := TfrmEmployeeDrawer.Create(Application,AObject as TEmployee);
      fmPaf: frm := TfrmPafMain.Create(Application, AObject as TPafController);
      fmPendingPaf: frm := TfrmPafListPending.Create(Application);
      fmSecurity: frm := TfrmSecurityMain.Create(Application);
      fmLeaveMain: frm := TfrmLeaveMain.Create(Application);
      else
        frm := nil;
    end;

    if Assigned(frm) then
    begin
      DOCKED_FORM := fm;

      frm.ManualDock(pnlDockMain);
      frm.Show;
    end;
  end;
end;

procedure TfrmMain.Save;
var
  intf: ISave;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm, ISave, intf) then
        if intf.Save then ShowConfirmationBox2;
  except
  //  on e: Exception do
  //    ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.Cancel;
var
  intf: ISave;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm, ISave, intf) then
        intf.Cancel;
  except
    on e: Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.DockForm(const fm: TForms; const title: string);
begin

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DOCKED_FORM := fmNone;

  Height := 700; // for some reason form keeps on resizing...

  // hide menu bar
  Self.Menu := nil;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  SetCaptions;
end;

procedure TfrmMain.imgAddEmployeeClick(Sender: TObject);
begin
  DockForm(fmEmployeeDrawer,nil);
end;

procedure TfrmMain.imgAddEmployeeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ButtonDown(Sender);
end;

procedure TfrmMain.imgAddEmployeeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ButtonUp(Sender);
end;

procedure TfrmMain.imgAddPAFClick(Sender: TObject);
begin
  DockForm(fmPaf,nil);
end;

procedure TfrmMain.imgCancelClick(Sender: TObject);
begin
  Cancel;
end;

procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
  Cancel;
  Application.Terminate;
end;

procedure TfrmMain.imgEmployeeSearchClick(Sender: TObject);
var
  LEmployee: TEmployee;
begin
  LEmployee := TEmployee.Create;

  with TfrmEmployeeSearch.Create(nil,LEmployee) do
  try
    ShowModal;
    if ModalResult = mrOK then DockForm(fmEmployeeDrawer,LEmployee as TObject)
    else LEmployee.Free;
  finally
    Free;
  end;
end;

procedure TfrmMain.imgLeavesClick(Sender: TObject);
begin
  DockForm(fmLeaveMain,nil);
end;

procedure TfrmMain.imgMinimizeClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmMain.imgPendingPAFClick(Sender: TObject);
begin
  DockForm(fmPendingPaf,nil);
end;

procedure TfrmMain.imgSaveClick(Sender: TObject);
begin
  Save;
end;

procedure TfrmMain.imgSecurityClick(Sender: TObject);
begin
  DockForm(fmSecurity,nil);
end;

procedure TfrmMain.acSearchEmployeeExecute(Sender: TObject);
var
  intf: INew;
begin
  try
    if pnlDockMain.ControlCount > 0 then
      if Supports(pnlDockMain.Controls[0] as TForm,INew,intf) then
        intf.New;
  except
    on e:Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.SetCaptions;
begin
//  lblCaption.Caption := ifn.AppName + ' - ' + ifn.AppDescription;
  lblWelcome.Caption := 'Welcome back ' + HRIS.User.FirstName + '.';
  lblDate.Caption := 'Today is ' + FormatDateTime('mmmm dd, yyyy', HRIS.CurrentDate);
//  lblLocation.Caption := 'Location: ' + ifn.GetLocationNameByCode(ifn.LocationCode);
  lblVersion.Caption := 'Version ' + HRIS.Version;
end;

end.
