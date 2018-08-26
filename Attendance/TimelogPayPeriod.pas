unit TimelogPayPeriod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseCalendar, Vcl.StdCtrls, RzCmboBx,
  Vcl.Grids, RzGrids, Vcl.ExtCtrls, RzPanel, RzLabel, DateUtils, Vcl.Mask,
  RzEdit, RzBtnEdt;

type
  TfrmTimelogPayPeriod = class(TfrmBaseCalendar)
    lblNext: TLabel;
    lblPrevious: TLabel;
    lblStatus: TRzLabel;
    lblSwitchView: TRzLabel;
    procedure cmbPeriodChange(Sender: TObject);
    procedure grCalendarDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure grCalendarDblClick(Sender: TObject);
    procedure lblNextClick(Sender: TObject);
    procedure lblPreviousClick(Sender: TObject);
    procedure lblSwitchViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure InitForm; override;
    procedure PopulateCalendar(const fetch: boolean = true); override;
    procedure PopulatePeriod; override;
    procedure InitCalendar; override;
    procedure ClearCalendar; override;
  end;

var
  frmTimelogPayPeriod: TfrmTimelogPayPeriod;

implementation

{$R *.dfm}

{ TfrmTimelogPayPeriod }

uses
  DockIntf, FormsUtil, PayrollCode, Timelogs, Timelog, AttendanceUtils,
  TimelogUtils, TimelogDetails, ResourceFilter;

procedure TfrmTimelogPayPeriod.ClearCalendar;
var
  c, colCnt, r, rowCnt: integer;
begin
  with grCalendar do
  begin
    colCnt := ColCount - 1;
    rowCnt := RowCount - 1;

    for r := 1 to rowCnt do
      for c := 0 to colCnt do
      begin
        if c = 0 then Cells[c,r] := ''
        else Objects[c,r] := nil;
      end;
  end;
end;

procedure TfrmTimelogPayPeriod.cmbPeriodChange(Sender: TObject);
begin
  InitCalendar;
  inherited;
end;

procedure TfrmTimelogPayPeriod.grCalendarDblClick(Sender: TObject);
var
  r, c: integer;
begin
  with grCalendar do
  begin
    r := Row;
    c := Col;

    if Assigned(Objects[c,r]) then
    begin
      tlog := TTimelog(Objects[c,r]);
      with TfrmTimelogDetails.Create(self) do
      begin
        ShowModal;
        Free;
      end;
    end;
  end;
end;

procedure TfrmTimelogPayPeriod.grCalendarDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  log: TTimelog;
begin
  inherited;
  with grCalendar do
  begin
    if Assigned(Objects[ACol,ARow]) then
    begin
      log := Objects[ACol,ARow] as TTimelog;
      SimpleView(grCalendar,log,Rect);
    end
  end;
end;

procedure TfrmTimelogPayPeriod.InitCalendar;
var
  pc: TPayrollCode;
  i, days: integer;
begin
  inherited;
  // rows
  with grCalendar do
  begin
    RowCount := 13;

    ColWidths[0] := 195;

    pc := TPayrollCode(cmbPeriod.Items.Objects[cmbPeriod.ItemIndex]);

    days := DaysBetween(pc.DateFrom,pc.DateUntil);

    ColCount := 17;

    for i := 0 to ColCount - 1 do
    begin
      Cells[i+1,0] := '';

      if i <= days then Cells[i+1,0] := FormatDateTime('mmm dd',pc.DateFrom + i);
    end;
  end;
end;

procedure TfrmTimelogPayPeriod.InitForm;
begin
  inherited;

end;

procedure TfrmTimelogPayPeriod.lblNextClick(Sender: TObject);
begin
  inherited;
  if tlogs.CurrentIndex < tlogs.LogsCount then
  begin
    tlogs.GroupNumber := tlogs.GroupNumber + 1;
    PopulateCalendar(false);
  end;
end;

procedure TfrmTimelogPayPeriod.lblPreviousClick(Sender: TObject);
begin
  inherited;
  if tlogs.GroupNumber > 0 then
  begin
    tlogs.GroupNumber := tlogs.GroupNumber - 1;
    PopulateCalendar(false);
  end;
end;

procedure TfrmTimelogPayPeriod.PopulateCalendar(const fetch: boolean);
var
  i, cnt, c, r, days: integer;
  log: TTimelog;
  fd, td: TDate;
  pc: TPayrollCode;
  showLog: boolean;

  function CompareFilter: boolean;
  begin
    Result := false;

    case resFilter.FilterType of
      ftNone: Result := true;
      ftBranch: Result := log.Employee.LocationCode = resFilter.Code;
      ftDepartment: Result := log.Employee.DepartmentCode = resFilter.Code;
      ftPositionType: Result := log.Employee.PositionTypeCode = resFilter.Code;
    end;

  end;

begin
  ClearCalendar;

  pc := TPayrollCode.Create;

  showLog := false;

  with tlogs, grCalendar do
  begin
    // date params
    pc := TPayrollCode(cmbPeriod.Items.Objects[cmbPeriod.ItemIndex]);

    if fetch then
    begin
      tlogs := TTimelogs.Create;

      tlogs.PeriodView := pvPayroll;

      fd := pc.DateFrom;
      td := pc.DateUntil;

      lblStatus.Visible := true;
      cmbPeriod.Enabled := false;
      bteFilter.Enabled := false;

      Application.ProcessMessages;

      Retrieve(fd,td,'','');

      lblStatus.Visible := false;
      cmbPeriod.Enabled := true;
      bteFilter.Enabled := true;
      Application.ProcessMessages;
    end;

    ViewOption := cvoSimple;

    cnt := LogsCount - 1;
    days := DaysBetween(pc.DateFrom,pc.DateUntil) + 1;

    r := 1; // grid row

    // log index
    if tlogs.GroupNumber <= 0 then i := 0
    else if resFilter.FilterType = ftNone then i := (tlogs.GroupNumber * tlogs.RecordsPerGroup * days)
    else i := tlogs.CurrentIndex;

    while (i <= cnt) and (r <= tlogs.RecordsPerGroup) do
    begin
      c := 1; // grid column
      while (c <= days) and (i <=cnt) do
      begin
        log := Items[i];

        showLog := CompareFilter;

        if showLog then
        begin
          if c = 1 then Cells[0,r] := log.Employee.Name; // add employee name
          Objects[c,r] := log;
          Inc(c);
        end;

        Inc(i);

        tlogs.CurrentIndex := i;
      end;

      if showLog then Inc(r);
    end; // end while
  end;
end;

procedure TfrmTimelogPayPeriod.PopulatePeriod;
begin
  inherited;
  PopulatePayrollPeriodComboBox(cmbPeriod);
end;

procedure TfrmTimelogPayPeriod.lblSwitchViewClick(Sender: TObject);
var
  intf: IDock;
begin
  if Supports(Application.MainForm,IDock,intf) then
    intf.DockForm(fmTimelogYear,'');
end;

end.
