unit PafRecord;

interface

uses
  SysUtils;

type
  TAllowance = class
  strict private
    FExpiry: TDateTime;
    FType: string;
    FAmount: currency;
  public
    property AllowanceType: string read FType write FType;
    property Amount: currency read FAmount write FAmount;
    property Expiry: TDateTime read FExpiry write FExpiry;
  end;

  TAllowances = class
  strict private
    FItems: array of TAllowance;
    function GetItems(const i: integer): TAllowance;
    procedure SetItems(const i: integer; const Value: TAllowance);
    function GetCount: integer;
    function GetTotal: currency;
    function GetIsEmpty: boolean;
  public
    property Items[const i: integer]: TAllowance read GetItems write SetItems;
    property Count: integer read GetCount;
    property Total: currency read GetTotal;
    property IsEmpty: boolean read GetIsEmpty;

    procedure Add(AAllowance: TAllowance);
    procedure Remove(AType: string);
    procedure Clear;

    constructor Create;
    destructor Destroy; override;
  end;

  TPaf = class
  private
    FId: integer;
    FAllowances: TAllowances;
    FPositionCode: string;
    FDepartmentCode: string;
    FSalaryFrequencyCode: string;
    FEmploymentStatusCode: string;
    FPositionStatusCode: string;
    FSalary: currency;
    FBranchCode: string;
    FEffectiveDate: TDateTime;
    FEffectiveUntil: TDateTime;
    FStatusCode: string;
    FIsCancelled: integer;
    function GetStatus: string;
    function GetCancelled: boolean;
    function GetIsNew: boolean;
  public
    property Id: integer read FId write FId;
    property Allowances: TAllowances read FAllowances write FAllowances;
    property PositionCode: string read FPositionCode write FPositionCode;
    property PositionStatusCode: string read FPositionStatusCode write FPositionStatusCode;
    property EmploymentStatusCode: string read FEmploymentStatusCode write FEmploymentStatusCode;
    property BranchCode: string read FBranchCode write FBranchCode;
    property DepartmentCode: string read FDepartmentCode write FDepartmentCode;
    property Salary: currency read FSalary write FSalary;
    property SalaryFrequencyCode: string read FSalaryFrequencyCode write FSalaryFrequencyCode;
    property EffectiveDate: TDateTime read FEffectiveDate write FEffectiveDate;
    property EffectiveUntil: TDateTime read FEffectiveUntil write FEffectiveUntil;
    property StatusCode: string read FStatusCode write FStatusCode;
    property IsCancelled: integer write FIsCancelled;
    property Status: string read GetStatus;
    property Cancelled: boolean read GetCancelled;
    property IsNew: boolean read GetIsNew;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPaf }

uses
  AppConstants;

constructor TPaf.Create;
begin
  FAllowances := TAllowances.Create;
end;

destructor TPaf.Destroy;
begin
  FreeAndNil(FAllowances);
  inherited;
end;

function TPaf.GetCancelled: boolean;
begin
  Result := FIsCancelled = 1;
end;

function TPaf.GetIsNew: boolean;
begin
  Result := FId = 0;
end;

function TPaf.GetStatus: string;
begin
  if FId = 0 then Result := PAF_NEW
  else if Cancelled then Result := PAF_CANCELLED
  else if FStatusCode = 'PND' then Result := PAF_PENDING
  else Result := PAF_APPROVED;
end;

{ TAllowances }

procedure TAllowances.Add(AAllowance: TAllowance);
begin
  SetLength(FItems,Length(FItems)+1);
  FItems[Length(FItems)-1] := AAllowance;
end;

procedure TAllowances.Clear;
var
  i, cnt: integer;
begin
  cnt := GetCount - 1;
  for i := 0 to cnt do FreeAndNil(FItems[i]);
  SetLength(FItems,0);
end;

constructor TAllowances.Create;
begin
  SetLength(FItems,0);
end;

destructor TAllowances.Destroy;
begin
  Clear;
  inherited;
end;

function TAllowances.GetCount: integer;
begin
  Result := Length(FItems);
end;

function TAllowances.GetIsEmpty: boolean;
begin
  Result := Length(FItems) = 0;
end;

function TAllowances.GetItems(const i: integer): TAllowance;
begin
  Result := FItems[i];
end;

function TAllowances.GetTotal: currency;
var
  LAllowance: TAllowance;
begin
  Result := 0;

  for LAllowance in FItems do Result := Result + LAllowance.Amount;
end;

procedure TAllowances.Remove(AType: string);
var
  i, ii, len: integer;
  LAllowance: TAllowance;
begin
  len := Length(FItems);

  ii := 0;
  for i := 0 to len - 1 do
  begin
    LAllowance := FItems[i];
    if LAllowance.AllowanceType <> AType then
    begin
      FItems[ii] := LAllowance;
      Inc(ii);
    end;
  end;

  SetLength(FItems,Length(FItems) - 1);
end;

procedure TAllowances.SetItems(const i: integer; const Value: TAllowance);
begin
  FItems[i] := Value;
end;

end.
