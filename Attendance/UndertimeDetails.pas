unit UndertimeDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, Vcl.StdCtrls,
  RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, DateUtils,
  Vcl.Grids, RzGrids, RzRadChk, RzDBChk, Vcl.DBCtrls, RzDBCmbo, Vcl.Mask,
  RzEdit, RzDBEdit, UndertimeLogs, UndertimeLog, RzBtnEdt, System.UITypes;

type
  TSelDate = class(TObject)
  strict private
    FDate: TDate;
  public
    property Date: TDate read FDate write FDate;    
    constructor Create(const dt: TDate);
  end;

type
  TfrmUndertimeDetails = class(TfrmBasePopupDetail)
    pnlAM: TRzPanel;
    RzLabel7: TRzLabel;
    lblDate: TRzLabel;
    grDateSelector: TRzStringGrid;
    dbluReasonAM: TRzDBLookupComboBox;
    chbAM: TRzCheckBox;
    RzLabel1: TRzLabel;
    pnlPM: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    dbluReasonPM: TRzDBLookupComboBox;
    chbPaidPM: TRzDBCheckBox;
    chbPM: TRzCheckBox;
    dteFromAM: TRzDateTimeEdit;
    dteUntilAM: TRzDateTimeEdit;
    dteFromPM: TRzDateTimeEdit;
    dteUntilPM: TRzDateTimeEdit;
    chbPaidAM: TRzDBCheckBox;
    bteEmployee: TRzButtonEdit;
    RzLabel5: TRzLabel;
    chbCloseOnSave: TRzCheckBox;
    lblStatusAM: TRzLabel;
    lblStatusPM: TRzLabel;
    procedure grDateSelectorDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure chbAMClick(Sender: TObject);
    procedure chbPMClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dteFromAMInvalidTime(Sender: TObject; var KeepFocused,
      KeepInvalidText: Boolean; var NewTime: TDateTime);
    procedure dteUntilAMInvalidTime(Sender: TObject; var KeepFocused,
      KeepInvalidText: Boolean; var NewTime: TDateTime);
    procedure grDateSelectorClick(Sender: TObject);
    procedure bteEmployeeButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SetUnboundControls;
    procedure PopulateDateSelector(const sd: TDate);
    procedure EnableControls(Sender: TObject; const period: TPeriod = pdAm);
    procedure Initialise;
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    function ValidEntry: boolean; override;
  end;

var
  frmUndertimeDetails: TfrmUndertimeDetails;

implementation

{$R *.dfm}

uses
  HRISGlobal, TimelogData, FormsUtil, HRISDialogs, EmployeeSearch, Employee;

constructor TSelDate.Create(const dt: TDate);
begin
  FDate := dt;
end;

procedure TfrmUndertimeDetails.EnableControls(Sender: TObject; const period: TPeriod = pdAm);
var
  dt: TDate;
  ut: TUndertimeLog;
  utIndex: integer;
begin
  dt := TSelDate(grDateSelector.Objects[grDateSelector.Col,grDateSelector.Row]).Date;

  if period = pdAm then
  begin
    utIndex := utLogs.IndexOf(dt,period);
    ut := utLogs.UndertimeLogs[utIndex];

    dteFromAM.Enabled := (Sender as TRzCheckBox).Checked;
    dteUntilAM.Enabled := (Sender as TRzCheckBox).Checked;
    dbluReasonAM.Enabled := (Sender as TRzCheckBox).Checked;
    chbPaidAM.ReadOnly := not (Sender as TRzCheckBox).Checked;

    // default
    if ((Sender as TRzCheckBox).Checked) and (utIndex = -1) then
    begin
      dteFromAM.Time := EncodeTime(8,30,0,0);
      dteUntilAM.Time := EncodeTime(9,0,0,0);
      dbluReasonAM.ClearKeyValue;
    end;

    // readOnly
    chbAM.ReadOnly := (Assigned(ut)) and (not ut.IsNew);
    dteFromAM.ReadOnly := (Assigned(ut)) and (not ut.EditAllowed);
    dteUntilAM.ReadOnly := (Assigned(ut)) and (not ut.EditAllowed);
    dbluReasonAM.ReadOnly := (Assigned(ut)) and (not ut.EditAllowed);
    chbPaidAM.ReadOnly := (Assigned(ut)) and (not ut.EditAllowed);
  end
  else if period = pdPm then
  begin
    utIndex := utLogs.IndexOf(dt,period);
    ut := utLogs.UndertimeLogs[utIndex];

    dteFromPM.Enabled := (Sender as TRzCheckBox).Checked;
    dteUntilPM.Enabled := (Sender as TRzCheckBox).Checked;
    dbluReasonPM.Enabled := (Sender as TRzCheckBox).Checked;
    chbPaidPM.ReadOnly := not (Sender as TRzCheckBox).Checked;

    // default
    if ((Sender as TRzCheckBox).Checked) and (utIndex = -1) then
    begin
      dteFromPM.Time := EncodeTime(1,0,0,0);
      dteUntilPM.Time := EncodeTime(1,30,0,0);
    end;

    // readOnly
    chbPM.ReadOnly := (Assigned(ut)) and (not ut.IsNew);
    dteFromPM.ReadOnly := (Assigned(ut)) and (not ut.EditAllowed);
    dteUntilPM.ReadOnly := (Assigned(ut)) and (not ut.EditAllowed);
    dbluReasonPM.ReadOnly := (Assigned(ut)) and (not ut.EditAllowed);
    chbPaidPM.ReadOnly := (Assigned(ut)) and (not ut.EditAllowed);
  end;

  // append or cancel
  if ((Sender as TRzCheckBox).Checked) and (utLogs.IndexOf(dt,period) = -1) then
    TUndertimeLog.Append(period)
  else if not (Sender as TRzCheckBox).Checked then
    TUndertimeLog.Cancel(period);
end;

procedure TfrmUndertimeDetails.chbAMClick(Sender: TObject);
begin
  inherited;
  EnableControls(Sender);
end;

procedure TfrmUndertimeDetails.chbPMClick(Sender: TObject);
begin
  inherited;
  EnableControls(Sender,pdPM);
end;

procedure TfrmUndertimeDetails.dteFromAMInvalidTime(Sender: TObject;
  var KeepFocused, KeepInvalidText: Boolean; var NewTime: TDateTime);
begin
  inherited;
  ShowErrorBox('Please enter a valid time.');

  KeepFocused := true;
  KeepInvalidText := false;
end;

procedure TfrmUndertimeDetails.dteUntilAMInvalidTime(Sender: TObject;
  var KeepFocused, KeepInvalidText: Boolean; var NewTime: TDateTime);
begin
  inherited;
  ShowErrorBox('Please enter a valid time.');

  KeepFocused := true;
  KeepInvalidText := false;
end;

procedure TfrmUndertimeDetails.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if (ModalResult = mrOK) and (not chbCloseOnSave.Checked) then
  begin
    Action := caNone;
    ShowConfirmationBox;
  end
  else
  begin
    utLogs.Destroy;
    empl.Destroy;
  end;
end;

procedure TfrmUndertimeDetails.FormCreate(Sender: TObject);
begin
  inherited;
  // set default employee to user
  empl := TEmployee.Create;
  empl.IdNumber := HRIS.Employee.IdNumber;
  empl.FirstName := HRIS.Employee.FirstName;
  empl.LastName := HRIS.Employee.LastName;

  Initialise;

  OpenDropdownDataSources(pnlAM);
  OpenDropdownDataSources(pnlPM);
end;

procedure TfrmUndertimeDetails.Initialise;
begin
  utLogs := TUndertimeLogs.Create;

  utLogs.Retrieve(IncDay(HRIS.CurrentDate,-15),IncDay(HRIS.CurrentDate,+15),empl.IdNumber);

  PopulateDateSelector(IncDay(HRIS.CurrentDate,-15));

  SetUnboundControls;

  EnableControls(chbAM);
  EnableControls(chbPM,pdPM);

  bteEmployee.Text := empl.Name;
end;

procedure TfrmUndertimeDetails.grDateSelectorClick(Sender: TObject);
begin
  inherited;
  SetUnboundControls;
  EnableControls(chbAM);
  EnableControls(chbPM,pdPM);
end;

procedure TfrmUndertimeDetails.grDateSelectorDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  dt: TDate;
begin
  inherited;
  dt := TSelDate(grDateSelector.Objects[ACol,ARow]).Date;

  if utLogs.UndertimeExists(dt) then
  begin
    if gdSelected in State then
      grDateSelector.Canvas.Brush.Color := $006CD900
    else
      grDateSelector.Canvas.Brush.Color := $00FF4AA5
  end
  else if gdSelected in State then
    grDateSelector.Canvas.Brush.Color := $0059ACFF;

  Rect.Left := Rect.Left - 4;
  grDateSelector.Canvas.FillRect(Rect);
  grDateSelector.Canvas.TextOut(Rect.Left + 8, Rect.Top + 8, WrapText(grDateSelector.Cells[ACol,ARow],1));
end;

procedure TfrmUndertimeDetails.SetUnboundControls;
var
  dt: TSelDate;
  indexAM, indexPM: integer;
  ut: TUndertimeLog;
begin
  with grDateSelector do dt := (Objects[Col,0] as TSelDate);

  lblDate.Caption := 'Undertime log for ' + FormatDateTime('mmmm dd, yyyy dddd', dt.Date) + '.';

  indexAM := utLogs.IndexOf(dt.Date,pdAM);
  indexPM := utLogs.IndexOf(dt.Date,pdPM);

  // morning undertime
  if indexAM > -1 then
  begin
    ut := utLogs.UndertimeLogs[indexAM];
    dteFromAM.Time := ut.TimeFrom;
    dteUntilAM.Time := ut.TimeUntil;
    utLogs.Locate(dt.Date,pdAM);
  end
  else
  begin
    dteFromAM.Clear;
    dteUntilAM.Clear;
    dbluReasonAM.ClearKeyValue;
  end;

  chbAM.Checked := indexAM > -1;

  // status
  if Assigned(utLogs.UndertimeLogs[indexAM]) then  lblStatusAM.Caption := utLogs.UndertimeLogs[IndexAM].StatusName
  else lblStatusAM.Caption := '';

  // afternoon undertime
  if indexPM > -1 then
  begin
    ut := utLogs.UndertimeLogs[indexPM];
    dteFromPM.Time := ut.TimeFrom;
    dteUntilPM.Time := ut.TimeUntil;
    utLogs.Locate(dt.Date,pdPM);
  end
  else
  begin
    dteFromPM.Clear;
    dteUntilPM.Clear;
    dbluReasonPM.ClearKeyValue;
  end;

  chbPM.Checked := indexPM > -1;

  // status
  if Assigned(utLogs.UndertimeLogs[indexPM]) then  lblStatusPM.Caption := utLogs.UndertimeLogs[IndexPM].StatusName
  else lblStatusPM.Caption := '';
end;

procedure TfrmUndertimeDetails.PopulateDateSelector(const sd: TDate);
var
  i,r, c, colCnt, rowCnt, def: integer;
  dt: TDate;
begin
  with grDateSelector do
  begin
    rowCnt := RowCount - 1;
    colCnt := ColCount - 1;

    def := 0; // storage for default

    i := 0; // used to increment the date

    for r := 0 to rowCnt do
    begin
      c := 0;
      while c <= colCnt do
      begin
        dt := IncDay(sd,i);

        // exclude Sundays
        if DayOfTheWeek(dt) = DaySunday then
        begin
          Inc(i);
          Continue;
        end;

        Cells[c,r] := FormatDateTime('mmm dd',dt);
        Objects[c,r] := TSelDate.Create(dt);

        // default
        if dt = HRIS.CurrentDate then def := c;

        Inc(i);
        Inc(c);
      end;
    end;

    // set default selection
    Row := 0;
    Col := def;
    LeftCol := def;
  end;
end;

procedure TfrmUndertimeDetails.Save;
var
  ut: TUndertimeLog;
begin
  ut := TUndertimeLog.Create;
  ut.DateString := FormatDateTime('yyyy-mm-dd',
        TSelDate(grDateSelector.Objects[grDateSelector.Col,grDateSelector.Row]).Date);

  if chbAM.Checked then
  begin
    ut.Period := pdAm;
    ut.Employee := empl;
    ut.TimeFrom := dteFromAM.Time;
    ut.TimeUntil := dteUntilAM.Time;
    ut.Save;

    utLogs.AddUndertime(ut,true);
  end;

  if chbPM.Checked then
  begin
    ut.Period := pdPm;
    ut.Employee := empl;
    ut.TimeFrom := dteFromPM.Time;
    ut.TimeUntil := dteUntilPM.Time;
    ut.Save;

    utLogs.AddUndertime(ut,true);
  end;
end;

procedure TfrmUndertimeDetails.bteEmployeeButtonClick(Sender: TObject);
begin
  with TfrmEmployeeSearch.Create(self) do
  begin
    ShowModal;

    if ModalResult = mrOk then Initialise;

    Free;
  end;
end;

procedure TfrmUndertimeDetails.Cancel;
begin

end;

function TfrmUndertimeDetails.ValidEntry: boolean;
var
  error: string;
  vFromAM, vUntilAM, vFromPM, vUntilPM: TTime;

  procedure GetValidTimeRange;
  begin
    with grDateSelector do
    begin
      if DayOfTheWeek(TSelDate(Objects[Col,Row]).Date) = DaySaturday then
      begin
        vFromAM := EncodeTime(8,0,0,0);
        vUntilAM := EncodeTime(12,0,0,0);
      end
      else
      begin
        vFromAM := EncodeTime(8,30,0,0);
        vUntilAM := EncodeTime(12,0,0,0);
        vFromPM := EncodeTime(13,0,0,0);
        vUntilPM := EncodeTime(17,30,0,0);
      end;
    end
  end;
  
begin
  GetValidTimeRange;

  error := '';
  
  if chbAM.Checked then
  begin
    if (Trim(dteFromAM.Text) = '') or (Trim(dteUntilAM.Text) = '') then
      error := 'Please enter START and END times.'
    else if dbluReasonAM.Text = '' then
      error := 'Please select a reason.'
    else if (CompareTime(dteFromAM.Time,vFromAM) = -1) or (CompareTime(dteFromAM.Time,vUntilAM) = 1) then
      error := 'Invalid value for START time.'   
    else if CompareTime(dteFromAM.Time,dteUntilAM.Time) > -1 then
      error := 'END time should be greater than START time.'
    else if MinutesBetween(dteUntilAM.Time,dteFromAM.Time) > HRIS.MaximumUndertime then
      error := 'Undertime is more than the time allowed.';   
  end;

  if (error = '') and (chbPM.Checked)then
  begin
    if (Trim(dteFromPM.Text) = '') or (Trim(dteUntilPM.Text) = '') then
      error := 'Please enter START and END times.'
    else if dbluReasonPM.Text = '' then
      error := 'Please select a reason.'
    else if (CompareTime(IncHour(dteFromPM.Time,12),vFromPM) = -1) 
      or (CompareTime(IncHour(dteFromPM.Time,12),vUntilPM) = 1) then
      error := 'Invalid value for START time.'   
    else if CompareTime(dteFromPM.Time,dteUntilPM.Time) > -1 then
      error := 'END time should be greater than START time.'
    else if MinutesBetween(dteUntilPM.Time,dteFromPM.Time) > HRIS.MaximumUndertime then
      error := 'Undertime is more than the time allowed.';   
  end;

  if error <> '' then ShowErrorBox(error);

  Result := error = '';
end;

end.
