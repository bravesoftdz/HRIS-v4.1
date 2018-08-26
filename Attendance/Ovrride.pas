unit Ovrride;

interface

uses
  Employee, SysUtils, Classes, DB;

type
  TPeriod = (pdAm, pdPm);

type
  TOverride = class
  private
    FEmployee: TBaseEmployee;
    FDateString: string;
    FTimeIn: double;
    FTimeOut: double;
    FAmPm: string;
    FPeriod: TPeriod;
    FReasonCode: string;
    FIsCancelled: boolean;
    FIsNew: boolean;

    function GetDate: TDateTime;
    function GetEditAllowed: boolean;
    function GetTimeInConverted: double;
    function GetTimeOutConverted: double;

  public
    property Employee: TBaseEmployee read FEmployee write FEmployee;
    property Date: TDateTime read GetDate;
    property DateString: string read FDateString write FDateString;
    property TimeIn: double read FTimeIn write FTimeIn;
    property TimeOut: double read FTimeOut write FTimeOut;
    property AmPm: string read FAmPm write FAmPm;
    property Period: TPeriod read FPeriod write FPeriod;
    property ReasonCode: string read FReasonCode write FReasonCode;
    property IsCancelled: boolean read FIsCancelled write FIsCancelled;
    property EditAllowed: boolean read GetEditAllowed;
    property IsNew: boolean read FIsNew write FIsNew;
    property TimeInConverted: double read GetTimeInConverted;
    property TimeOutConverted: double read GetTimeOutConverted;

    procedure Save;

    class procedure Append(const pd: TPeriod);
    class procedure Cancel(const pd: TPeriod);
  end;

implementation

{ TOverride }

uses
  TimeLogData, AttendanceUtils;

class procedure TOverride.Append(const pd: TPeriod);
begin
  with dmTimelog do
  begin
    if pd = pdAm then dstOverrideAM.Append
    else if pd = pdPm then dstOverridePM.Append;
  end;
end;

class procedure TOverride.Cancel(const pd: TPeriod);
begin

end;

function TOverride.GetDate: TDateTime;
var
  list: TStringList;
begin
  list := TStringList.Create;
  list.Delimiter := '-';
  list.DelimitedText := FDateString;

  Result := EncodeDate(StrToInt(list[0]), StrToInt(list[1]), StrToInt(list[2]));
end;

function TOverride.GetEditAllowed: boolean;
begin
  Result := FIsNew;
end;

function TOverride.GetTimeInConverted: double;
begin
  Result := ConvertTime(FTimeIn);
end;

function TOverride.GetTimeOutConverted: double;
begin
  Result := ConvertTime(FTimeOut);
end;

procedure TOverride.Save;
begin
  with dmTimelog do
  begin
    if FPeriod = pdAm then
    begin
      if dstOverrideAM.State <> dsInsert then dstOverrideAM.Edit;

      dstOverrideAM.FieldByName('id_num').AsString := FEmployee.IdNumber;
      dstOverrideAM.FieldByName('dtr_date').AsString := FDateString;
      dstOverrideAM.FieldByName('time_in').AsString := TimeToStr(FTimeIn);
      dstOverrideAM.FieldByName('time_out').AsString := TimeToStr(FTimeOut);
      dstOverrideAM.Post;
    end
    else
    begin
      if dstOverridePM.State <> dsInsert then dstOverridePM.Edit;

      dstOverridePM.FieldByName('id_num').AsString := FEmployee.IdNumber;
      dstOverridePM.FieldByName('dtr_date').AsString := FDateString;
      dstOverridePM.FieldByName('time_in').AsString := TimeToStr(FTimeIn);
      dstOverridePM.FieldByName('time_out').AsString := TimeToStr(FTimeOut);
      dstOverridePM.Post;
    end;
  end;
end;

end.
