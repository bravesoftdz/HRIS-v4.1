unit Entitlement;

interface

uses
  SysUtils;

type
  TStatus = (stApprove,stDeny,stCancel);

type
  TLog = class
  private
    FTimeInAM: string;
    FTimeOutAM: string;
    FTimeInPM: string;
    FTimeOutPM: string;
  public
    property TimeInAM: string read FTimeInAM write FTimeInAM;
    property TimeOutAM: string read FTimeOutAM write FTimeOutAM;
    property TimeInPM: string read FTimeInPM write FTimeInPM;
    property TimeOutPM: string read FTimeOutPM write FTimeOutPM;
  end;

type
  TLeaveApproval = class
  private
    FId: integer;
    FLocationCode: string;
    FIdNum: string;
    FDate: TDate;
    FAmPm: string;
    FLog: TLog;
  public
    property Id: integer read FId write FId;
    property LocationCode: string read FLocationCode write FLocationCode;
    property IdNum: string read FIdNum write FIdNum;
    property Date: TDate read FDate write FDate;
    property AmPm: string read FAmPm write FAmPm;
    property Log: TLog read FLog write FLog;

    function ConflictExists: boolean;

    procedure ChangeStatus(const status: TStatus);
    procedure CancelLogs;

    constructor Create;
  end;

type
  TUndertimeApproval = class
  private
    FIdNum: string;
    FDate: TDate;
    FAmPm: string;
  public
    property IdNum: string read FIdNum write FIdNum;
    property Date: TDate read FDate write FDate;
    property AmPm: string read FAmPm write FAmPm;

    procedure ChangeStatus(const status: TStatus);

    constructor Create;
  end;

function GetStatusName(const status: TStatus): string;

var
  leaveApp: TLeaveApproval;
  utApp: TUndertimeApproval;

implementation

uses
  DBUtil, HRISGlobal;

function GetStatusName(const status: TStatus): string;
begin
  case status of
    stApprove: Result := 'APP';
    stDeny: Result := 'DND';
    stCancel: Result := 'CNL';
  end;
end;

constructor TLeaveApproval.Create;
begin
  if leaveApp <> nil then leaveApp := self
  else inherited Create;
end;

procedure TLeaveApproval.ChangeStatus(const status: TStatus);
var
  lstatus, dt, sql: string;
begin
  lstatus := GetStatusName(status);

  dt := FormatDateTime('yyyy-mm-dd', FDate);

  sql := 'UPDATE leavedetail ' +
         '   SET leavestatus_code = ''' + lstatus + '''' +
         ' WHERE leave_date = ''' + dt +  '''' +
         '   AND leave_id = ' + IntToStr(FId) +
         '   AND location_code = ''' + FLocationCode + '''';

  ExecuteSQL(sql);

  // cancel the time log and override for conflicts
  if (status = stApprove) and (ConflictExists) then leaveApp.CancelLogs;
end;


procedure TLeaveApproval.CancelLogs;
var
  sql, ov, dt: string;
begin
  // cancel the time logs depending on leave is in the morning, afternoon or whole day
  dt := FormatDateTime('yyyy-mm-dd', FDate);

  if FAmPm = 'A' then
    sql := 'UPDATE dtr ' +
           '   SET dtrstatus_code = ''CNL''' +
           ' WHERE dtr_date = ''' + dt +  '''' +
           '   AND id_num = ''' + FIdNum + '''' +
           '   AND time_in < ''' + FormatDateTime('hh:mm:ss',TTime(HRIS.TimeOutAM)) + ''''
  else if FAmPm = 'P' then
    sql := 'UPDATE dtr ' +
           '   SET dtrstatus_code = ''CNL''' +
           ' WHERE dtr_date = ''' + dt +  '''' +
           '   AND id_num = ''' + FIdNum + '''' +
           '   AND time_in BETWEEN ''' + FormatDateTime('hh:mm:ss',TTime(HRIS.TimeOutAM)) + '''' +
           '   AND ''' + FormatDateTime('hh:mm:ss',TTime(HRIS.TimeOutPM)) + ''''
  else
    sql := 'UPDATE dtr ' +
           '   SET dtrstatus_code = ''CNL''' +
           ' WHERE dtr_date = ''' + dt +  '''' +
           '   AND id_num = ''' + FIdNum + '''';

  // include override cancel
  if FAmPm = 'A' then
    ov := 'UPDATE dtroverride ' +
          '   SET is_cancelled = 1' +
          ' WHERE dtr_date = ''' + dt +  '''' +
          '   AND id_num = ''' + FIdNum + '''' +
          '   AND am_pm = ''A'''
  else if FAmPm = 'P' then
    ov := 'UPDATE dtroverride ' +
          '   SET is_cancelled = 1' +
          ' WHERE dtr_date = ''' + dt +  '''' +
          '   AND id_num = ''' + FIdNum + '''' +
          '   AND am_pm = ''P'''
  else
    ov := 'UPDATE dtroverride ' +
          '   SET is_cancelled = 1' +
          ' WHERE dtr_date = ''' + dt +  '''' +
          '   AND id_num = ''' + FIdNum + '''';

  ExecuteSQL(sql + ov);
end;

function TLeaveApproval.ConflictExists: boolean;
begin
  Result := ((FAmPm = 'A') and (FLog.TimeInAM <> ''))
            or ((FAmPm = 'P') and (FLog.TimeInPM <> ''))
            or ((Trim(FAmPm) = '') and (FLog.TimeInAM <> ''))
            or ((Trim(FAmPm) = '') and (FLog.TimeInPM <> ''));
end;

constructor TUndertimeApproval.Create;
begin
  if utApp <> nil then utApp := self
  else inherited Create;
end;

procedure TUndertimeApproval.ChangeStatus(const status: TStatus);
var
  lstatus, dt, sql: string;
begin
  lstatus := GetStatusName(status);

  dt := FormatDateTime('yyyy-mm-dd', FDate);

  sql := 'UPDATE dtrundertime SET timestatus_code = ''' + lstatus + '''' +
        ' WHERE dtr_date = ''' + dt +  '''' +
        ' AND id_num = ''' + FIdNum + '''' +
        ' AND ISNULL(am_pm,'''') = ''' + Trim(FAmPm) + '''';

  ExecuteSQL(sql);
end;

end.
