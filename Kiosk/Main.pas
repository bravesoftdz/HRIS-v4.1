unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzBmpBtn, RzButton, RefreshIntf,
  DockIntf, JvExControls;

type
  TfrmMain = class(TfrmBase, IDock)
    pnlTitle: TRzPanel;
    imgClose: TImage;
    lblCaption: TRzLabel;
    pnlMain: TRzPanel;
    pnlTimelog: TRzPanel;
    btnTimelog: TRzShapeButton;
    imgTimelog: TImage;
    pnlDockMain: TRzPanel;
    lblWelcome: TRzLabel;
    pnlLeave: TRzPanel;
    btnLeave: TRzShapeButton;
    imgLeaveBtn: TImage;
    pnlForApproval: TRzPanel;
    btnForApproval: TRzShapeButton;
    imgForApproval: TImage;
    RzPanel1: TRzPanel;
    btnSynchronise: TRzShapeButton;
    imgSynchronise: TImage;
    RzPanel2: TRzPanel;
    btnOverride: TRzShapeButton;
    imgOverride: TImage;
    pnlUndertime: TRzPanel;
    btnUndertime: TRzShapeButton;
    imgUndertimeBtn: TImage;
    lblLocation: TRzLabel;
    lblSettings: TRzLabel;
    procedure imgCloseClick(Sender: TObject);
    procedure btnTimelogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnForApprovalClick(Sender: TObject);
    procedure btnUndertimeClick(Sender: TObject);
    procedure btnSynchroniseClick(Sender: TObject);
    procedure lblSettingsClick(Sender: TObject);
    procedure btnOverrideClick(Sender: TObject);
    procedure pnlTitleDblClick(Sender: TObject);
  private
    { Private declarations }
    const MSG_RUN_ONSHOW  =  WM_USER + 1000;
    procedure HandleRunOnShow(var Msg:TMessage);  message MSG_RUN_ONSHOW;
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
  TimelogYear, HRISGlobal, TimelogData, UndertimeDetails, ForApproval, SyncMain,
  TimelogPayPeriod, SettingsMain, OverrideDetails;

procedure TfrmMain.DockForm(const fm: TForms; const title: string);
var
  frm: TForm;
  control: integer;
begin
  // if (pnlDockMain.ControlCount = 0) or ((pnlDockMain.ControlCount > 0) and
  //  ((pnlDockMain.Controls[0].ClassType <> frm.ClassType))) then

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

    pnlDockMain.Update;

    Application.ProcessMessages;

    // instantiate form
    case fm of
      fmTimelogYear: frm := TfrmTimelogYear.Create(Application);
      fmUndertime: frm := TfrmUndertimeDetails.Create(Application);
      fmForApproval: frm := TfrmForApproval.Create(Application);
      fmSynchronisation: frm := TfrmSyncMain.Create(Application);
      fmTimelogPayPeriod: frm := TfrmTimelogPayPeriod.Create(Application);
      fmSettings: frm := TfrmSettingsMain.Create(Application);
    else
      frm := TForm.Create(Application);
    end;

    frm.ManualDock(pnlDockMain);
    frm.Show;
  end;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
  lblCaption.Caption := 'Kiosk ver. ' + HRIS.Version;
  lblWelcome.Caption := 'Welcome back ' + HRIS.Employee.Name + '.';
  lblLocation.Caption := 'Location: ' + HRIS.GetLocationNameByCode(HRIS.LocationCode);

  dmTimelog := TdmTimelog.Create(self);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  inherited;
  PostMessage(Handle,MSG_RUN_ONSHOW,0,0);
end;

procedure TfrmMain.HandleRunOnShow(var Msg:TMessage);
begin
  DockForm(fmTimelogPayPeriod,'');
end;

procedure TfrmMain.btnTimelogClick(Sender: TObject);
begin
  inherited;
  DockForm(fmTimelogPayPeriod,'');
end;

procedure TfrmMain.btnUndertimeClick(Sender: TObject);
var
  intf: IRefresh;
begin
  inherited;
  with TfrmUndertimeDetails.Create(self) do
  begin
    ShowModal;

    if ModalResult = mrOk then
    begin
      if Supports(pnlDockMain.Controls[0] as TForm,IRefresh,intf) then
        intf.RefreshDisplay;
    end;

    Free;
  end;
end;

procedure TfrmMain.DockForm(const fm: TForms; AObject: TObject);
begin

end;

procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.lblSettingsClick(Sender: TObject);
begin
  inherited;
  DockForm(fmSettings,'');
end;

procedure TfrmMain.pnlTitleDblClick(Sender: TObject);
begin
  inherited;
  Application.Minimize;
end;

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

procedure TfrmMain.btnOverrideClick(Sender: TObject);
var
  intf: IRefresh;
begin
  inherited;
  with TfrmOverrideDetails.Create(self) do
  begin
    ShowModal;

    if ModalResult = mrOk then
    begin
      if Supports(pnlDockMain.Controls[0] as TForm,IRefresh,intf) then
        intf.RefreshDisplay;
    end;

    Free;
  end;
end;

procedure TfrmMain.btnSynchroniseClick(Sender: TObject);
begin
  inherited;
  DockForm(fmSynchronisation,'');
end;

procedure TfrmMain.btnForApprovalClick(Sender: TObject);
begin
  inherited;
  DockForm(fmForApproval,'');
end;

end.
