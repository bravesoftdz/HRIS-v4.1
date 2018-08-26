unit UndertimeLogs;

interface

uses
  UndertimeLog, SysUtils, DateUtils, Variants, Employee;

type
  TUndertimeLogs = class
  private
    FUndertimeLogs: array of TUndertimeLog;

    procedure PopulateUndertimeLogs;
    function GetUndertimeLog(const i: integer): TUndertimeLog;
    function UndertimeRecordExists(const ut: TUndertimeLog): boolean;

  public
    property UndertimeLogs[const i: integer]: TUndertimeLog read GetUndertimeLog;

    procedure Retrieve(const fromDate, toDate: TDate; const idNum: string);
    procedure Locate(const dt: TDate; const period: TPeriod);
    procedure Refresh;
    procedure AddUndertime(const ut: TUndertimeLog; const overwrite: boolean = false);

    function UndertimeExists(const dt: TDate): boolean;
    function IndexOf(const dt: TDate; const pd: TPeriod): integer;

    constructor Create;
    destructor Destroy; override;
  end;

var
  utLogs: TUndertimeLogs;

implementation

uses TimeLogData, HRISDialogs;

constructor TUndertimeLogs.Create;
begin
  if utLogs <> nil then utLogs := self
  else inherited Create;
end;

destructor TUndertimeLogs.Destroy;
begin
  utLogs := nil;
  with dmTimelog do
  begin
    dstUndertimeAM.Close;
    dstUndertimePM.Close;
  end;
end;

procedure TUndertimeLogs.Retrieve(const fromDate, toDate: TDate; const idNum: string);
begin
  with dmTimelog.dstUndertimeAM do
  begin
    try
      Close;
      Parameters.ParamByName('@dtr_date_from').Value := fromDate;
      Parameters.ParamByName('@dtr_date_until').Value := toDate;
      Parameters.ParamByName('@id_num').Value := idNum;
      Open;
    except
      on e:Exception do ShowErrorBox(e.Message);
    end;
  end;

  with dmTimelog.dstUndertimePM do
  begin
    try
      Close;
      Parameters.ParamByName('@dtr_date_from').Value := fromDate;
      Parameters.ParamByName('@dtr_date_until').Value := toDate;
      Parameters.ParamByName('@id_num').Value := idNum;
      Open;
    except
      on e:Exception do ShowErrorBox(e.Message);
    end;
  end;

  PopulateUndertimeLogs;
end;

procedure TUndertimeLogs.PopulateUndertimeLogs;
var
  ut: TUndertimeLog;
  emp: TBaseEmployee;
begin
  FUndertimeLogs := [];

  // morning undertime
  with dmTimelog.dstUndertimeAM do
  begin
    while not Eof do
    begin
      emp := TBaseEmployee.Create;

      emp.IdNumber := FieldByName('id_num').AsString;
      emp.LastName := FieldByName('employee_lastname').AsString;
      emp.FirstName := FieldByName('employee_firstname').AsString;

      ut := TUndertimeLog.Create;

      ut.Employee := emp;
      ut.DateString := FieldByName('dtr_date').AsString;
      ut.TimeFrom := FieldByName('time_from').AsDateTime;
      ut.TimeUntil := FieldByName('time_until').AsDateTime;
      ut.AmPm := FieldByName('am_pm').AsString;
      ut.Period := pdAm;
      ut.ReasonCode := FieldByName('undertime_reason_code').AsString;
      ut.IsPaid := FieldByName('is_paid').AsInteger = 1;
      ut.Status := FieldByName('timestatus_code').AsString;

      AddUndertime(ut);

      Next;
    end;
  end;

  // afternoon undertime
  with dmTimelog.dstUndertimePM do
  begin
    while not Eof do
    begin
      emp := TBaseEmployee.Create;

      emp.IdNumber := FieldByName('id_num').AsString;
      emp.LastName := FieldByName('employee_lastname').AsString;
      emp.FirstName := FieldByName('employee_firstname').AsString;

      ut := TUndertimeLog.Create;

      ut.Employee := emp;
      ut.DateString := FieldByName('dtr_date').AsString;
      ut.TimeFrom := FieldByName('time_from').AsDateTime;
      ut.TimeUntil := FieldByName('time_until').AsDateTime;
      ut.AmPm := FieldByName('am_pm').AsString;
      ut.Period := pdPm;
      ut.ReasonCode := FieldByName('undertime_reason_code').AsString;
      ut.IsPaid := FieldByName('is_paid').AsInteger = 1;
      ut.Status := FieldByName('timestatus_code').AsString;

      AddUndertime(ut);

      Next;
    end;
  end;

end;

procedure TUndertimeLogs.AddUndertime(const ut: TUndertimeLog; const overwrite: boolean);
begin
  if not UndertimeRecordExists(ut) then
  begin
    SetLength(FUndertimeLogs,Length(FUndertimeLogs) + 1);
    FUndertimeLogs[Length(FUndertimeLogs) - 1] := ut;
  end
  else if overwrite then FUndertimeLogs[IndexOf(ut.Date,ut.Period)] := ut;
end;

procedure TUndertimeLogs.Locate(const dt: TDate; const period: TPeriod);
var
  dts: string;
begin
  dts := FormatDateTime('yyyy-mm-dd',dt);
  with dmTimelog do
  begin
    if period = pdAM then dstUndertimeAM.Locate('dtr_date',dts,[])
    else dstUndertimePM.Locate('dtr_date',dts,[]);
  end;
end;

procedure TUndertimeLogs.Refresh;
begin
  with dmTimelog do
  begin
    dstUndertimeAM.Requery;
    dstUndertimePM.Requery;
  end;
end;

function TUndertimeLogs.GetUndertimeLog(const i: integer): TUndertimeLog;
begin
  if i < 0 then Result := nil
  else Result := FUndertimeLogs[i];
end;

function TUndertimeLogs.UndertimeExists(const dt: TDate): boolean;
var
  ut: TUndertimeLog;
begin
  Result := false;

  for ut in FUndertimeLogs do
  begin
    if CompareDate(ut.Date,dt) = 0 then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

function TUndertimeLogs.IndexOf(const dt: TDate; const pd: TPeriod): integer;
var
  index: integer;
  ut: TUndertimeLog;
begin
  Result := -1;

  index := 0;
  for ut in FUndertimeLogs do
  begin
    if (CompareDate(ut.Date,dt) = 0) and (ut.Period = pd) then
    begin
      Result := index;
      Exit;
    end;
    Inc(index);
  end;
end;

function TUndertimeLogs.UndertimeRecordExists(const ut: TUndertimeLog): boolean;
begin
  Result := IndexOf(ut.Date,ut.Period) > -1;
end;

end.
