object dmSecurity: TdmSecurity
  OldCreateOrder = False
  Height = 276
  Width = 524
  object dscUser: TDataSource
    DataSet = dstUsers
    Left = 72
    Top = 48
  end
  object dscRole: TDataSource
    DataSet = dstRoles
    Left = 72
    Top = 120
  end
  object dstUsers: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    CommandText = 'sec_get_users;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 152
    Top = 48
    object dstUsersid_num: TStringField
      FieldName = 'id_num'
      Size = 12
    end
    object dstUsersemployee_lastname: TStringField
      FieldName = 'employee_lastname'
      Size = 50
    end
    object dstUsersemployee_firstname: TStringField
      FieldName = 'employee_firstname'
      Size = 50
    end
    object dstUsersemployee_middlename: TStringField
      FieldName = 'employee_middlename'
      Size = 50
    end
    object dstUsersemployee_name: TStringField
      FieldName = 'employee_name'
      ReadOnly = True
      Size = 102
    end
    object dstUsersusername: TStringField
      FieldName = 'username'
      Size = 25
    end
    object dstUserspassword: TStringField
      FieldName = 'password'
      OnGetText = dstUserspasswordGetText
      Size = 15
    end
    object dstUsersid_num_1: TStringField
      FieldName = 'id_num_1'
      Size = 12
    end
    object dstUserscredit_limit: TBCDField
      FieldName = 'credit_limit'
      Precision = 10
      Size = 2
    end
  end
  object dstRoles: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    CommandText = 'sec_get_roles;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 152
    Top = 120
  end
  object dstRoleRights: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sec_get_privileges_by_role;1'
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
        Name = '@role_code'
        Attributes = [paNullable]
        DataType = ftString
        Size = 25
        Value = ''
      end
      item
        Name = '@app_code'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = 0
      end>
    Left = 264
    Top = 120
  end
  object dstRights: TADODataSet
    Connection = dmApplication.acMain
    LockType = ltReadOnly
    CommandText = 'sec_get_privileges;1'
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
        Name = '@app_code'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = 0
      end>
    Left = 360
    Top = 48
  end
  object dstUserRoles: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'sec_get_user_roles;1'
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
    Left = 360
    Top = 120
  end
end
