unit OverrideDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, BasePopup, RzButton, RzDBChk,
  Vcl.DBCtrls, RzDBCmbo, Vcl.Mask, RzEdit, RzRadChk, RzBtnEdt, Vcl.Grids,
  RzGrids, Ovrride, DateUtils;

type
  TSelDate = class(TObject)
  strict private
    FDate: TDate;
  public
    property Date: TDate read FDate write FDate;
    constructor Create(const dt: TDate);
  end;

type
  TfrmOverrideDetails = class(TfrmBasePopupDetail)
    grDateSelector: TRzStringGrid;
    pnlAM: TRzPanel;
    RzLabel7: TRzLabel;
    RzLabel1: TRzLabel;
    dbluReasonAM: TRzDBLookupComboBox;
    chbAM: TRzCheckBox;
    dteInAM: TRzDateTimeEdit;
    dteOutAM: TRzDateTimeEdit;
    pnlPM: TRzPanel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    dbluReasonPM: TRzDBLookupComboBox;
    chbPM: TRzCheckBox;
    dteInPM: TRzDateTimeEdit;
    dteOutPM: TRzDateTimeEdit;
    chbCloseOnSave: TRzCheckBox;
    lblDate: TRzLabel;
    RzLabel5: TRzLabel;
    bteEmployee: TRzButtonEdit;
    chbCancelledAM: TRzDBCheckBox;
    chbCancelledPM: TRzDBCheckBox;
    procedure bteEmployeeButtonClick(Sender: TObject);
    procedure grDateSelectorClick(Sender: TObject);
    procedure grDateSelectorDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure chbAMClick(Sender: TObject);
    procedure chbPMClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  frmOverrideDetails: TfrmOverrideDetails;

implementation

{$R *.dfm}

uses
  HRISGlobal, TimelogData, FormsUtil, HRISDialogs, EmployeeSearch, Employee,
  Overrides, AttendanceUtils;

procedure TfrmOverrideDetails.bteEmployeeButtonClick(Sender: TObject);
begin
  with TfrmEmployeeSearch.Create(self) do
  begin
    ShowModal;

    if ModalResult = mrOk then Initialise;

    Free;
  end;
end;

procedure TfrmOverrideDetails.Cancel;
begin
  inherited;

end;

procedure TfrmOverrideDetails.chbAMClick(Sender: TObject);
begin
  inherited;
  EnableControls(Sender);
end;

procedure TfrmOverrideDetails.chbPMClick(Sender: TObject);
begin
  inherited;
  EnableControls(Sender,pdPm);
end;

procedure TfrmOverrideDetails.EnableControls(Sender: TObject;
  const period: TPeriod);
var
  dt: TDate;
  ov: TOverride;
  ovIndex: integer;
begin
  dt := TSelDate(grDateSelector.Objects[grDateSelector.Col,grDateSelector.Row]).Date;

  if period = pdAm then
  begin
    ovIndex := ovs.IndexOf(dt,period);
    ov := ovs.Overrides[ovIndex];

    dteInAM.Enabled := (Sender as TRzCheckBox).Checked;
    dteOutAM.Enabled := (Sender as TRzCheckBox).Checked;
    dbluReasonAM.Enabled := (Sender as TRzCheckBox).Checked;
    chbCancelledAM.ReadOnly := not (Sender as TRzCheckBox).Checked;

    // default
    if ((Sender as TRzCheckBox).Checked) and (ovIndex = -1) then
    begin
      dteInAM.Time := EncodeTime(8,30,0,0);
      dteOutAM.Time := EncodeTime(12,0,0,0);
      dbluReasonAM.ClearKeyValue;
    end;

    // readOnly
    chbAM.ReadOnly := (Assigned(ov)) and (not ov.IsNew);
    dteInAM.ReadOnly := (Assigned(ov)) and (not ov.EditAllowed);
    dteOutAM.ReadOnly := (Assigned(ov)) and (not ov.EditAllowed);
    dbluReasonAM.ReadOnly := (Assigned(ov)) and (not ov.EditAllowed);
  end
  else if period = pdPm then
  begin
    ovIndex := ovs.IndexOf(dt,period);
    ov := ovs.Overrides[ovIndex];

    dteInPM.Enabled := (Sender as TRzCheckBox).Checked;
    dteOutPM.Enabled := (Sender as TRzCheckBox).Checked;
    dbluReasonPM.Enabled := (Sender as TRzCheckBox).Checked;
    chbCancelledPM.ReadOnly := not (Sender as TRzCheckBox).Checked;

    // default
    if ((Sender as TRzCheckBox).Checked) and (ovIndex = -1) then
    begin
      dteInPM.Time := EncodeTime(1,0,0,0);
      dteOutPM.Time := EncodeTime(5,30,0,0);
    end;

    // readOnly
    chbPM.ReadOnly := (Assigned(ov)) and (not ov.IsNew);
    dteInPM.ReadOnly := (Assigned(ov)) and (not ov.EditAllowed);
    dteOutPM.ReadOnly := (Assigned(ov)) and (not ov.EditAllowed);
    dbluReasonPM.ReadOnly := (Assigned(ov)) and (not ov.EditAllowed);
  end;

  // append or cancel
  if ((Sender as TRzCheckBox).Checked) and (ovs.IndexOf(dt,period) = -1) then
    TOverride.Append(period)
  else if not (Sender as TRzCheckBox).Checked then
    TOverride.Cancel(period);
end;

procedure TfrmOverrideDetails.FormClose(Sender: TObject;
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
    ovs.Destroy;
    empl.Destroy;
  end;
end;

procedure TfrmOverrideDetails.FormCreate(Sender: TObject);
begin
  inherited;
  // set default employee to user
  empl := TBaseEmployee.Create;
  empl.IdNumber := HRIS.Employee.IdNumber;
  empl.FirstName := HRIS.Employee.FirstName;
  empl.LastName := HRIS.Employee.LastName;

  Initialise;

  OpenDropdownDataSources(pnlAM);
  OpenDropdownDataSources(pnlPM);
end;

procedure TfrmOverrideDetails.grDateSelectorClick(Sender: TObject);
begin
  inherited;
  SetUnboundControls;
  EnableControls(chbAM);
  EnableControls(chbPM,pdPM);
end;

procedure TfrmOverrideDetails.grDateSelectorDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  dt: TDate;
begin
  inherited;
  dt := TSelDate(grDateSelector.Objects[ACol,ARow]).Date;

  if ovs.OverrideExists(dt) then
  begin
    if gdSelected in State then
      grDateSelector.Canvas.Brush.Color := $006CD900
    else
      grDateSelector.Canvas.Brush.Color := HRIS.Settings.CalendarColours.Ovrride;
  end
  else if gdSelected in State then
    grDateSelector.Canvas.Brush.Color := $0059ACFF;

  Rect.Left := Rect.Left - 4;
  grDateSelector.Canvas.FillRect(Rect);
  grDateSelector.Canvas.TextOut(Rect.Left + 8, Rect.Top + 8, WrapText(grDateSelector.Cells[ACol,ARow],1));
end;

procedure TfrmOverrideDetails.Initialise;
begin
  ovs := TOverrides.Create;

  ovs.Retrieve(IncDay(HRIS.CurrentDate,-15),IncDay(HRIS.CurrentDate,+15),empl.IdNumber);

  PopulateDateSelector(IncDay(HRIS.CurrentDate,-15));

  SetUnboundControls;

  EnableControls(chbAM);
  EnableControls(chbPM,pdPM);

  bteEmployee.Text := empl.Name;
end;

procedure TfrmOverrideDetails.PopulateDateSelector(const sd: TDate);
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

procedure TfrmOverrideDetails.Save;
var
  ov: TOverride;
begin
  ov := TOverride.Create;
  ov.DateString := FormatDateTime('yyyy-mm-dd',
        TSelDate(grDateSelector.Objects[grDateSelector.Col,grDateSelector.Row]).Date);

  if chbAM.Checked then
  begin
    ov.Period := pdAm;
    ov.Employee := empl;
    ov.TimeIn := dteInAM.Time;
    ov.TimeOut := dteOutAM.Time;
    ov.IsNew := false;
    ov.Save;

    ovs.AddOverride(ov,true);
  end;

  if chbPM.Checked then
  begin
    ov.Period := pdPm;
    ov.Employee := empl;
    ov.TimeIn := dteInPM.Time;
    ov.TimeOut := dteOutPM.Time;
    ov.IsNew := false;
    ov.Save;

    ovs.AddOverride(ov,true);
  end;
end;

procedure TfrmOverrideDetails.SetUnboundControls;
var
  dt: TSelDate;
  indexAM, indexPM: integer;
  ov: TOverride;
begin
  with grDateSelector do dt := (Objects[Col,0] as TSelDate);

  lblDate.Caption := 'Override log for ' + FormatDateTime('mmmm dd, yyyy dddd', dt.Date) + '.';

  indexAM := ovs.IndexOf(dt.Date,pdAM);
  indexPM := ovs.IndexOf(dt.Date,pdPM);

  // morning undertime
  if indexAM > -1 then
  begin
    ov := ovs.Overrides[indexAM];
    dteInAM.Time := ov.TimeInConverted;
    dteOutAM.Time := ov.TimeOutConverted;
    ovs.Locate(dt.Date,pdAM);
  end
  else
  begin
    dteInAM.Clear;
    dteOutAM.Clear;
    dbluReasonAM.ClearKeyValue;
  end;

  chbAM.Checked := indexAM > -1;

  // afternoon undertime
  if indexPM > -1 then
  begin
    ov := ovs.Overrides[indexPM];
    dteInPM.Time := ov.TimeInConverted;
    dteOutPM.Time := ov.TimeOutConverted;
    ovs.Locate(dt.Date,pdPM);
  end
  else
  begin
    dteInPM.Clear;
    dteOutPM.Clear;
    dbluReasonPM.ClearKeyValue;
  end;

  chbPM.Checked := indexPM > -1;
end;


function TfrmOverrideDetails.ValidEntry: boolean;
begin
  Result := true;
end;

{ TSelDate }

constructor TSelDate.Create(const dt: TDate);
begin
  FDate := dt;
end;

end.
