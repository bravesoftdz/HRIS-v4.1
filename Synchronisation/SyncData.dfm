object dmSync: TdmSync
  OldCreateOrder = False
  Height = 221
  Width = 355
  object dstMessages: TADODataSet
    Connection = dmApplication.acMain
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'sync_get_wsmessages;1'
    CommandType = cmdStoredProc
    Parameters = <>
    Left = 32
    Top = 16
    object dstMessagesdirection: TIntegerField
      FieldName = 'direction'
    end
    object dstMessagesevent_object_desc: TStringField
      FieldName = 'event_object_desc'
      Size = 30
    end
    object dstMessagesemployee_name: TStringField
      FieldName = 'employee_name'
      Size = 150
    end
    object dstMessagesevent_object: TStringField
      FieldName = 'event_object'
      FixedChar = True
      Size = 3
    end
    object dstMessagespk_event_object: TStringField
      FieldName = 'pk_event_object'
      Size = 30
    end
    object dstMessagesmessage_date: TDateTimeField
      FieldName = 'message_date'
      DisplayFormat = 'mm/dd/yyyy ddd'
    end
    object dstMessagessource_location_name: TStringField
      FieldName = 'source_location_name'
      Size = 30
    end
    object dstMessagessync_attempts: TIntegerField
      FieldName = 'sync_attempts'
    end
  end
  object dscMessages: TDataSource
    DataSet = dstMessages
    Left = 96
    Top = 16
  end
end
