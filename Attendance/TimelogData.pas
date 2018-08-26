unit TimelogData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmTimelog = class(TDataModule)
    dstLogs: TADODataSet;
    dstEmployees: TADODataSet;
    dscEmployees: TDataSource;
    dstUndertimeAM: TADODataSet;
    dscUndertimeAM: TDataSource;
    dscUndertimePM: TDataSource;
    dstUndertimePM: TADODataSet;
    dscUndertimeReason: TDataSource;
    dstUndertimeReason: TADODataSet;
    dscForApproval: TDataSource;
    dstForApproval: TADODataSet;
    dstForApprovalentitlement: TWordField;
    dstForApprovaldt: TDateTimeField;
    dstForApprovalid_num: TStringField;
    dstForApprovallocation_code: TStringField;
    dstForApprovaltime_from: TStringField;
    dstForApprovaltime_until: TStringField;
    dstForApprovalreason: TStringField;
    dstForApprovalremarks: TStringField;
    dstForApprovalemployee_name: TStringField;
    dstForApprovaldt_f: TStringField;
    dstForApprovaltime_from_f: TStringField;
    dstForApprovaltime_until_f: TStringField;
    dstForApprovalleave_id: TIntegerField;
    dstForApprovaldepartment_code: TStringField;
    dstForApprovalpositiontype_code: TStringField;
    dstForApprovalapp_dt: TDateTimeField;
    dstForApprovalapp_dt_f: TStringField;
    dstForApprovalstatus: TStringField;
    dstForApprovalam_pm: TStringField;
    dstForApprovalemployee_location_code: TStringField;
    dstForApprovalam_pm_f: TStringField;
    dstForApprovalis_paid: TWordField;
    dstForApprovalis_paid_f: TStringField;
    dstForApprovalleave_type: TStringField;
    dstForApprovaltime_in_am_f: TStringField;
    dstForApprovaltime_out_am_f: TStringField;
    dstForApprovaltime_in_pm_f: TStringField;
    dstForApprovaltime_out_pm_f: TStringField;
    dstResourceTypes: TADODataSet;
    dstOverrideAM: TADODataSet;
    dscOverrideAM: TDataSource;
    dscOverridePM: TDataSource;
    dstOverridePM: TADODataSet;
    dscOverrideReasons: TDataSource;
    dstOverrideReasons: TADODataSet;
    procedure dstLogsAfterOpen(DataSet: TDataSet);
    procedure dstUndertimeAMNewRecord(DataSet: TDataSet);
    procedure dstUndertimePMNewRecord(DataSet: TDataSet);
    procedure dstForApprovalCalcFields(DataSet: TDataSet);
    procedure dstForApprovalAfterScroll(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstOverrideAMNewRecord(DataSet: TDataSet);
    procedure dstOverridePMNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTimelog: TdmTimelog;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  AppData, Timelogs, TimeLog, HRISGlobal, AttendanceUtils, Entitlement,
  Employee, Leave, Holiday;

procedure TdmTimelog.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(leaveApp) then leaveApp.Free;
  if Assigned(utApp) then utApp.Free;
end;

procedure TdmTimelog.dstForApprovalAfterScroll(DataSet: TDataSet);
var
  log: TLog;
begin
  with DataSet do
  begin
    if FieldByName('entitlement').AsInteger = 0 then
    begin
      leaveApp := TLeaveApproval.Create;
      leaveApp.Id := FieldByName('leave_id').AsInteger;
      leaveApp.LocationCode := FieldByName('location_code').AsString;
      leaveApp.IdNum := FieldByName('id_num').AsString;
      leaveApp.Date := FieldByName('dt').AsDateTime;
      leaveApp.AmPm := FieldByName('am_pm').AsString;

      log := TLog.Create;
      log.TimeInAM := FieldByName('time_in_am_f').AsString;
      log.TimeOutAM := FieldByName('time_out_am_f').AsString;
      log.TimeInPM := FieldByName('time_in_pm_f').AsString;
      log.TimeOutPM := FieldByName('time_out_pm_f').AsString;

      leaveApp.Log := log;
    end
    else
    begin
      utApp := TUndertimeApproval.Create;
      utApp.IdNum := FieldByName('id_num').AsString;
      utApp.Date := FieldByName('dt').AsDateTime;
      utApp.AmPm := FieldByName('am_pm').AsString;
    end;
  end;
end;

procedure TdmTimelog.dstForApprovalCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('time_from_f').AsString := FormatTimeString(FieldByName('time_from').AsString);
    FieldByName('time_until_f').AsString := FormatTimeString(FieldByName('time_until').AsString);
    FieldByName('status').AsString := 'PND';
  end;
end;

procedure TdmTimelog.dstLogsAfterOpen(DataSet: TDataSet);
var
  log: TTimelog;
  emp: TBaseEmployeeExt;
begin
  with DataSet, tlogs do
  begin
    Clear;
    while not Eof do
    begin
      log := TTimelog.Create;

      log.Date := FieldByName('dt').AsDateTime;
      log.TimeInAM := FieldByName('time_in_am').AsString;
      log.TimeOutAM := FieldByName('time_out_am').AsString;
      log.TimeInPM := FieldByName('time_in_pm').AsString;
      log.TimeOutPM := FieldByName('time_out_pm').AsString;
      log.TotalHoursAM := FieldByName('total_hours_am').AsFloat;
      log.TotalHoursPM := FieldByName('total_hours_pm').AsFloat;

      // employee
      emp := TBaseEmployeeExt.Create;
      emp.IdNumber := FieldByName('id_num').AsString;
      emp.FirstName := FieldByName('employee_firstname').AsString;
      emp.LastName := FieldByName('employee_lastname').AsString;
      emp.LocationCode := FieldByName('location_code').AsString;
      emp.DepartmentCode := FieldByName('department_code').AsString;
      emp.PositionTypeCode := FieldByName('positiontype_code').AsString;

      log.Employee := emp;

      // leave whole day
      if FieldByName('leave_date_full').AsString <> '' then
        log.AddLeave(TLeave.Create('',
                FieldByName('leavetype_code_full').AsString,
                FieldByName('leavetype_name_full').AsString,
                FieldByName('leave_reason_full').AsString,
                FieldByName('leave_remarks_full').AsString,
                FieldByName('is_paid_leave_full').AsInteger = 1));

      // leave am
      if FieldByName('leave_date_am').AsString <> '' then
        log.AddLeave(TLeave.Create('A',
                FieldByName('leavetype_code_am').AsString,
                FieldByName('leavetype_name_am').AsString,
                FieldByName('leave_reason_am').AsString,
                FieldByName('leave_remarks_am').AsString,
                FieldByName('is_paid_leave_am').AsInteger = 1));

      // leave pm
      if FieldByName('leave_date_pm').AsString <> '' then
        log.AddLeave(TLeave.Create('P',
                FieldByName('leavetype_code_pm').AsString,
                FieldByName('leavetype_name_pm').AsString,
                FieldByName('leave_reason_pm').AsString,
                FieldByName('leave_remarks_pm').AsString,
                FieldByName('is_paid_leave_pm').AsInteger = 1));

      // undertime am
      if FieldByName('undertime_date_am').AsString <> '' then
        log.AddUndertime(TUndertime.Create(
                FieldByName('time_from_am').AsString,
                FieldByName('time_until_am').AsString,
                'A',
                FieldByName('ut_reason_am').AsString,
                FieldByName('is_paid_undertime_am').AsInteger = 1));

      // undertime pm
      if FieldByName('undertime_date_pm').AsString <> '' then
        log.AddUndertime(TUndertime.Create(
                FieldByName('time_from_pm').AsString,
                FieldByName('time_until_pm').AsString,
                'P',
                FieldByName('ut_reason_pm').AsString,
                FieldByName('is_paid_undertime_pm').AsInteger = 1));

      // override am
      if FieldByName('override_date_am').AsString <> '' then
        log.AddOverride(TOverride.Create(
                FieldByName('o_time_in_am').AsString,
                FieldByName('o_time_out_am').AsString,
                'A',
                FieldByName('ov_reason_am').AsString
                ));

      // override pm
      if FieldByName('override_date_pm').AsString <> '' then
        log.AddOverride(TOverride.Create(
                FieldByName('o_time_in_pm').AsString,
                FieldByName('o_time_out_pm').AsString,
                'P',
                FieldByName('ov_reason_pm').AsString
                ));

      // holiday
      if FieldByName('holiday_date').AsString <> '' then
      begin
        log.Holiday := THoliday.Create(
                        FieldByName('holiday_name').Asstring,
                        FieldByName('holiday_is_national').AsInteger
                        );
      end;

      AddLog(log);

      Next;
    end;
  end;
end;

procedure TdmTimelog.dstOverrideAMNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('am_pm').AsString := 'A';
    FieldByName('overriden_by').AsString := HRIS.User.UserId;
    FieldByName('location_code').AsString := HRIS.LocationCode;
    FieldByName('is_cancelled').AsInteger := 0;
  end;
end;

procedure TdmTimelog.dstOverridePMNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('am_pm').AsString := 'P';
    FieldByName('overriden_by').AsString := HRIS.User.UserId;
    FieldByName('location_code').AsString := HRIS.LocationCode;
    FieldByName('is_cancelled').AsInteger := 0;
  end;
end;

procedure TdmTimelog.dstUndertimeAMNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('am_pm').AsString := 'A';
    FieldByName('timestatus_code').AsString := 'PND';
    FieldByName('created_by').AsString := HRIS.User.UserId;
    FieldByName('is_paid').AsInteger := 0;
  end;
end;

procedure TdmTimelog.dstUndertimePMNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('am_pm').AsString := 'P';
    FieldByName('timestatus_code').AsString := 'PND';
    FieldByName('created_by').AsString := HRIS.User.UserId;
    FieldByName('is_paid').AsInteger := 0;
  end;
end;

end.
