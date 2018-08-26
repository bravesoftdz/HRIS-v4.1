object dmTimelog: TdmTimelog
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 382
  Width = 676
  object dstLogs: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = dstLogsAfterOpen
    CommandText = 'dtr_get_logs;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end
      item
        Name = '@branch_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = ''
      end>
    Left = 47
    Top = 24
  end
  object dstEmployees: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'dtr_get_logs_employees;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 159
    Top = 88
  end
  object dscEmployees: TDataSource
    DataSet = dstEmployees
    Left = 248
    Top = 88
  end
  object dstUndertimeAM: TADODataSet
    AutoCalcFields = False
    Connection = dmApplication.acMain
    CursorType = ctStatic
    OnNewRecord = dstUndertimeAMNewRecord
    CommandText = 'dtr_get_undertime_am;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 138
    Top = 176
  end
  object dscUndertimeAM: TDataSource
    DataSet = dstUndertimeAM
    Left = 250
    Top = 176
  end
  object dscUndertimePM: TDataSource
    DataSet = dstUndertimePM
    Left = 250
    Top = 232
  end
  object dstUndertimePM: TADODataSet
    AutoCalcFields = False
    Connection = dmApplication.acMain
    CursorType = ctStatic
    OnNewRecord = dstUndertimePMNewRecord
    CommandText = 'dtr_get_undertime_pm;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 138
    Top = 232
  end
  object dscUndertimeReason: TDataSource
    DataSet = dstUndertimeReason
    Left = 247
    Top = 288
  end
  object dstUndertimeReason: TADODataSet
    AutoCalcFields = False
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_undertime_reasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 135
    Top = 288
  end
  object dscForApproval: TDataSource
    DataSet = dstForApproval
    Left = 247
    Top = 24
  end
  object dstForApproval: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = dstForApprovalAfterScroll
    OnCalcFields = dstForApprovalCalcFields
    CommandText = 'dtr_get_for_approval;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@payroll_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = ''
      end>
    Left = 159
    Top = 24
    object dstForApprovalentitlement: TWordField
      FieldName = 'entitlement'
    end
    object dstForApprovaldt: TDateTimeField
      FieldName = 'dt'
    end
    object dstForApprovalid_num: TStringField
      FieldName = 'id_num'
      Size = 12
    end
    object dstForApprovallocation_code: TStringField
      FieldName = 'location_code'
      FixedChar = True
      Size = 3
    end
    object dstForApprovaltime_from: TStringField
      FieldName = 'time_from'
      FixedChar = True
      Size = 5
    end
    object dstForApprovaltime_until: TStringField
      FieldName = 'time_until'
      FixedChar = True
      Size = 5
    end
    object dstForApprovalreason: TStringField
      FieldName = 'reason'
      Size = 100
    end
    object dstForApprovalremarks: TStringField
      FieldName = 'remarks'
      Size = 100
    end
    object dstForApprovalemployee_name: TStringField
      FieldName = 'employee_name'
      ReadOnly = True
      Size = 102
    end
    object dstForApprovaldt_f: TStringField
      FieldName = 'dt_f'
      ReadOnly = True
      Size = 10
    end
    object dstForApprovaltime_from_f: TStringField
      FieldKind = fkCalculated
      FieldName = 'time_from_f'
      FixedChar = True
      Size = 5
      Calculated = True
    end
    object dstForApprovaltime_until_f: TStringField
      FieldKind = fkCalculated
      FieldName = 'time_until_f'
      FixedChar = True
      Size = 5
      Calculated = True
    end
    object dstForApprovalleave_id: TIntegerField
      FieldName = 'leave_id'
    end
    object dstForApprovaldepartment_code: TStringField
      FieldName = 'department_code'
      FixedChar = True
      Size = 3
    end
    object dstForApprovalpositiontype_code: TStringField
      FieldName = 'positiontype_code'
      FixedChar = True
      Size = 3
    end
    object dstForApprovalapp_dt: TDateTimeField
      FieldName = 'app_dt'
    end
    object dstForApprovalapp_dt_f: TStringField
      FieldName = 'app_dt_f'
      ReadOnly = True
      Size = 10
    end
    object dstForApprovalstatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'status'
      Size = 3
      Calculated = True
    end
    object dstForApprovalam_pm: TStringField
      FieldName = 'am_pm'
      FixedChar = True
      Size = 1
    end
    object dstForApprovalemployee_location_code: TStringField
      FieldName = 'employee_location_code'
      FixedChar = True
      Size = 3
    end
    object dstForApprovalam_pm_f: TStringField
      FieldName = 'am_pm_f'
      ReadOnly = True
      Size = 14
    end
    object dstForApprovalis_paid: TWordField
      FieldName = 'is_paid'
    end
    object dstForApprovalis_paid_f: TStringField
      FieldName = 'is_paid_f'
      ReadOnly = True
      Size = 3
    end
    object dstForApprovalleave_type: TStringField
      FieldName = 'leave_type'
      Size = 100
    end
    object dstForApprovaltime_in_am_f: TStringField
      FieldName = 'time_in_am_f'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object dstForApprovaltime_out_am_f: TStringField
      FieldName = 'time_out_am_f'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object dstForApprovaltime_in_pm_f: TStringField
      FieldName = 'time_in_pm_f'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object dstForApprovaltime_out_pm_f: TStringField
      FieldName = 'time_out_pm_f'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
  end
  object dstResourceTypes: TADODataSet
    AutoCalcFields = False
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    OnNewRecord = dstUndertimePMNewRecord
    CommandText = 'hris_dd_get_resource_types;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@filter_position'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 42
    Top = 88
  end
  object dstOverrideAM: TADODataSet
    AutoCalcFields = False
    Connection = dmApplication.acMain
    CursorType = ctStatic
    OnNewRecord = dstOverrideAMNewRecord
    CommandText = 'dtr_get_override_by_date_am;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 458
    Top = 24
  end
  object dscOverrideAM: TDataSource
    DataSet = dstOverrideAM
    Left = 570
    Top = 24
  end
  object dscOverridePM: TDataSource
    DataSet = dstOverridePM
    Left = 570
    Top = 80
  end
  object dstOverridePM: TADODataSet
    AutoCalcFields = False
    Connection = dmApplication.acMain
    CursorType = ctStatic
    OnNewRecord = dstOverridePMNewRecord
    CommandText = 'dtr_get_override_by_date_pm;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@dtr_date_from'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@dtr_date_until'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 458
    Top = 80
  end
  object dscOverrideReasons: TDataSource
    DataSet = dstOverrideReasons
    Left = 567
    Top = 136
  end
  object dstOverrideReasons: TADODataSet
    AutoCalcFields = False
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_override_reasons;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 455
    Top = 136
  end
end
