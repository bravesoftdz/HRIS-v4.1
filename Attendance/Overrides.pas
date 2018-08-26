unit Overrides;

interface

uses
  Ovrride, DateUtils, SysUtils;

type
  TOverrides = class
  private
    FOverrides: array of TOverride;

    procedure PopulateOverrides;
    function GetOverride(const i: integer): TOverride;
    function OverrideRecordExists(const ov: TOverride): boolean;

  public
    property Overrides[const i: integer]: TOverride read GetOverride;

    procedure Retrieve(const fromDate, toDate: TDate; const idNum: string);
    procedure Locate(const dt: TDate; const period: TPeriod);
    procedure Refresh;
    procedure AddOverride(const ov: TOverride; const overwrite: boolean = false);

    function OverrideExists(const dt: TDate): boolean;
    function IndexOf(const dt: TDate; const pd: TPeriod): integer;

    constructor Create;
    destructor Destroy; override;
  end;

var
  ovs: TOverrides;

implementation

{ TOverrides }

uses
  TimelogData, HRISDialogs, Employee;

procedure TOverrides.AddOverride(const ov: TOverride; const overwrite: boolean);
begin
  if not OverrideRecordExists(ov) then
  begin
    SetLength(FOverrides,Length(FOverrides) + 1);
    FOverrides[Length(FOverrides) - 1] := ov;
  end
  else if overwrite then FOverrides[IndexOf(ov.Date,ov.Period)] := ov;
end;

constructor TOverrides.Create;
begin
  if ovs <> nil then ovs := self
  else inherited Create;
end;

destructor TOverrides.Destroy;
begin
  ovs := nil;
  with dmTimelog do
  begin
    dstOverrideAM.Close;
    dstOverridePM.Close;
  end;
end;

function TOverrides.GetOverride(const i: integer): TOverride;
begin
  if i < 0 then Result := nil
  else Result := FOverrides[i];
end;

function TOverrides.IndexOf(const dt: TDate; const pd: TPeriod): integer;
var
  index: integer;
  ov: TOverride;
begin
  Result := -1;

  index := 0;
  for ov in FOverrides do
  begin
    if (CompareDate(ov.Date,dt) = 0) and (ov.Period = pd) then
    begin
      Result := index;
      Exit;
    end;
    Inc(index);
  end;
end;

procedure TOverrides.Locate(const dt: TDate; const period: TPeriod);
var
  dts: string;
begin
  dts := FormatDateTime('yyyy-mm-dd',dt);
  with dmTimelog do
  begin
    if period = pdAM then dstOverrideAM.Locate('dtr_date',dts,[])
    else dstOverridePM.Locate('dtr_date',dts,[]);
  end;
end;

function TOverrides.OverrideExists(const dt: TDate): boolean;
var
  ov: TOverride;
begin
  Result := false;

  for ov in FOverrides do
  begin
    if CompareDate(ov.Date,dt) = 0 then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

function TOverrides.OverrideRecordExists(const ov: TOverride): boolean;
begin
  Result := IndexOf(ov.Date,ov.Period) > -1;
end;

procedure TOverrides.PopulateOverrides;
var
  ov: TOverride;
  emp: TBaseEmployee;
begin
  FOverrides := [];

  // morning override
  with dmTimelog.dstOverrideAM do
  begin
    while not Eof do
    begin
      emp := TBaseEmployee.Create;

      emp.IdNumber := FieldByName('id_num').AsString;
      emp.LastName := FieldByName('employee_lastname').AsString;
      emp.FirstName := FieldByName('employee_firstname').AsString;

      ov := TOverride.Create;

      ov.Employee := emp;
      ov.DateString := FieldByName('dtr_date').AsString;
      ov.TimeIn := FieldByName('time_in').AsDateTime;
      ov.TimeOut := FieldByName('time_out').AsDateTime;
      ov.AmPm := FieldByName('am_pm').AsString;
      ov.Period := pdAm;
      ov.ReasonCode := FieldByName('override_reason_code').AsString;
      ov.IsCancelled := FieldByName('is_cancelled').AsInteger = 1;
      ov.IsNew := FieldByName('override_date').IsNull;

      AddOverride(ov);

      Next;
    end;
  end;

  // afternoon override
  with dmTimelog.dstOverridePM do
  begin
    while not Eof do
    begin
      emp := TBaseEmployee.Create;

      emp.IdNumber := FieldByName('id_num').AsString;
      emp.LastName := FieldByName('employee_lastname').AsString;
      emp.FirstName := FieldByName('employee_firstname').AsString;

      ov := TOverride.Create;

      ov.Employee := emp;
      ov.DateString := FieldByName('dtr_date').AsString;
      ov.TimeIn := FieldByName('time_in').AsDateTime;
      ov.TimeOut := FieldByName('time_out').AsDateTime;
      ov.AmPm := FieldByName('am_pm').AsString;
      ov.Period := pdPm;
      ov.ReasonCode := FieldByName('override_reason_code').AsString;
      ov.IsCancelled := FieldByName('is_cancelled').AsInteger = 1;
      ov.IsNew := FieldByName('override_date').IsNull;

      AddOverride(ov);

      Next;
    end;
  end;
end;

procedure TOverrides.Refresh;
begin
  with dmTimelog do
  begin
    dstOverrideAM.Requery;
    dstOverridePM.Requery;
  end;
end;

procedure TOverrides.Retrieve(const fromDate, toDate: TDate;
  const idNum: string);
begin
  with dmTimelog.dstOverrideAM do
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

  with dmTimelog.dstOverridePM do
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

  PopulateOverrides;
end;

end.
