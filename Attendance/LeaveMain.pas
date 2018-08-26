unit LeaveMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked2, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.Grids, RzGrids, BaseDocked, Vcl.Mask, RzEdit,
  RzBtnEdt, RzCmboBx, LeaveController, DateUtils;

type
  TCellDate = class
  private
    FDate: TDateTime;
  public
    property Date: TDateTime read FDate write FDate;
  end;

  TfrmLeaveMain = class(TfrmBaseDocked2)
    pnlCalendar1: TRzPanel;
    pnlCalendarHeader1: TRzPanel;
    RzPanel1: TRzPanel;
    grCalendar2: TRzStringGrid;
    pnlCalendarHeader2: TRzPanel;
    RzPanel3: TRzPanel;
    grCalendar3: TRzStringGrid;
    pnlCalendarHeader3: TRzPanel;
    RzPanel5: TRzPanel;
    grCalendar4: TRzStringGrid;
    pnlCalendarHeader4: TRzPanel;
    RzPanel7: TRzPanel;
    grCalendar5: TRzStringGrid;
    pnlCalendarHeader5: TRzPanel;
    RzPanel9: TRzPanel;
    grCalendar6: TRzStringGrid;
    pnlCalendarHeader6: TRzPanel;
    RzPanel11: TRzPanel;
    grCalendar7: TRzStringGrid;
    pnlCalendarHeader7: TRzPanel;
    RzPanel13: TRzPanel;
    grCalendar8: TRzStringGrid;
    pnlCalendarHeader8: TRzPanel;
    RzPanel15: TRzPanel;
    grCalendar9: TRzStringGrid;
    pnlCalendarHeader9: TRzPanel;
    RzPanel17: TRzPanel;
    grCalendar10: TRzStringGrid;
    pnlCalendarHeader10: TRzPanel;
    RzPanel19: TRzPanel;
    grCalendar11: TRzStringGrid;
    pnlCalendarHeader11: TRzPanel;
    RzPanel21: TRzPanel;
    grCalendar12: TRzStringGrid;
    pnlCalendarHeader12: TRzPanel;
    grCalendar1: TRzStringGrid;
    RzLabel1: TRzLabel;
    RzLabel18: TRzLabel;
    cmbYear: TRzComboBox;
    edEmployee: TRzButtonEdit;
    lblVacationCredits: TRzLabel;
    lblVacationAvailed: TRzLabel;
    lblVacationRemaining: TRzLabel;
    lblSickCredits: TRzLabel;
    lblSickAvailed: TRzLabel;
    lblSickRemaining: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    procedure grCalendar1Exit(Sender: TObject);
    procedure grCalendar1Enter(Sender: TObject);
    procedure grCalendar1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure edEmployeeButtonClick(Sender: TObject);
    procedure cmbYearChange(Sender: TObject);
  private
    { Private declarations }
    FController: TLeaveController;
    procedure InitCalendar;
    procedure PopulateCalendar;
    procedure RefreshForm;
  public
    { Public declarations }
  end;

const
  CALENDARS = 12;

implementation

{$R *.dfm}

uses
  Leave, AttendanceUtils, HRISDialogs, HRISGlobal;

procedure TfrmLeaveMain.cmbYearChange(Sender: TObject);
var
  fd, td: TDate;
begin
  inherited;
  GetDateParamsYear(StrToInt(cmbYear.Text),fd,td);

  FController.StartDate := fd;
  FController.EndDate := td;
  FController.Retrieve;

  PopulateCalendar;
end;

procedure TfrmLeaveMain.edEmployeeButtonClick(Sender: TObject);
begin
  inherited;
  FController.FindEmployee;
  FController.Retrieve;
end;

procedure TfrmLeaveMain.FormCreate(Sender: TObject);
var
  fd, td: TDate;
begin
  inherited;
  PopulateYear(cmbYear);

  FController := TLeaveController.Create;
  FController.OnUpdate := RefreshForm;

  GetDateParamsYear(StrToInt(cmbYear.Text),fd,td);

  FController.StartDate := fd;
  FController.EndDate := td;
  FController.Retrieve;

  PopulateCalendar;
end;

procedure TfrmLeaveMain.grCalendar1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  LCellDate: TCellDate;
  LGrid: TRzStringGrid;
begin
  try
    LGrid := (Sender as TRzStringGrid);
    with LGrid, LGrid.Canvas do
    begin
      Brush.Color := clWindow;

      Font.Size := 7;
      Font.Style := [];
      Font.Color := clBlack;

      // change colour of cells depending on status
      if Assigned(Objects[ACol,ARow]) then
      begin
        LCellDate := (Objects[ACol,ARow] as TCellDate);
        FController.Render(LGrid,LCellDate.Date,Rect);
      end;

      // change colour for Sundays
      // if ACol = 6 then Brush.Color := $00D9D9FF;

      if Focused then
      begin
        if gdSelected in State then
        begin
          Font.Size := 9;
          Font.Style := [fsBold];
          Font.Color := clRed;
        end
      end;

      FillRect(Rect);
      TextOut(Rect.Left + 2, Rect.Top + 2, Cells[ACol,ARow]);
    end;
  except
    on E: Exception do ShowErrorBox2('Check error at date ' + DateToStr(LCellDate.Date));
  end;
end;

procedure TfrmLeaveMain.grCalendar1Enter(Sender: TObject);
begin
  inherited;
  (Sender as TRzStringGrid).DefaultDrawing := true;
end;

procedure TfrmLeaveMain.grCalendar1Exit(Sender: TObject);
begin
  inherited;
  (Sender as TRzStringGrid).DefaultDrawing := false;
end;

procedure TfrmLeaveMain.InitCalendar;
var
  i, LRow, LCol: integer;
  LGrid: TRzStringGrid;
  LHeader: TRzPanel;
  selectedYear: string;
begin

  selectedYear := cmbYear.Text;

  // clear the calendars
  for i := 1 to CALENDARS do
  begin
    // change header caption
    LHeader := FindComponent('pnlCalendarHeader' + IntToStr(i)) as TRzPanel;
    case i of
      1: LHeader.Caption := 'January ' + selectedYear;
      2: LHeader.Caption := 'February ' + selectedYear;
      3: LHeader.Caption := 'March ' + selectedYear;
      4: LHeader.Caption := 'April ' + selectedYear;
      5: LHeader.Caption := 'May ' + selectedYear;
      6: LHeader.Caption := 'June ' + selectedYear;
      7: LHeader.Caption := 'July ' + selectedYear;
      8: LHeader.Caption := 'August ' + selectedYear;
      9: LHeader.Caption := 'September ' + selectedYear;
      10: LHeader.Caption := 'October ' + selectedYear;
      11: LHeader.Caption := 'November ' + selectedYear;
      12: LHeader.Caption := 'December ' + selectedYear;
    end;

    LGrid := FindComponent('grCalendar' + IntToStr(i)) as TRzStringGrid;
    for LRow := 0 to LGrid.RowCount - 1 do
      for LCol := 0 to LGrid.ColCount - 1 do
        LGrid.Cells[LCol,LRow] := '';
  end;
end;

procedure TfrmLeaveMain.PopulateCalendar;
const
  DAYS_IN_A_WEEK = 7;
var
  i, LRow, LCol: integer;
  mm, dd, yy, selectedYear: word;
  LGrid: TRzStringGrid;
  LCellDate: TCellDate;
  startDate, dt: TDateTime;
begin
  InitCalendar;

  selectedYear := StrToInt(cmbYear.Text);

  startDate := EncodeDate(selectedYear,1,1);

  for i := 0 to DaysInAYear(selectedYear) - 1 do
  begin
    dt := IncDay(startDate,i);

    DecodeDate(dt, yy, mm, dd);

    LGrid := FindComponent('grCalendar' + IntToStr(mm)) as TRzStringGrid;

    with LGrid do
    begin
      // find column and row
      // Note: first column is Monday
      if dd = 1 then
      begin
        LCol := DayOfTheWeek(dt) - 1;
        LRow := 0;
      end
      else
      begin
        if LCol = DAYS_IN_A_WEEK - 1 then
        begin
          LCol := 0;
          Inc(LRow);
        end
        else Inc(LCol);
      end;

      // display the day
      Cells[LCol,LRow] := IntToStr(dd);

      LCellDate := TCellDate.Create;
      LCellDate.Date := dt;

      Objects[LCol,LRow] := TObject(LCellDate);
    end;
  end;
end;

procedure TfrmLeaveMain.RefreshForm;
var
  i: integer;
  LGrid: TRzStringGrid;
begin
  if Assigned(FController.Employee) then
    edEmployee.Text := FController.Employee.NameSurnameFirst;

  // refresh the calendars
  for i := 1 to CALENDARS do
  begin
    LGrid := FindComponent('grCalendar' + IntToStr(i)) as TRzStringGrid;
    LGrid.Refresh;
  end;

  // credits
  lblVacationCredits.Caption := FormatFloat('0.0000',FController.VacationLeaveCredits);
  lblVacationAvailed.Caption := FormatFloat('0.0000',FController.VacationLeavesAvailed);
  lblVacationRemaining.Caption := FormatFloat('0.0000',FController.VacationLeavesRemaining);

  lblSickCredits.Caption := FormatFloat('0.0000',FController.SickLeaveCredits);
  lblSickAvailed.Caption := FormatFloat('0.0000',FController.SickLeavesAvailed);
  lblSickRemaining.Caption := FormatFloat('0.0000',FController.SickLeavesRemaining);
end;

end.
