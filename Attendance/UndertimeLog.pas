unit UndertimeLog;

interface

uses
  SysUtils, Classes, DB, Employee;

type
  TPeriod = (pdAm, pdPm);

type
  TUndertimeLog = class
  private
    FEmployee: TBaseEmployee;
    FDateString: string;
    FTimeFrom: double;
    FTimeUntil: double;
    FStatus: string;
    FAmPm: string;
    FPeriod: TPeriod;
    FReasonCode: string;
    FIsPaid: boolean;

    function GetIsPending: boolean;
    function GetIsCancelled: boolean;
    function GetIsApproved: boolean;
    function GetIsDenied: boolean;
    function GetDate: TDateTime;
    function GetEditAllowed: boolean;
    function GetIsNew: boolean;
    function GetStatusName: string;
    function GetTimeFromFormatted: string;
    function GetTimeUntilFormatted: string;

  public
    property Employee: TBaseEmployee read FEmployee write FEmployee;
    property Date: TDateTime read GetDate;
    property DateString: string read FDateString write FDateString;
    property TimeFrom: double read FTimeFrom write FTimeFrom;
    property TimeUntil: double read FTimeUntil write FTimeUntil;
    property Status: string write FStatus;
    property AmPm: string read FAmPm write FAmPm;
    property IsPending: boolean read GetIsPending;
    property IsCancelled: boolean read GetIsCancelled;
    property IsApproved: boolean read GetIsApproved;
    property IsDenied: boolean read GetIsDenied;
    property Period: TPeriod read FPeriod write FPeriod;
    property ReasonCode: string read FReasonCode write FReasonCode;
    property IsPaid: boolean read FIsPaid write FIsPaid;
    property EditAllowed: boolean read GetEditAllowed;
    property IsNew: boolean read GetIsNew;
    property StatusName: string read GetStatusName;
    property TimeFromFormatted: string read GetTimeFromFormatted;
    property TimeUntilFormatted: string read GetTimeUntilFormatted;

    procedure Save;

    class procedure Append(const pd: TPeriod);
    class procedure Cancel(const pd: TPeriod);
  end;

implementation

uses
  TimelogData, AttendanceUtils;

procedure TUndertimeLog.Save;
begin
  with dmTimelog do
  begin
    if FPeriod = pdAm then
    begin
      if dstUndertimeAM.State <> dsInsert then dstUndertimeAM.Edit;

      if GetIsNew then FStatus := 'PND';

      dstUndertimeAM.FieldByName('id_num').AsString := FEmployee.IdNumber;
      dstUndertimeAM.FieldByName('dtr_date').AsString := FDateString;
      dstUndertimeAM.FieldByName('time_from').AsString := TimeToStr(FTimeFrom);
      dstUndertimeAM.FieldByName('time_until').AsString := TimeToStr(FTimeUntil);
      dstUndertimeAM.Post;
    end
    else
    begin
      if dstUndertimePM.State <> dsInsert then dstUndertimePM.Edit;

      if GetIsNew then FStatus := 'PND';

      dstUndertimePM.FieldByName('id_num').AsString := FEmployee.IdNumber;
      dstUndertimePM.FieldByName('dtr_date').AsString := FDateString;
      dstUndertimePM.FieldByName('time_from').AsString := TimeToStr(FTimeFrom);
      dstUndertimePM.FieldByName('time_until').AsString := TimeToStr(FTimeUntil);
      dstUndertimePM.Post;
    end;
  end;
end;

function TUndertimeLog.GetTimeFromFormatted: string;
begin
  Result := FormatTimeString(TimeToStr(FTimeFrom));
end;

function TUndertimeLog.GetTimeUntilFormatted: string;
begin
  Result := FormatTimeString(TimeToStr(FTimeUntil));
end;

class procedure TUndertimeLog.Append(const pd: TPeriod);
begin
  with dmTimelog do
  begin
    if pd = pdAm then dstUndertimeAM.Append
    else if pd = pdPm then dstUndertimePM.Append;
  end;
end;

class procedure TUndertimeLog.Cancel(const pd: TPeriod);
begin
  with dmTimelog do
  begin
    if (pd = pdAm) and (dstUndertimeAM.State = dsEdit) then dstUndertimeAM.Cancel
    else if (pd = pdPm) and (dstUndertimePM.State = dsEdit)  then dstUndertimePM.Cancel;
  end;
end;

function TUndertimeLog.GetIsPending: boolean;
begin
  Result := FStatus = 'PND';
end;

function TUndertimeLog.GetIsCancelled: boolean;
begin
  Result := FStatus = 'CNL';
end;

function TUndertimeLog.GetIsApproved: boolean;
begin
  Result := FStatus = 'APP';
end;

function TUndertimeLog.GetIsDenied: boolean;
begin
  Result := FStatus = 'DND';
end;

function TUndertimeLog.GetDate: TDateTime;
var
  list: TStringList;
begin
  list := TStringList.Create;
  list.Delimiter := '-';
  list.DelimitedText := FDateString;

  Result := EncodeDate(StrToInt(list[0]), StrToInt(list[1]), StrToInt(list[2]));
end;

function TUndertimeLog.GetEditAllowed: boolean;
begin
  Result := GetIsPending;
end;

function TUndertimeLog.GetIsNew: boolean;
begin
  Result := FStatus = '';
end;

function TUndertimeLog.GetStatusName: string;
begin
  if GetIsPending then Result := 'Pending'
  else if GetIsCancelled then Result := 'Cancelled'
  else if GetIsApproved then Result := 'Approved'
  else if GetIsDenied then Result := 'Denied'
  else Result := '';
end;

end.
