object dmPaf: TdmPaf
  OldCreateOrder = False
  Height = 465
  Width = 912
  object dscPaf: TDataSource
    DataSet = dstPaf
    Left = 128
    Top = 24
  end
  object dstPaf: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_paf;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 256
    Top = 24
    object dstPafeffective_date: TDateTimeField
      DisplayLabel = 'Effective date'
      FieldName = 'effective_date'
      Required = True
    end
    object dstPafeffective_until: TDateTimeField
      DisplayLabel = 'Effective until'
      FieldName = 'effective_until'
    end
    object dstPafposition_code: TStringField
      DisplayLabel = 'Position'
      FieldName = 'position_code'
      Required = True
      FixedChar = True
      Size = 3
    end
    object dstPafposstatus_code: TStringField
      DisplayLabel = 'Position status'
      FieldName = 'posstatus_code'
      Required = True
      FixedChar = True
      Size = 3
    end
    object dstPafempstatus_code: TStringField
      DisplayLabel = 'Employment status'
      FieldName = 'empstatus_code'
      Required = True
      FixedChar = True
      Size = 3
    end
    object dstPaflocation_code: TStringField
      DisplayLabel = 'Location'
      FieldName = 'location_code'
      Required = True
      FixedChar = True
      Size = 3
    end
    object dstPafdepartment_code: TStringField
      DisplayLabel = 'Department'
      FieldName = 'department_code'
      FixedChar = True
      Size = 3
    end
    object dstPafsalary: TBCDField
      DisplayLabel = 'Salary'
      FieldName = 'salary'
      Required = True
      Precision = 10
      Size = 2
    end
    object dstPaffrequency_code: TStringField
      DisplayLabel = 'Salary frequency'
      FieldName = 'frequency_code'
      Required = True
      FixedChar = True
      Size = 3
    end
    object dstPafid_num: TStringField
      Tag = 1
      FieldName = 'id_num'
      Size = 12
    end
    object dstPafpaf_remarks: TStringField
      FieldName = 'paf_remarks'
      Size = 250
    end
    object dstPafcreated_by: TStringField
      Tag = 1
      FieldName = 'created_by'
      Size = 12
    end
    object dstPafcreated_date: TDateTimeField
      Tag = 1
      FieldName = 'created_date'
    end
    object dstPafmodified_by: TStringField
      Tag = 1
      FieldName = 'modified_by'
      Size = 12
    end
    object dstPafmodified_date: TDateTimeField
      Tag = 1
      FieldName = 'modified_date'
    end
    object dstPafrank_movement: TIntegerField
      Tag = 1
      FieldName = 'rank_movement'
      ReadOnly = True
    end
    object dstPafis_cancelled: TSmallintField
      Tag = 1
      FieldName = 'is_cancelled'
    end
    object dstPafpafstatus_code: TStringField
      Tag = 1
      FieldName = 'pafstatus_code'
      FixedChar = True
      Size = 3
    end
    object dstPafpaf_id: TAutoIncField
      Tag = 1
      FieldName = 'paf_id'
      ReadOnly = True
    end
  end
  object dscPafComp: TDataSource
    DataSet = dstPafComp
    Left = 128
    Top = 88
  end
  object dstPafComp: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    LockType = ltBatchOptimistic
    CommandText = 'hris_get_paf_comp;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 256
    Top = 88
  end
  object dscPafAllowances: TDataSource
    DataSet = dstPafAllowances
    Left = 128
    Top = 152
  end
  object dstPafAllowances: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'hris_get_paf_allowances;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 256
    Top = 152
    object dstPafAllowancespafallowance_id: TAutoIncField
      FieldName = 'pafallowance_id'
      ReadOnly = True
    end
    object dstPafAllowancespaf_id: TIntegerField
      FieldName = 'paf_id'
    end
    object dstPafAllowancesallowancetype_code: TStringField
      DisplayLabel = 'Allowance type'
      FieldName = 'allowancetype_code'
      Required = True
      FixedChar = True
      Size = 3
    end
    object dstPafAllowancesallowance_amount: TBCDField
      DisplayLabel = 'Allowance amount'
      FieldName = 'allowance_amount'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 10
      Size = 2
    end
    object dstPafAllowancesexpiry_date: TDateTimeField
      FieldName = 'expiry_date'
      DisplayFormat = 'mm/dd/yyyy'
    end
    object dstPafAllowancesallowancetype_name: TStringField
      FieldKind = fkLookup
      FieldName = 'allowancetype_name'
      LookupDataSet = dstAllowanceTypes
      LookupKeyFields = 'allowancetype_code'
      LookupResultField = 'allowancetype_name'
      KeyFields = 'allowancetype_code'
      Size = 100
      Lookup = True
    end
  end
  object dscAllowanceTypes: TDataSource
    DataSet = dstAllowanceTypes
    Left = 384
    Top = 24
  end
  object dstAllowanceTypes: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    CommandText = 'hris_dd_get_allowance_types;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 504
    Top = 24
  end
  object dscLatestPaf: TDataSource
    DataSet = dstLatestPaf
    Left = 128
    Top = 216
  end
  object dstLatestPaf: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_get_latest_paf;1'
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
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end
      item
        Name = '@as_of_date'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 256
    Top = 216
  end
  object dscPosition: TDataSource
    DataSet = dstPosition
    Left = 384
    Top = 88
  end
  object dstPosition: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_position;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 504
    Top = 88
  end
  object dscPositionStatus: TDataSource
    DataSet = dstPositionStatus
    Left = 384
    Top = 152
  end
  object dstPositionStatus: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_position_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 504
    Top = 152
  end
  object dscEmpStatus: TDataSource
    DataSet = dstEmpStatus
    Left = 384
    Top = 216
  end
  object dstEmpStatus: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_emp_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 504
    Top = 216
  end
  object dscLocations: TDataSource
    DataSet = dstLocations
    Left = 384
    Top = 280
  end
  object dstLocations: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_locations;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 504
    Top = 280
  end
  object dscLatestPafAllowances: TDataSource
    DataSet = dstLatestPafAllowances
    Left = 128
    Top = 280
  end
  object dstLatestPafAllowances: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_get_latest_paf_allowances;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 256
    Top = 280
  end
  object dscSalaryFrequency: TDataSource
    DataSet = dstSalaryFrequency
    Left = 608
    Top = 24
  end
  object dstSalaryFrequency: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_salary_frequencies;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 728
    Top = 24
  end
  object dscDepartments: TDataSource
    DataSet = dstDepartments
    Left = 384
    Top = 344
  end
  object dstDepartments: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    CommandText = 'hris_dd_get_departments;1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 504
    Top = 344
  end
  object dscPafStatus: TDataSource
    DataSet = dstPafStatus
    Left = 608
    Top = 88
  end
  object dstPafStatus: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_paf_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 728
    Top = 88
  end
  object dscPafPrint: TDataSource
    DataSet = dstPafPrint
    Left = 608
    Top = 152
  end
  object dstPafPrint: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'rpt_paf;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1508
      end>
    Left = 728
    Top = 152
  end
  object dscPafSignatories: TDataSource
    DataSet = dstPafSignatories
    Left = 608
    Top = 216
  end
  object dstPafSignatories: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'rpt_paf_signatories;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 728
    Top = 216
  end
  object spPafEffectiveUntil: TADOStoredProc
    Connection = dmApplication.acMain
    ProcedureName = 'hris_paf_effective_until;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end>
    Left = 608
    Top = 344
  end
  object dstPafBranchManagers: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'rpt_paf_get_bm;1'
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
        Name = '@paf_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 728
    Top = 280
  end
  object spUpdateEmployee: TADOStoredProc
    Connection = dmApplication.acMain
    ProcedureName = 'hris_paf_update_employee;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 728
    Top = 344
  end
end
