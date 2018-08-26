unit AttendanceUtils;

interface

uses
  RzCmboBx, DateUtils, SysUtils, StrUtils;

procedure PopulateYear(const combo: TRzComboBox);
procedure GetDateParamsYear(const year: integer; var fromDate, toDate: TDate);

function FormatTimeString(const time: string; const showAmPM: boolean = false): string;
function ConvertTime(const time: double): double;

const
  BASE_YEAR = 2014;

implementation

procedure PopulateYear(const combo: TRzComboBox);
var
  mm: Word;
  yy: Word;
  dd: Word;
  i: integer;
begin
  DecodeDate(Date, yy, mm, dd);

  with combo do
  begin
    Clear;

    for i := yy downto BASE_YEAR do
        combo.Items.Add(IntToStr(i));

    ItemIndex := 0;
  end;
end;

procedure GetDateParamsYear(const year: integer; var fromDate, toDate: TDate);
begin
  fromDate := EncodeDate(year,1,1);
  toDate := EncodeDate(year,12,31);
end;

function FormatTimeString(const time: string; const showAmPm: boolean): string;
var
  ampm: string;
begin
  if time = '' then Result := '-'
  else if StrToInt(Copy(time,0,2)) < 13 then
  begin
    if StrToInt(Copy(time,0,2)) = 12 then ampm := ' PM'
    else ampm := ' AM';

    Result := time
  end
  else if StrToInt(Copy(time,0,2)) >= 13 then
  begin
    ampm := ' PM';

    if StrToInt(Copy(time,0,2)) - 12 < 10 then
      Result := StuffString(time,0,3,'0' + IntToStr(StrToInt(Copy(time,0,2)) - 12))
    else
      Result := StuffString(time,0,3,IntToStr(StrToInt(Copy(time,0,2)) - 12));

  end;

  if showAmPM then Result := Copy(Result,0,5) + ampm
  else Copy(Result,0,5);
end;

function ConvertTime(const time: double): double;
begin
  if CompareTime(time,EncodeTime(12,59,0,0)) = 1 then Result := IncHour(time,-12)
  else Result := time;
end;


end.
