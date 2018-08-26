inherited frmSyncMain: TfrmSyncMain
  Caption = 'frmSyncMain'
  ClientHeight = 435
  ClientWidth = 798
  OnCreate = FormCreate
  ExplicitWidth = 814
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 798
    ExplicitWidth = 798
    inherited lblTitle: TRzLabel
      Width = 128
      Caption = 'Synchronisation logs'
      ExplicitWidth = 128
    end
  end
  object pnlList: TRzPanel
    Left = 20
    Top = 73
    Width = 469
    Height = 306
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14205355
    BorderWidth = 1
    Caption = 'Retrieving data. Please wait...'
    ParentColor = True
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 467
      Height = 304
      Align = alClient
      BorderStyle = bsNone
      DataSource = dmSync.dscMessages
      FixedColor = clWhite
      GradientEndColor = clWhite
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      DisabledColor = clWhite
      FrameColor = 6572079
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      FixedLineColor = clWhite
      LineColor = clWhite
      AltRowShadingColor = 15854564
      Columns = <
        item
          Expanded = False
          FieldName = 'event_object_desc'
          Title.Alignment = taCenter
          Title.Caption = 'Type'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'message_date'
          Title.Alignment = taCenter
          Title.Caption = 'Date'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'employee_name'
          Title.Alignment = taCenter
          Title.Caption = 'Employee'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'source_location_name'
          Title.Alignment = taCenter
          Title.Caption = 'Source'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sync_attempts'
          Title.Alignment = taCenter
          Title.Caption = 'Att.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 40
          Visible = True
        end>
    end
  end
  object chbAutoRefresh: TRzCheckBox
    Left = 20
    Top = 51
    Width = 88
    Height = 16
    Caption = 'Auto-refresh'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object pnlSync: TRzPanel
    Left = 21
    Top = 388
    Width = 73
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderOuter = fsNone
    BorderColor = 14205355
    BorderWidth = 1
    Color = 14932430
    TabOrder = 3
    object btnSync: TRzShapeButton
      Left = 0
      Top = 0
      Width = 73
      Height = 22
      Hint = 'Synchronise record'
      BorderStyle = bsNone
      Caption = 'Synchronise'
      ParentShowHint = False
      ShowHint = True
    end
  end
  object pnlDelete: TRzPanel
    Left = 101
    Top = 388
    Width = 50
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderOuter = fsNone
    BorderColor = 14205355
    BorderWidth = 1
    Color = 14932430
    TabOrder = 4
    object btnDelete: TRzShapeButton
      Left = 0
      Top = 0
      Width = 50
      Height = 22
      Hint = 'Delete record'
      BorderStyle = bsNone
      Caption = 'Delete'
      ParentShowHint = False
      ShowHint = True
    end
  end
  object pnlDetail: TRzPanel
    Left = 505
    Top = 73
    Width = 272
    Height = 306
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14205355
    BorderWidth = 1
    ParentColor = True
    TabOrder = 5
    DesignSize = (
      272
      306)
    object RzLabel1: TRzLabel
      Left = 16
      Top = 60
      Width = 28
      Height = 14
      Caption = 'Type'
    end
    object RzLabel2: TRzLabel
      Left = 16
      Top = 88
      Width = 38
      Height = 14
      Caption = 'Source'
    end
    object cmbType: TRzComboBox
      Left = 63
      Top = 54
      Width = 186
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      FrameColor = 14205355
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentCtl3D = False
      TabOrder = 0
      Text = 'Time log'
      OnChange = cmbTypeChange
      Items.Strings = (
        'Time log'
        'Leave (master)'
        'Leave (detail)'
        'Undertime')
      ItemIndex = 0
      Values.Strings = (
        'DTR'
        'LVE'
        'LVD'
        'UDT')
    end
    object cmbBranch: TRzComboBox
      Left = 63
      Top = 82
      Width = 186
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = False
      FrameColor = 14205355
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentCtl3D = False
      TabOrder = 1
      OnChange = cmbBranchChange
    end
    object rgDirection: TRzRadioGroup
      Left = 9
      Top = 21
      Width = 176
      Height = 19
      Caption = ''
      Columns = 2
      GroupStyle = gsCustom
      ItemIndex = 0
      Items.Strings = (
        'Outgoing'
        'Incoming')
      ParentColor = True
      SpaceEvenly = True
      TabOrder = 2
      OnClick = rgDirectionClick
    end
  end
end
