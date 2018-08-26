unit SettingsMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzCommon;

type
  TfrmSettingsMain = class(TfrmBaseDocked)
    RzGroupBox2: TRzGroupBox;
    ceHoliday: TRzColorEdit;
    RzLabel1: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    ccCustom: TRzCustomColors;
    ceComplete: TRzColorEdit;
    ceIncomplete: TRzColorEdit;
    ceOverride: TRzColorEdit;
    ceUndertime: TRzColorEdit;
    ceLeave: TRzColorEdit;
    ceSunday: TRzColorEdit;
    lblDefaults: TRzLabel;
    RzLabel2: TRzLabel;
    ceGridLine: TRzColorEdit;
    RzLabel3: TRzLabel;
    ceBusinessTrip: TRzColorEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lblDefaultsClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadSettings;
    procedure SaveSettings;
  public
    { Public declarations }
  end;

var
  frmSettingsMain: TfrmSettingsMain;

implementation

{$R *.dfm}

uses
  HRISGlobal, AppUtil;

procedure TfrmSettingsMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
  inherited;
end;

procedure TfrmSettingsMain.FormCreate(Sender: TObject);
begin
  inherited;
  LoadSettings;
end;

procedure TfrmSettingsMain.lblDefaultsClick(Sender: TObject);
begin
  inherited;
  HRIS.Settings.CalendarColours.LoadDefaults;
  LoadSettings;
end;

procedure TfrmSettingsMain.LoadSettings;
begin
  // calendar colours
  with HRIS.Settings do
  begin
    ceHoliday.SelectedColor := CalendarColours.Holiday;
    ceComplete.SelectedColor := CalendarColours.Complete;
    ceIncomplete.SelectedColor := CalendarColours.Incomplete;
    ceOverride.SelectedColor := CalendarColours.Ovrride;
    ceUndertime.SelectedColor := CalendarColours.Undertime;
    ceLeave.SelectedColor := CalendarColours.Leave;
    ceBusinessTrip.SelectedColor := CalendarColours.BusinessTrip;
    ceSunday.SelectedColor := CalendarColours.Sunday;
    ceGridLine.SelectedColor := CalendarColours.GridLine;
  end;
end;

procedure TfrmSettingsMain.SaveSettings;
begin
  with HRIS.Settings do
  begin
    CalendarColours.Holiday := ceHoliday.SelectedColor;
    CalendarColours.Complete := ceComplete.SelectedColor;
    CalendarColours.Incomplete := ceIncomplete.SelectedColor;
    CalendarColours.Ovrride := ceOverride.SelectedColor;
    CalendarColours.Undertime := ceUndertime.SelectedColor;
    CalendarColours.Leave := ceLeave.SelectedColor;
    CalendarColours.BusinessTrip := ceBusinessTrip.SelectedColor;
    CalendarColours.Sunday := ceSunday.SelectedColor;
    CalendarColours.GridLine := ceGridLine.SelectedColor;

    Save;
  end;
end;

end.
