object dmEmployee: TdmEmployee
  OldCreateOrder = False
  Height = 432
  Width = 866
  object dsEmployee: TDataSource
    DataSet = dstEmployee
    Left = 160
    Top = 32
  end
  object dsReligion: TDataSource
    DataSet = dstReligion
    Left = 568
    Top = 32
  end
  object dsCivilStatus: TDataSource
    DataSet = dstCivilStatus
    Left = 568
    Top = 96
  end
  object dsBloodType: TDataSource
    DataSet = dstBloodType
    Left = 568
    Top = 160
  end
  object dstEmployee: TADODataSet
    Tag = 1
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_employee;1'
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
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = Null
      end>
    Left = 80
    Top = 33
    object dstEmployeeid_num: TStringField
      DisplayLabel = 'Identification number'
      FieldName = 'id_num'
      Required = True
      Size = 12
    end
    object dstEmployeeemployee_lastname: TStringField
      DisplayLabel = 'Lastname'
      FieldName = 'employee_lastname'
      Required = True
      Size = 50
    end
    object dstEmployeeemployee_firstname: TStringField
      DisplayLabel = 'Firstname'
      FieldName = 'employee_firstname'
      Required = True
      Size = 50
    end
    object dstEmployeeemployee_middlename: TStringField
      FieldName = 'employee_middlename'
      Size = 50
    end
    object dstEmployeebirth_date: TDateTimeField
      FieldName = 'birth_date'
    end
    object dstEmployeebirth_place: TStringField
      FieldName = 'birth_place'
      Size = 150
    end
    object dstEmployeegender: TStringField
      FieldName = 'gender'
      FixedChar = True
      Size = 1
    end
    object dstEmployeereligion_id: TIntegerField
      FieldName = 'religion_id'
    end
    object dstEmployeecivil_status: TStringField
      FieldName = 'civil_status'
      FixedChar = True
      Size = 3
    end
    object dstEmployeemarriage_date: TDateTimeField
      FieldName = 'marriage_date'
    end
    object dstEmployeeheight: TIntegerField
      FieldName = 'height'
    end
    object dstEmployeeweight: TIntegerField
      FieldName = 'weight'
    end
    object dstEmployeeblood_type: TStringField
      FieldName = 'blood_type'
      FixedChar = True
      Size = 2
    end
    object dstEmployeetin: TStringField
      FieldName = 'tin'
      Size = 12
    end
    object dstEmployeesss: TStringField
      FieldName = 'sss'
      Size = 12
    end
    object dstEmployeehdmf: TStringField
      FieldName = 'hdmf'
      Size = 12
    end
    object dstEmployeephic: TStringField
      FieldName = 'phic'
      Size = 12
    end
    object dstEmployeedrivers_license: TStringField
      FieldName = 'drivers_license'
      Size = 12
    end
    object dstEmployeeis_inactive: TSmallintField
      FieldName = 'is_inactive'
    end
    object dstEmployeepin: TStringField
      FieldName = 'pin'
      FixedChar = True
      Size = 2
    end
    object dstEmployeeis_external: TSmallintField
      FieldName = 'is_external'
    end
    object dstEmployeedeclare_dependents: TSmallintField
      FieldName = 'declare_dependents'
    end
    object dstEmployeelocation_code: TStringField
      FieldName = 'location_code'
      FixedChar = True
      Size = 3
    end
    object dstEmployeedepartment_code: TStringField
      FieldName = 'department_code'
      FixedChar = True
      Size = 3
    end
    object dstEmployeepositiontype_code: TStringField
      FieldName = 'positiontype_code'
      FixedChar = True
      Size = 3
    end
  end
  object dstReligion: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_religions;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 488
    Top = 33
  end
  object dstCivilStatus: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_civil_status;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 488
    Top = 97
  end
  object dstBloodType: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_dd_get_blood_types;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 488
    Top = 161
  end
  object dscEmpAddressH: TDataSource
    DataSet = dstEmpAddressH
    Left = 160
    Top = 96
  end
  object dstEmpAddressH: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_empaddress_h;1'
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
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = -1
        Value = ''
      end>
    Left = 72
    Top = 96
  end
  object dscEmpAddressP: TDataSource
    DataSet = dstEmpAddressP
    Left = 160
    Top = 160
  end
  object dstEmpAddressP: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_empaddress_p;1'
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
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = -1
        Value = ''
      end>
    Left = 72
    Top = 160
  end
  object dscEmpContactH: TDataSource
    DataSet = dstEmpContactH
    Left = 160
    Top = 224
  end
  object dstEmpContactH: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_empcontact_h;1'
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
      end>
    Left = 72
    Top = 224
  end
  object dscEmpContactP: TDataSource
    DataSet = dstEmpContactP
    Left = 160
    Top = 288
  end
  object dstEmpContactP: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_empcontact_p;1'
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
      end>
    Left = 72
    Top = 288
  end
  object dscEmpEmergency: TDataSource
    DataSet = dstEmpEmergency
    Left = 160
    Top = 352
  end
  object dstEmpEmergency: TADODataSet
    Tag = 2
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_empemergency;1'
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
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = -1
        Value = ''
      end>
    Left = 72
    Top = 352
  end
  object dscTowns: TDataSource
    DataSet = dstTowns
    Left = 565
    Top = 224
  end
  object dstTowns: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_town_with_prov;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 485
    Top = 224
  end
  object dscGender: TDataSource
    DataSet = dstGender
    Left = 565
    Top = 288
  end
  object dstGender: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_gender;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 485
    Top = 288
  end
  object dscFamily: TDataSource
    DataSet = dstFamily
    Left = 360
    Top = 32
  end
  object dstFamily: TADODataSet
    Tag = 3
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'hris_get_empfamily;1'
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
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 12
        Value = ''
      end>
    Left = 280
    Top = 33
    object dstFamilyempfamily_id: TAutoIncField
      FieldName = 'empfamily_id'
      ReadOnly = True
    end
    object dstFamilyef_lastname: TStringField
      DisplayLabel = 'Lastname'
      FieldName = 'ef_lastname'
      Required = True
      Size = 50
    end
    object dstFamilyef_firstname: TStringField
      DisplayLabel = 'Firstname'
      FieldName = 'ef_firstname'
      Required = True
      Size = 50
    end
    object dstFamilyef_middlename: TStringField
      FieldName = 'ef_middlename'
      Size = 50
    end
    object dstFamilyef_birth_date: TDateTimeField
      FieldName = 'ef_birth_date'
    end
    object dstFamilyoccupation_id: TIntegerField
      FieldName = 'occupation_id'
    end
    object dstFamilyrelation_id: TIntegerField
      DisplayLabel = 'Relation'
      FieldName = 'relation_id'
      Required = True
    end
    object dstFamilyid_num: TStringField
      FieldName = 'id_num'
      Size = 12
    end
    object dstFamilyis_dependent: TSmallintField
      FieldName = 'is_dependent'
    end
    object dstFamilyis_deceased: TSmallintField
      FieldName = 'is_deceased'
    end
  end
  object dscRelation: TDataSource
    DataSet = dstRelation
    Left = 565
    Top = 352
  end
  object dstRelation: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_relations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 485
    Top = 352
  end
  object dscOccupation: TDataSource
    DataSet = dstOccupation
    Left = 757
    Top = 32
  end
  object dstOccupation: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'hris_dd_get_occupations;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 677
    Top = 32
  end
  object dscPAF: TDataSource
    DataSet = dstPAF
    Left = 360
    Top = 96
  end
  object dstPAF: TADODataSet
    Tag = 4
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    BeforeOpen = dstPAFBeforeOpen
    CommandText = 'hris_get_paf_list;1'
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
        Name = '@id_num'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = -1
        Value = ''
      end
      item
        Name = '@user_id_num'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    Left = 280
    Top = 96
    object dstPAFpaf_id: TIntegerField
      FieldName = 'paf_id'
      ReadOnly = True
    end
    object dstPAFid_num: TStringField
      FieldName = 'id_num'
      Size = 12
    end
    object dstPAFemployee_firstname: TStringField
      FieldName = 'employee_firstname'
      Size = 50
    end
    object dstPAFemployee_lastname: TStringField
      FieldName = 'employee_lastname'
      Size = 50
    end
    object dstPAFemployee_middlename: TStringField
      FieldName = 'employee_middlename'
      Size = 50
    end
    object dstPAFemployee_name: TStringField
      FieldName = 'employee_name'
      ReadOnly = True
      Size = 102
    end
    object dstPAFposition_name: TStringField
      FieldName = 'position_name'
      Size = 25
    end
    object dstPAFposstatus_name: TStringField
      FieldName = 'posstatus_name'
      Size = 25
    end
    object dstPAFempstatus_name: TStringField
      FieldName = 'empstatus_name'
      Size = 25
    end
    object dstPAFlocation_name: TStringField
      FieldName = 'location_name'
      Size = 50
    end
    object dstPAFsalary: TBCDField
      FieldName = 'salary'
      DisplayFormat = '###,##0.00'
      Precision = 10
      Size = 2
    end
    object dstPAFeffective_date: TDateTimeField
      FieldName = 'effective_date'
      DisplayFormat = 'mm/dd/yyyy'
    end
    object dstPAFrank_movement: TIntegerField
      FieldName = 'rank_movement'
      ReadOnly = True
    end
    object dstPAFpafstatus_code: TStringField
      FieldName = 'pafstatus_code'
      FixedChar = True
      Size = 3
    end
    object dstPAFis_cancelled: TSmallintField
      FieldName = 'is_cancelled'
    end
    object dstPAFis_external: TSmallintField
      FieldName = 'is_external'
    end
  end
end
