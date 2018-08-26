object dmApplication: TdmApplication
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 255
  Width = 514
  object acMain: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=HRIS;Data Source=BRYAN-X1C\' +
      'DEVELOPMENT;Use Procedure for Prepare=1;Auto Translate=True;Pack' +
      'et Size=4096;Workstation ID=BRYAN;Initial File Name="";Use Encry' +
      'ption for Data=False;Tag with column collation when possible=Fal' +
      'se;MARS Connection=False;DataTypeCompatibility=0;Trust Server Ce' +
      'rtificate=False;Server SPN="";Application Intent=READWRITE;'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    BeforeConnect = acMainBeforeConnect
    Left = 56
    Top = 24
  end
  object dstUser: TADODataSet
    Connection = acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sec_get_user_by_username'
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
        Name = '@username'
        Attributes = [paNullable]
        DataType = ftString
        Size = 25
        Value = ''
      end>
    Left = 128
    Top = 24
  end
  object dstConfig: TADODataSet
    Connection = acMain
    LockType = ltReadOnly
    CommandText = 'sysconfig'
    CommandType = cmdTableDirect
    Parameters = <>
    Left = 128
    Top = 80
  end
  object dstPayrollCode: TADODataSet
    Connection = acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'dtr_dd_get_payroll_codes;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 216
    Top = 24
  end
  object dstLocation: TADODataSet
    Connection = acMain
    LockType = ltReadOnly
    CommandText = 'hris_get_locations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 216
    Top = 80
  end
  object dstEmployees: TADODataSet
    Connection = acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    BeforeOpen = dstEmployeesBeforeOpen
    CommandText = 'dtr_get_employees;1'
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
      end>
    Left = 328
    Top = 24
  end
  object dscEmployees: TDataSource
    DataSet = dstEmployees
    Left = 400
    Top = 24
  end
  object dstHRISEmployees: TADODataSet
    Connection = acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'hris_get_employees;1'
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
        Name = '@lastname'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@firstname'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@option'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 328
    Top = 80
  end
  object dscHRISEmployees: TDataSource
    DataSet = dstHRISEmployees
    Left = 400
    Top = 80
  end
  object dscPendingPAF: TDataSource
    DataSet = dstPendingPAF
    Left = 400
    Top = 144
  end
  object dstPendingPAF: TADODataSet
    Tag = 4
    Connection = acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstPendingPAFBeforeOpen
    CommandText = 'hris_get_paf_list_pending;1'
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
        Name = '@user_id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 328
    Top = 144
    object dstPendingPAFpaf_id: TIntegerField
      FieldName = 'paf_id'
      ReadOnly = True
    end
    object dstPendingPAFid_num: TStringField
      FieldName = 'id_num'
      Size = 12
    end
    object dstPendingPAFemployee_firstname: TStringField
      FieldName = 'employee_firstname'
      Size = 50
    end
    object dstPendingPAFemployee_lastname: TStringField
      FieldName = 'employee_lastname'
      Size = 50
    end
    object dstPendingPAFemployee_middlename: TStringField
      FieldName = 'employee_middlename'
      Size = 50
    end
    object dstPendingPAFemployee_name: TStringField
      FieldName = 'employee_name'
      ReadOnly = True
      Size = 102
    end
    object dstPendingPAFposition_name: TStringField
      FieldName = 'position_name'
      Size = 25
    end
    object dstPendingPAFposstatus_name: TStringField
      FieldName = 'posstatus_name'
      Size = 25
    end
    object dstPendingPAFempstatus_name: TStringField
      FieldName = 'empstatus_name'
      Size = 25
    end
    object dstPendingPAFlocation_name: TStringField
      FieldName = 'location_name'
      Size = 50
    end
    object dstPendingPAFsalary: TBCDField
      FieldName = 'salary'
      DisplayFormat = '###,##0.00'
      Precision = 10
      Size = 2
    end
    object dstPendingPAFeffective_date: TDateTimeField
      FieldName = 'effective_date'
      DisplayFormat = 'mm/dd/yyyy'
    end
    object dstPendingPAFeffective_until: TDateTimeField
      FieldName = 'effective_until'
      DisplayFormat = 'mm/dd/yyyy'
    end
    object dstPendingPAFrank_movement: TIntegerField
      FieldName = 'rank_movement'
      ReadOnly = True
    end
    object dstPendingPAFpafstatus_code: TStringField
      FieldName = 'pafstatus_code'
      FixedChar = True
      Size = 3
    end
    object dstPendingPAFis_cancelled: TSmallintField
      FieldName = 'is_cancelled'
    end
    object dstPendingPAFis_external: TSmallintField
      FieldName = 'is_external'
    end
  end
end
