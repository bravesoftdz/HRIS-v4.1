object UniMainModule: TUniMainModule
  OldCreateOrder = False
  OnDestroy = UniGUIMainModuleDestroy
  Theme = 'gray'
  MonitoredKeys.Keys = <>
  Height = 180
  Width = 387
  object MainConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=HRIS;Data Source=BRYAN-X1C\' +
      'DEVELOPMENT;Initial File Name="";Server SPN=""'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    BeforeConnect = MainConnectionBeforeConnect
    Left = 56
    Top = 32
  end
  object dstUser: TADODataSet
    Connection = MainConnection
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
    Left = 160
    Top = 32
  end
end
