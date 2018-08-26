unit BaseCalendar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  RzPanel, Vcl.Grids, RzGrids, RzCmboBx, Vcl.ExtCtrls, Vcl.Mask, RzEdit,
  RzBtnEdt;

type
  TfrmBaseCalendar = class(TfrmBaseDocked)
    grCalendar: TRzStringGrid;
    cmbPeriod: TRzComboBox;
    pnlCalendar: TRzPanel;
    RzLabel16: TRzLabel;
    pnlColorLegend: TRzPanel;
    RzLabel8: TRzLabel;
    shBusinessTrip: TShape;
    shLeave: TShape;
    RzLabel7: TRzLabel;
    RzLabel6: TRzLabel;
    shUndertime: TShape;
    RzLabel5: TRzLabel;
    shOverride: TShape;
    RzLabel4: TRzLabel;
    shIncomplete: TShape;
    RzLabel3: TRzLabel;
    shComplete: TShape;
    RzLabel2: TRzLabel;
    shHoliday: TShape;
    RzLabel18: TRzLabel;
    bteFilter: TRzButtonEdit;
    shSunday: TShape;
    RzLabel19: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure cmbPeriodChange(Sender: TObject);
    procedure bteFilterButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bteFilterAltBtnClick(Sender: TObject);
    procedure grCalendarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure SetColours;
  public
    { Public declarations }
  protected
    procedure InitForm; virtual; abstract;
    procedure PopulateCalendar(const fetch: boolean = true); virtual; abstract;
    procedure PopulatePeriod; virtual; abstract;
    procedure InitCalendar; virtual; abstract;
    procedure ClearCalendar; virtual; abstract;
    procedure RefreshDisplay; virtual;
  end;

implementation

{$R *.dfm}

uses
  FilterSelect, ResourceFilter, TimeLogs, HRISGlobal;

procedure TfrmBaseCalendar.bteFilterAltBtnClick(Sender: TObject);
begin
  inherited;
  // clear the filter
  if resFilter.FilterType <> ftNone then
  begin
    resFilter.Clear;
    bteFilter.Clear;
    RefreshDisplay;
  end;
end;

procedure TfrmBaseCalendar.bteFilterButtonClick(Sender: TObject);
begin
  with TfrmFilterSelect.Create(nil) do
  begin
    ShowModal;

    if ModalResult = mrOK then
    begin
      bteFilter.Text := resFilter.FilterTypeName + ' - ' + resFilter.Name;
      RefreshDisplay;
    end;
  end;
end;

procedure TfrmBaseCalendar.cmbPeriodChange(Sender: TObject);
begin
  inherited;
  PopulateCalendar;
end;

procedure TfrmBaseCalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  resFilter.Free;
end;

procedure TfrmBaseCalendar.FormCreate(Sender: TObject);
begin
  inherited;

  resFilter := TResourceFilter.Create;

  SetColours;

  // Note: DO NOT mess with the sequence
  InitForm;
  PopulatePeriod;
  InitCalendar;
  PopulateCalendar;
end;

procedure TfrmBaseCalendar.grCalendarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbRight then grCalendar.Perform(WM_LBUTTONDOWN, 0, MakeLParam(Word(X), Word(Y)));
end;

procedure TfrmBaseCalendar.RefreshDisplay;
begin
  tlogs.GroupNumber := 0;
  PopulateCalendar(false);
end;

procedure TfrmBaseCalendar.SetColours;
begin
  with HRIS.Settings.CalendarColours, grCalendar do
  begin
    shHoliday.Brush.Color := Holiday;
    shComplete.Brush.Color := Complete;
    shIncomplete.Brush.Color := Incomplete;
    shOverride.Brush.Color := Ovrride;
    shUndertime.Brush.Color := Undertime;
    shLeave.Brush.Color := Leave;
    shBusinessTrip.Brush.Color := BusinessTrip;
    shSunday.Brush.Color := Sunday;

    // grid lines
    LineColor := GridLine;
    FixedLineColor := GridLine;
  end;
end;

end.
