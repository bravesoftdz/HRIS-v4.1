unit LeaveController;

interface

uses
  Leave, System.Classes, ADODB, SysUtils, Employee, System.UITypes, RzGrids,
  System.Types, Graphics, DateUtils;

type
  TOnUpdate = procedure of object;

  TLeaveType = (ltSick, ltVacation);

  TLeaveCredit = class
  strict private
    FCredits: smallint;
    FLeaveType: string;
  public
    property LeaveType: string read FLeaveType write FLeaveType;
    property Credits: smallint read FCredits write FCredits;
  end;

  TLeaveController = class
  private
    FLeaves: array of TEmployeeLeave;
    FData: TDataModule;
    FEmployee: TEmployee;
    FStartDate: TDateTime;
    FEndDate: TDateTime;
    FOnUpdate: TOnUpdate;
    FLeaveCredits: array of TLeaveCredit;

    procedure SetLeave(const i: integer; const Value: TEmployeeLeave);
    procedure Clear;

    function GetLeave(const i: integer): TEmployeeLeave;
    function GetLeaveCount: integer;
    function IndexOf(const ADate: TDate): integer;
    function GetSickLeaveCredits: single;
    function GetVacationLeaveCredits: single;
    function GetSickLeavesRemaining: single;
    function GetVacationLeavesRemaining: single;
    function GetSickLeavesAvailed: single;
    function GetVacationLeavesAvailed: single;

  public
    property Leaves[const i: integer]: TEmployeeLeave read GetLeave write SetLeave;
    property LeaveCount: integer read GetLeaveCount;
    property StartDate: TDateTime read FStartDate write FStartDate;
    property EndDate: TDateTime read FEndDate write FEndDate;
    property OnUpdate: TOnUpdate read FOnUpdate write FOnUpdate;
    property Employee: TEmployee read FEmployee;
    property VacationLeaveCredits: single read GetVacationLeaveCredits;
    property SickLeaveCredits: single read GetSickLeaveCredits;
    property VacationLeavesRemaining: single read GetVacationLeavesRemaining;
    property SickLeavesRemaining: single read GetSickLeavesRemaining;
    property VacationLeavesAvailed: single read GetVacationLeavesAvailed;
    property SickLeavesAvailed: single read GetSickLeavesAvailed;

    procedure AddLeave(ALeave: TEmployeeLeave);
    procedure RemoveLeave(ALeave: TEmployeeLeave);
    procedure Retrieve;
    procedure FindEmployee;
    procedure Render(const grid: TRzStringGrid; const ADate: TDateTime; Rect: TRect);

    function Save: boolean;
    function HasLeave(const ADate: TDateTime): boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  LeaveData, Holiday, EmployeeSearch, HRISGlobal, HRISDialogs;

{ TLeaveController }

procedure TLeaveController.AddLeave(ALeave: TEmployeeLeave);
begin
  SetLength(FLeaves,Length(FLeaves) + 1);
  FLeaves[Length(FLeaves) - 1] := ALeave;
end;

procedure TLeaveController.Clear;
var
  i: integer;
begin
  for i := Low(FLeaves) to High(FLeaves) do FreeAndNil(FLeaves[i]);

  FLeaves := [];
end;

constructor TLeaveController.Create;
begin
  FData := TdmLeave.Create(nil);
end;

destructor TLeaveController.Destroy;
begin
  if Assigned(FData) then FreeAndNil(FData);

  inherited;
end;

procedure TLeaveController.FindEmployee;
var
  LEmployee: TEmployee;
begin
  LEmployee := TEmployee.Create;

  with TfrmEmployeeSearch.Create(nil,LEmployee) do
  try
    ShowModal;
    if ModalResult = mrOK  then FEmployee := LEmployee
    else FreeAndNil(LEmployee);
  finally
    Free;
  end;
end;

function TLeaveController.GetLeave(const i: integer): TEmployeeLeave;
begin
  Result := FLeaves[i];
end;

function TLeaveController.GetLeaveCount: integer;
begin
  Result := Length(FLeaves);
end;

function TLeaveController.GetSickLeaveCredits: single;
var
  LCredit: TLeaveCredit;
begin
  for LCredit in FLeaveCredits do
    if LCredit.LeaveType = 'SL' then
      Result := LCredit.Credits;
end;

function TLeaveController.GetSickLeavesAvailed: single;
var
  LLeave: TEmployeeLeave;
  leavesAvailed: single;
begin
  leavesAvailed := 0;

  for LLeave in FLeaves do
    if (LLeave.LeaveType = 'SL') and (LLeave.IsApproved)  then
    begin
      if LLeave.IsWholeDay then leavesAvailed := leavesAvailed + 1
      else if LLeave.IsMorning then leavesAvailed := leavesAvailed + 0.4375
      else leavesAvailed := leavesAvailed + 0.5625
    end;

  Result := leavesAvailed;
end;

function TLeaveController.GetSickLeavesRemaining: single;
begin
  Result := SickLeaveCredits - SickLeavesAvailed;
end;

function TLeaveController.GetVacationLeaveCredits: single;
var
  LCredit: TLeaveCredit;
begin
  for LCredit in FLeaveCredits do
    if LCredit.LeaveType = 'VL' then
      Result := LCredit.Credits;
end;

function TLeaveController.GetVacationLeavesAvailed: single;
var
  LLeave: TEmployeeLeave;
  leavesAvailed: single;
begin
  leavesAvailed := 0;

  for LLeave in FLeaves do
    if (LLeave.LeaveType = 'VL') and (LLeave.IsApproved)  then
    begin
      if LLeave.IsWholeDay then leavesAvailed := leavesAvailed + 1
      else if LLeave.IsMorning then leavesAvailed := leavesAvailed + 0.4375
      else leavesAvailed := leavesAvailed + 0.5625
    end;

  Result := leavesAvailed;
end;

function TLeaveController.GetVacationLeavesRemaining: single;
begin
  Result := VacationLeaveCredits - VacationLeavesAvailed;
end;

function TLeaveController.HasLeave(const ADate: TDateTime): boolean;
var
  LLeave: TEmployeeLeave;
begin
  Result := false;

  for LLeave in FLeaves do
  begin
    if LLeave.Date = ADate then
      if LLeave.LeaveType <> '' then
      begin
        Result := true;
        Exit;
      end;
  end;
end;

function TLeaveController.IndexOf(const ADate: TDate): integer;
var
  LLeave: TEmployeeLeave;
  i: integer;
begin
  Result := -1;

  for i := 0 to LeaveCount - 1 do
  begin
    LLeave := FLeaves[i];
    if LLeave.Date = ADate then
      if LLeave.LeaveType <> '' then
      begin
        Result := i;
        Exit;
      end;
  end;
end;

procedure TLeaveController.RemoveLeave(ALeave: TEmployeeLeave);
begin

end;

procedure TLeaveController.Render(const grid: TRzStringGrid;
  const ADate: TDateTime; Rect: TRect);
var
  conflictWidth: integer;
  LLeave: TEmployeeLeave;
  i: integer;
begin
  try
    with grid, HRIS.Settings.CalendarColours do
    begin
      i := IndexOf(ADate);

      if i > -1 then
      begin
        LLeave := FLeaves[i];
        while LLeave.Date = ADate do
        begin
          if LLeave.IsBusinessTrip then Canvas.Brush.Color := clSkyBlue
          else
          begin
            if LLeave.IsApproved then Canvas.Brush.Color := clMoneyGreen
            else if LLeave.IsPending then Canvas.Brush.Color := $00FFA4A4;
            // else if LLeave.IsCancelled then Canvas.Brush.Color := $00B0B0FF;
          end;

          Inc(i);

          LLeave := FLeaves[i];
        end;
      end;
    end;

      {if IndexOf( then
      begin
        // has conflict
        if log.HasConflict then
        begin


          Canvas.Brush.Color := $008A8AFF;
          Canvas.Rectangle(
                  Rect.Left-4,
                  Rect.Top,
                  Rect.Left + conflictWidth,
                  Rect.Top+25);
        end;

        if log.IsHoliday then
        begin
          Canvas.Brush.Color := Holiday;
          Canvas.Pen.Style := psClear;
          Canvas.Rectangle(
                  Rect.Left-2,
                  Rect.Top+1,
                  Rect.Left+8,
                  Rect.Top+11);
        end;

        // leaves
        if log.HasLeave then
        begin
          lv := log.Leaves1[0];

          if lv.IsBusinessTrip then Canvas.Brush.Color := BusinessTrip
          else Canvas.Brush.Color := Leave;

          Canvas.Pen.Style := psClear;
          Canvas.Rectangle(
                  Rect.Left-2,
                  Rect.Top+1+11,
                  Rect.Left+8,
                  Rect.Top+11+11);

          if (log.LeaveCount > 1) or (log.LeaveIsWholeDay) then
          begin

            if log.LeaveCount > 1 then lv := log.Leaves1[1];

            if lv.IsBusinessTrip then Canvas.Brush.Color := BusinessTrip
            else Canvas.Brush.Color := Leave;

            Canvas.Rectangle(
                    Rect.Left-2+11,
                    Rect.Top+1+11,
                    Rect.Left+8+11,
                    Rect.Top+11+11);
          end;
        end;
      end
      else if log.IsSunday then
      begin
        Canvas.Brush.Color := Sunday;
        Canvas.Pen.Style := psClear;
        Canvas.Rectangle(
                  Rect.Left-2,
                  Rect.Top+1,
                  Rect.Left+8,
                  Rect.Top+11);
      end;
    end;    // end width  }
  except

  end;
end;

procedure TLeaveController.Retrieve;
var
  LEmployee: TBaseEmployeeExt;
  LLeave: TEmployeeLeave;
  LCredit: TLeaveCredit;
  i, cnt: integer;
begin
  Clear;

  if not Assigned(FEmployee) then Exit;

    // leave credits
  with (FData as TdmLeave).dstLeaveCredits do
  begin
    try
      try
        Parameters.ParamByName('@id_num').Value := FEmployee.IdNumber;
        Parameters.ParamByName('@year').Value := YearOf(HRIS.CurrentDate);

        Open;

        // clear leave credits
        cnt := Length(FLeaveCredits) - 1;
        for i := 0 to cnt do
        begin
          LCredit := FLeaveCredits[i];
          FreeAndNil(LCredit);
        end;

        SetLength(FLeaveCredits,0);

        while not Eof do
        begin
          LCredit := TLeaveCredit.Create;
          LCredit.LeaveType := Trim(FieldByName('leavetype_code').AsString);
          LCredit.Credits := FieldByName('leave_credits').AsInteger;

          SetLength(FLeaveCredits,Length(FLeaveCredits) + 1);
          FLeaveCredits[Length(FLeaveCredits)-1] := LCredit;

          Next;
        end;

      except
        on E: Exception do ShowErrorBox2(E.Message);
      end;
    finally
      Close;
    end;
  end;

  // leaves
  with (FData as TdmLeave).dstLeaves do
  begin
    try
      Parameters.ParamByName('@date_from').Value := FStartDate;
      Parameters.ParamByName('@date_until').Value := FEndDate;
      Parameters.ParamByName('@id_num').Value := FEmployee.IdNumber;

      Open;

      while not Eof do
      begin
        LLeave := TEmployeeLeave.Create;

        LLeave.Date := FieldByName('dt').AsDateTime;

        // employee
        {LEmployee := TBaseEmployeeExt.Create;
        LEmployee.IdNumber := FieldByName('id_num').AsString;
        LEmployee.FirstName := FieldByName('employee_firstname').AsString;
        LEmployee.LastName := FieldByName('employee_lastname').AsString;
        LEmployee.LocationCode := FieldByName('location_code').AsString;
        LEmployee.DepartmentCode := FieldByName('department_code').AsString;
        LEmployee.PositionTypeCode := FieldByName('positiontype_code').AsString;

        LLeave.Employee := LEmployee;
        }

        // leave whole day
        if FieldByName('leave_date_full').AsString <> '' then
        begin
          LLeave.AmPm := '';
          LLeave.LeaveType := Trim(FieldByName('leavetype_code_full').AsString);
          LLeave.LeaveTypeName := FieldByName('leavetype_name_full').AsString;
          LLeave.Reason := FieldByName('leave_reason_full').AsString;
          LLeave.Remarks := FieldByName('leave_remarks_full').AsString;
          LLeave.Status := FieldByName('status_full').AsString;
          LLeave.IsPaid := FieldByName('is_paid_leave_full').AsInteger = 1;
        end
        // leave am
        else if FieldByName('leave_date_am').AsString <> '' then
        begin
          LLeave.AmPm := 'A';
          LLeave.LeaveType := Trim(FieldByName('leavetype_code_am').AsString);
          LLeave.LeaveTypeName := FieldByName('leavetype_name_am').AsString;
          LLeave.Reason := FieldByName('leave_reason_am').AsString;
          LLeave.Remarks := FieldByName('leave_remarks_am').AsString;
          LLeave.Status := FieldByName('status_am').AsString;
          LLeave.IsPaid := FieldByName('is_paid_leave_am').AsInteger = 1;
        end
        // leave pm
        else if FieldByName('leave_date_pm').AsString <> '' then
        begin
          LLeave.AmPm := 'P';
          LLeave.LeaveType := Trim(FieldByName('leavetype_code_pm').AsString);
          LLeave.LeaveTypeName := FieldByName('leavetype_name_pm').AsString;
          LLeave.Reason := FieldByName('leave_reason_pm').AsString;
          LLeave.Remarks := FieldByName('leave_remarks_pm').AsString;
          LLeave.Status := FieldByName('status_pm').AsString;
          LLeave.IsPaid := FieldByName('is_paid_leave_pm').AsInteger = 1;
        end;

        AddLeave(LLeave);

        Next;
      end;
    finally
      FOnUpdate;
      Close;
    end;
  end;

end;

function TLeaveController.Save: boolean;
begin

end;

procedure TLeaveController.SetLeave(const i: integer; const Value: TEmployeeLeave);
begin
  FLeaves[i] := Value;
end;

end.
