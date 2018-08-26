unit Employee;

interface

uses
  SysUtils;

type
  TOnUpdate = procedure of object;

  TBaseEmployee = class
  protected
    FIdNumber: string;
    FLastName: string;
    FFirstName: string;
    function GetName: string;
  public
    property IdNumber: string read FIdNumber write FIdNumber;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Name: string read GetName;

    constructor Create;
    destructor Destroy; reintroduce;
  end;

  TBaseEmployeeExt = class(TBaseEmployee)
  protected
    FLocationCode: string;
    FDepartmentCode: string;
    FPositionTypeCode: string;
  public
    property LocationCode: string read FLocationCode write FLocationCode;
    property DepartmentCode: string read FDepartmentCode write FDepartmentCode;
    property PositionTypeCode: string read FPositionTypeCode write FPositionTypeCode;
  end;

  TEmployee = class(TBaseEmployee)
  private
    FBirthDate: TDateTime;
    FWeight: integer;
    FHeight: integer;
    FOnUpdate: TOnUpdate;

    function GetAge: integer;
    function GetHeightInFeetAndInches: string;
    function GetWeightInKilos: string;
    function GetNameSurnameFirst: string;
  public

    property BirthDate: TDateTime read FBirthDate write FBirthDate;
    property Age: integer read GetAge;
    property Height: integer read FHeight write FHeight;
    property Weight: integer read FWeight write FWeight;
    property HeightInFeetAndInches: string read GetHeightInFeetAndInches;
    property WeightInKilos: string read GetWeightInKilos;
    property OnUpdate: TOnUpdate read FOnUpdate write FOnUpdate;
    property NameSurnameFirst: string read GetNameSurnameFirst;
  end;

var
  empl: TBaseEmployee;

implementation

{ TEmployee }

function TEmployee.GetAge: integer;
var
  Month, Day, Year, CurrentYear, CurrentMonth, CurrentDay: Word;
  LAge: integer;
begin
  LAge := 0;
  if FBirthDate > 0 then
  begin
    DecodeDate(FBirthDate, Year, Month, Day);
    DecodeDate(Date, CurrentYear, CurrentMonth, CurrentDay);

    if (Year = CurrentYear) and (Month = CurrentMonth) and (Day = CurrentDay) then
    begin
      LAge := 0;
    end
    else
    begin
      LAge := CurrentYear - Year;
      if (Month > CurrentMonth) then Dec(LAge)
      else
      begin
        if Month = CurrentMonth then
          if (Day > CurrentDay) then Dec(LAge);
      end;
    end;
  end;

  Result := LAge;
end;

function TEmployee.GetHeightInFeetAndInches: string;
var
  ft, inches: single;
begin
  inherited;
  // convert value (CM) to FT
  // 1 kg = 2.2 lbs

  ft := (FHeight * 0.3937008) / 12;
  inches := (ft - Trunc(ft)) * 12;

  if Round(inches) = 0 then Result := IntToStr(Trunc(ft)) + ' ft '
  else if Round(inches) = 1 then Result := IntToStr(Trunc(ft)) + ' ft ' +  IntToStr(Round(inches)) + ' inch'
  else if Round(inches) = 12 then Result :=  IntToStr(Trunc(ft) + 1) + ' ft '
  else Result := IntToStr(Trunc(ft)) + ' ft ' +  IntToStr(Round(inches)) + ' inches';
end;

function TEmployee.GetNameSurnameFirst: string;
begin
  Result := FLastName + ', ' + FFirstName;
end;

function TEmployee.GetWeightInKilos: string;
var
  kg: single;
begin
  inherited;
  // convert value (LBS) to KG
  // 1 kg = 2.2 lbs

  kg := FWeight / 2.2;
  Result := FormatFloat('###,##0.00', kg) + ' kg';
end;

{ TBaseEmployee }

constructor TBaseEmployee.Create;
begin
  if empl <> nil then empl := self
  else inherited Create;
end;

destructor TBaseEmployee.Destroy;
begin
  if empl = self then empl := nil;
end;

function TBaseEmployee.GetName: string;
begin
  Result := FFirstName + ' ' + FLastName;
end;

end.


