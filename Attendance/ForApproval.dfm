inherited frmForApproval: TfrmForApproval
  Caption = 'frmForApproval'
  ClientHeight = 435
  ClientWidth = 798
  OnCreate = FormCreate
  ExplicitWidth = 814
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 14
  object RzLabel1: TRzLabel [0]
    Left = 252
    Top = 49
    Width = 64
    Height = 14
    Caption = 'Entitlement'
  end
  object RzLabel2: TRzLabel [1]
    Left = 20
    Top = 49
    Width = 34
    Height = 14
    Caption = 'Period'
  end
  object pnlList: TRzPanel [2]
    Left = 20
    Top = 73
    Width = 469
    Height = 323
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14205355
    BorderWidth = 1
    Caption = 'Retrieving data. Please wait...'
    ParentColor = True
    TabOrder = 3
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 467
      Height = 321
      Align = alClient
      BorderStyle = bsNone
      DataSource = dmTimelog.dscForApproval
      FixedColor = clWhite
      GradientEndColor = 12955288
      GradientStartColor = 12955288
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grListCellClick
      OnDrawColumnCell = grListDrawColumnCell
      OnKeyUp = grListKeyUp
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
          FieldName = 'app_dt_f'
          Title.Alignment = taRightJustify
          Title.Caption = 'Date applied'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_f'
          Title.Alignment = taCenter
          Title.Caption = 'Date'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 85
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
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'time_from_f'
          Title.Alignment = taCenter
          Title.Caption = 'Time from'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'time_until_f'
          Title.Alignment = taCenter
          Title.Caption = 'Time until'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reason'
          Title.Alignment = taCenter
          Title.Caption = 'Reason'
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
          FieldName = 'remarks'
          Title.Alignment = taCenter
          Title.Caption = 'Remarks'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 300
          Visible = True
        end>
    end
  end
  object pnlDetail: TRzPanel [3]
    Left = 505
    Top = 73
    Width = 272
    Height = 323
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 14205355
    BorderWidth = 1
    ParentColor = True
    TabOrder = 4
    DesignSize = (
      272
      323)
    object pnlApprove: TRzPanel
      Left = 8
      Top = 293
      Width = 65
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
      TabOrder = 0
      object btnApprove: TRzShapeButton
        Left = 0
        Top = 0
        Width = 65
        Height = 22
        Hint = 'Approve'
        BorderStyle = bsNone
        Caption = 'Approve'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnApproveClick
      end
    end
    object pnlDeny: TRzPanel
      Left = 79
      Top = 293
      Width = 65
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
      TabOrder = 1
      object btnDeny: TRzShapeButton
        Left = 0
        Top = 0
        Width = 65
        Height = 22
        Hint = 'Deny'
        BorderStyle = bsNone
        Caption = 'Deny'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnDenyClick
      end
    end
    object pcDetails: TRzPageControl
      Left = 14
      Top = 16
      Width = 243
      Height = 255
      Hint = ''
      ActivePage = tsUndertime
      Anchors = [akLeft, akTop, akRight, akBottom]
      FlatColor = 8675134
      ShowCardFrame = False
      ShowShadow = False
      TabOrder = 2
      TabStop = False
      Transparent = True
      FixedDimension = 20
      object tsUndertime: TRzTabSheet
        Color = 14932430
        TabVisible = False
        Caption = 'Undertime'
        object JvLabel1: TJvLabel
          Tag = -1
          Left = 92
          Top = 89
          Width = 66
          Height = 14
          Caption = 'Time until:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object JvLabel10: TJvLabel
          Tag = -1
          Left = 3
          Top = 1
          Width = 35
          Height = 14
          Caption = 'Date:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel1: TRzDBLabel
          Left = 4
          Top = 21
          Width = 62
          Height = 14
          AutoSize = True
          DataField = 'dt_f'
          DataSource = dmTimelog.dscForApproval
        end
        object JvLabel40: TJvLabel
          Tag = -1
          Left = 3
          Top = 45
          Width = 64
          Height = 14
          Caption = 'Employee:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel21: TRzDBLabel
          Left = 3
          Top = 65
          Width = 69
          Height = 14
          AutoSize = True
          DataField = 'employee_name'
          DataSource = dmTimelog.dscForApproval
        end
        object JvLabel11: TJvLabel
          Tag = -1
          Left = 4
          Top = 89
          Width = 67
          Height = 14
          Caption = 'Time from:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel2: TRzDBLabel
          Left = 5
          Top = 109
          Width = 62
          Height = 14
          AutoSize = True
          DataField = 'time_from_f'
          DataSource = dmTimelog.dscForApproval
        end
        object RzDBLabel3: TRzDBLabel
          Left = 93
          Top = 109
          Width = 62
          Height = 14
          AutoSize = True
          DataField = 'time_until_f'
          DataSource = dmTimelog.dscForApproval
        end
        object JvLabel2: TJvLabel
          Tag = -1
          Left = 4
          Top = 134
          Width = 51
          Height = 14
          Caption = 'Reason:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel16: TRzDBLabel
          Left = 5
          Top = 154
          Width = 238
          Height = 71
          WordWrap = True
          DataField = 'reason'
          DataSource = dmTimelog.dscForApproval
        end
        object JvLabel12: TJvLabel
          Tag = -1
          Left = 180
          Top = 89
          Width = 32
          Height = 14
          Caption = 'Paid:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel11: TRzDBLabel
          Left = 180
          Top = 109
          Width = 69
          Height = 14
          AutoSize = True
          DataField = 'is_paid_f'
          DataSource = dmTimelog.dscForApproval
        end
      end
      object tsLeave: TRzTabSheet
        Color = 14932430
        TabVisible = False
        Caption = 'Leave'
        object JvLabel3: TJvLabel
          Tag = -1
          Left = 4
          Top = 1
          Width = 83
          Height = 14
          Caption = 'Date applied:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel4: TRzDBLabel
          Left = 4
          Top = 21
          Width = 62
          Height = 14
          AutoSize = True
          DataField = 'app_dt_f'
          DataSource = dmTimelog.dscForApproval
        end
        object JvLabel4: TJvLabel
          Tag = -1
          Left = 4
          Top = 89
          Width = 73
          Height = 14
          Caption = 'Leave date:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel5: TRzDBLabel
          Left = 4
          Top = 109
          Width = 62
          Height = 14
          AutoSize = True
          DataField = 'dt_f'
          DataSource = dmTimelog.dscForApproval
        end
        object JvLabel5: TJvLabel
          Tag = -1
          Left = 4
          Top = 45
          Width = 64
          Height = 14
          Caption = 'Employee:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel6: TRzDBLabel
          Left = 5
          Top = 65
          Width = 62
          Height = 14
          AutoSize = True
          DataField = 'employee_name'
          DataSource = dmTimelog.dscForApproval
        end
        object JvLabel6: TJvLabel
          Tag = -1
          Left = 4
          Top = 132
          Width = 51
          Height = 14
          Caption = 'Reason:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel7: TRzDBLabel
          Left = 5
          Top = 152
          Width = 62
          Height = 14
          AutoSize = True
          DataField = 'reason'
          DataSource = dmTimelog.dscForApproval
        end
        object JvLabel7: TJvLabel
          Tag = -1
          Left = 4
          Top = 175
          Width = 58
          Height = 14
          Caption = 'Remarks:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel8: TRzDBLabel
          Left = 5
          Top = 195
          Width = 237
          Height = 55
          WordWrap = True
          DataField = 'remarks'
          DataSource = dmTimelog.dscForApproval
        end
        object JvLabel8: TJvLabel
          Tag = -1
          Left = 99
          Top = 89
          Width = 52
          Height = 14
          Caption = 'AM/PM:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel9: TRzDBLabel
          Left = 99
          Top = 109
          Width = 62
          Height = 14
          AutoSize = True
          DataField = 'am_pm_f'
          DataSource = dmTimelog.dscForApproval
        end
        object JvLabel9: TJvLabel
          Tag = -1
          Left = 195
          Top = 89
          Width = 32
          Height = 14
          Caption = 'Paid:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel10: TRzDBLabel
          Left = 195
          Top = 109
          Width = 69
          Height = 14
          AutoSize = True
          DataField = 'is_paid_f'
          DataSource = dmTimelog.dscForApproval
        end
        object JvLabel13: TJvLabel
          Tag = -1
          Left = 99
          Top = 1
          Width = 35
          Height = 14
          Caption = 'Type:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -12
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
        end
        object RzDBLabel12: TRzDBLabel
          Left = 99
          Top = 21
          Width = 69
          Height = 14
          AutoSize = True
          DataField = 'leave_type'
          DataSource = dmTimelog.dscForApproval
        end
        object imgConflict: TImage
          Left = 157
          Top = 87
          Width = 16
          Height = 16
          Cursor = crHandPoint
          Hint = 'Conflicts found.'
          AutoSize = True
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF6100000006624B474400FF00FF00FFA0BDA793000000
            097048597300000048000000480046C96B3E0000000976704167000000100000
            0010005CC6ADC3000002F74944415478DA65535B481461183DFFECECEEAC792B
            B34521B548744D8BF252BA5E111422A8074DA214B287487DE8AD7A31EAA57AEB
            C18C1E2AE842683E1844A060E2DDBC145E7215232F81B25E4A6B73677767E7EF
            9B096DB361BE81F9F9CE9973CE371FC3B6AB232BE93E57D54ACEB9B479C61893
            99203CCEEB9DA80EECA51EB0CD974EFBC12218C596E86376EC494D83292C8C3A
            3434E05D5FC7D2F01016DEF7003EA538B7E753EB3F041AD814B1BBC556710186
            B5556CF4B6C1373906D5FD0B8265078C892908CA2A843F3C028EA74FE05D5DD1
            49FE12E41DE6A9D76AE1EB6A817BB0135C7623F2F62388F642283D6D58BE7E11
            4CB2C0929E0B634E3186EFDC426EC708D30934CFFB4ACE5685AF2F42FED007CE
            0470D74F58DBA6B6BC3A0B13C08243C0B80AE96826D6C2A230D3F4B29E5454B3
            F6AC2439FDD265B3B7F939B828EA009508C2EB9B20C6C543999DC65A55090422
            D0035514984E9FC7E0C3079EFC9E4F9246C08F9F28823CFE11300884E6BA054B
            450D246A9489D8FDB44EB700811CFB4945F211F4BF6D051130D66E4FE6C73353
            E1732EE8F2295A4ADA0BC17618C1B5F7E0BA7505AA6304309AB479EA368CD668
            F4F70D23BF7B8C08B25378A66D1F1462E67F66A31370D70F708F07CC6C26FFA1
            7F09A84524A57D8E19E4778D32F62E27C59391B0DF641005A8249F1EE01B2E18
            4B2BC9EB39789B5FC0F7EA315850305910E866F02B2A06A6BE780B3A47CDACF1
            98AD212D36FACC5E6B24D923B0DFAF7FDDF2AC756B0AEEF2225D053318282601
            5F9DCB189A5B682CED9F28D314C5B46727CFA5A7244192CC5029654D014E966D
            29C09B065D81405392650F06C72650D03D1E4BFFC1BCFE23DDB0C55417EED959
            97762809164902D73290654A5CA1C9883401098C3270D3D9D0E804DA96BED7DC
            74CCDF0FDC85502229CFDB155277202E1651515688149E1E2805A750988B8B4E
            7C9E9D43C7B79F1AF819617EFCB34C1A09557C6346E2D5DD46F114A14D9BCB44
            0FEF8A4F797D6660F22EBD4C6BE0FFB631E08AA18AA01202CE54AA55AAF9EDEB
            FC1B1C1C55F0A7A9AD540000003974455874636F6D6D656E74004578636C616D
            6174696F6E2066726F6D2049636F6E2047616C6C65727920687474703A2F2F69
            636F6E67616C2E636F6D2F5DCF1C3A0000002574455874646174653A63726561
            746500323031312D30382D32315431343A31313A35372D30363A3030132B94E9
            0000002574455874646174653A6D6F6469667900323031312D30382D32315431
            343A31313A35372D30363A303062762C550000001974455874536F6674776172
            650041646F626520496D616765526561647971C9653C0000000049454E44AE42
            6082}
          ShowHint = True
        end
      end
    end
  end
  object cmbEntitlement: TRzComboBox [4]
    Left = 323
    Top = 43
    Width = 118
    Height = 22
    Ctl3D = False
    FrameColor = 14205355
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    TabOrder = 1
    OnClick = cmbEntitlementClick
    Items.Strings = (
      'Leaves'
      'Undertime')
  end
  inherited pnlTitle: TRzPanel
    Width = 798
    TabOrder = 5
    ExplicitWidth = 798
    inherited lblTitle: TRzLabel
      Width = 76
      Caption = 'For approval'
      ExplicitWidth = 76
    end
  end
  object cbxConflicts: TRzCheckBox
    Left = 20
    Top = 404
    Width = 158
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'Leaves with conflicts only'
    State = cbUnchecked
    TabOrder = 2
    OnClick = cbxConflictsClick
  end
  object cmbPeriod: TRzComboBox
    Left = 59
    Top = 43
    Width = 184
    Height = 22
    Ctl3D = False
    FrameColor = 14205355
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    TabOrder = 0
    OnClick = cmbPeriodClick
  end
end
