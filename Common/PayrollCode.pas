unit PayrollCode;

interface

uses
  System.Classes, System.SysUtils;

type
  TPayrollCode = class
  private
    FCode: string;
    FPeriod: string;
    FDateFromStr: string;
    FDateUntilStr: string;

    function GetDateFrom: TDateTime;
    function GetDateUntil: TDateTime;

    function GetDate(const dateStr: string): TDateTime;

  public
    property Code: string read FCode write FCode;
    property Period: string read FPeriod write FPeriod;
    property DateFromStr: string read FDateFromStr write FDateFromStr;
    property DateUntilStr: string read FDateUntilStr write FDateUntilStr;
    property DateFrom: TDateTime read GetDateFrom;
    property DateUntil: TDateTime read GetDateUntil;

    constructor Create; overload;
    constructor Create(const cd, pd, fr, un: string); overload;
  end;

implementation

constructor TPayrollCode.Create;
begin
  inherited Create;
end;

constructor TPayrollCode.Create(const cd, pd, fr, un: string);
begin
  inherited Create;

  FCode := cd;
  FPeriod := pd;
  FDateFromStr := fr;
  FDateUntilStr := un;
end;

function TPayrollCode.GetDate(const dateStr: string): TDateTime;
var
  list: TStringList;
begin
  list := TStringList.Create;
  list.Delimiter := '-';
  list.DelimitedText := dateStr;

  Result := EncodeDate(StrToInt(list[0]), StrToInt(list[1]), StrToInt(list[2]));
end;

function TPayrollCode.GetDateFrom: TDateTime;
begin
  Result := GetDate(FDateFromStr);
end;

function TPayrollCode.GetDateUntil: TDateTime;
begin
  Result := GetDate(FDateUntilStr);
end;

end.
