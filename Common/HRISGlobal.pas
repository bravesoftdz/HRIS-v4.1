unit HRISGlobal;

interface

uses
  User, SysUtils, DateUtils, PayrollCode, Location, Employee, Settings;

type
  THRISGlobal = class
  private
    FCurrentDate: TDate;
    FUser: TUser;
    FEmployee: TBaseEmployeeExt;
    FVersion: string;
    FLocationCode: string;
    FAppImagesPath: string;
    FMaximumUndertime: integer; // in minutes
    FActivePayrollCodes: array of TPayrollCode;
    FLocations: array of TLocation;
    FSettings: TSettings;

    function GetTimeInAM: double;
    function GetTimeOutAM: double;
    function GetTimeInPM: double;
    function GetTimeOutPM: double;
    function GetPayrollCode(const i: integer): TPayrollCode;
    function GetActivePayrollCount: integer;
    function GetLocation(const i: integer): TLocation;
    function GetLocationCount: integer;

  public
    property CurrentDate: TDate read FCurrentDate write FCurrentDate;
    property User: TUser read FUser write FUser;
    property Employee: TBaseEmployeeExt read FEmployee write FEmployee;
    property Version: string read FVersion write FVersion;
    property LocationCode: string read FLocationCode write FLocationCode;
    property AppImagesPath: string read FAppImagesPath write FAppImagesPath;
    property MaximumUndertime: integer read FMaximumUndertime write FMaximumUndertime;
    property TimeInAM: double read GetTimeInAM;
    property TimeOutAM: double read GetTimeOutAM;
    property TimeInPM: double read GetTimeInPM;
    property TimeOutPM: double read GetTimeOutPM;
    property ActivePayrollCodes[const i: integer]: TPayrollCode read GetPayrollCode;
    property ActivePayrollCount: integer read GetActivePayrollCount;
    property Locations[const i: integer]: TLocation read GetLocation;
    property LocationCount: integer read GetLocationCount;
    property Settings: TSettings read FSettings write FSettings;

    procedure AddActivePayrollCode(const pc: TPayrollCode);
    procedure AddLocation(const loc: TLocation);

    function GetLocationNameByCode(const code: string): string;

    constructor Create;
  end;

var
  HRIS: THRISGlobal;

implementation

constructor THRISGlobal.Create;
begin
  if HRIS = nil then
  begin
    FUser := TUser.Create;
    FEmployee := TBaseEmployeeExt.Create;
    FSettings := TSettings.Create;

    HRIS := self
  end
  else
    Abort;
end;

procedure THRISGlobal.AddActivePayrollCode(const pc: TPayrollCode);
begin
  SetLength(FActivePayrollCodes,Length(FActivePayrollCodes) + 1);
  FActivePayrollCodes[Length(FActivePayrollCodes) - 1] := pc;
end;

procedure THRISGlobal.AddLocation(const loc: TLocation);
begin
  SetLength(FLocations,Length(FLocations) + 1);
  FLocations[Length(FLocations) - 1] := loc;
end;

function THRISGlobal.GetTimeInAM: double;
begin
  if DayOfTheWeek(FCurrentDate) = DaySaturday then
    Result := EncodeTime(8,0,0,0)
  else
    Result := EncodeTime(8,30,0,0);
end;

function THRISGlobal.GetTimeOutAM: double;
begin
  Result := EncodeTime(12,0,0,0);
end;

function THRISGlobal.GetTimeInPM: double;
begin
  Result := EncodeTime(13,0,0,0);
end;

function THRISGlobal.GetTimeOutPM: double;
begin
  Result := EncodeTime(17,30,0,0);
end;

function THRISGlobal.GetPayrollCode(const i: integer): TPayrollCode;
begin
  Result := FActivePayrollCodes[i];
end;

function THRISGlobal.GetActivePayrollCount: integer;
begin
  Result := Length(FActivePayrollCodes);
end;

function THRISGlobal.GetLocation(const i: Integer): TLocation;
begin
  Result := FLocations[i];
end;

function THRISGlobal.GetLocationNameByCode(const code: string): string;
var
  loc: TLocation;
begin
  Result := 'Unknown';

  for loc in FLocations do
    if code = Trim(loc.LocationCode) then
    begin
      Result := loc.LocationName;
      Exit;
    end;
end;

function THRISGlobal.GetLocationCount: integer;
begin
  Result := Length(FLocations);
end;


end.
