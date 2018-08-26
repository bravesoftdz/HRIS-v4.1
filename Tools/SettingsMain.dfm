inherited frmSettingsMain: TfrmSettingsMain
  Caption = 'frmSettingsMain'
  ClientHeight = 499
  ClientWidth = 758
  OnCreate = FormCreate
  ExplicitWidth = 774
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 14
  object RzLabel1: TRzLabel [0]
    Left = 35
    Top = 80
    Width = 38
    Height = 14
    Caption = 'Holiday'
  end
  object RzLabel9: TRzLabel [1]
    Left = 35
    Top = 105
    Width = 52
    Height = 14
    Caption = 'Complete'
  end
  object RzLabel10: TRzLabel [2]
    Left = 35
    Top = 130
    Width = 62
    Height = 14
    Caption = 'Incomplete'
  end
  object RzLabel11: TRzLabel [3]
    Left = 35
    Top = 155
    Width = 46
    Height = 14
    Caption = 'Override'
  end
  object RzLabel12: TRzLabel [4]
    Left = 35
    Top = 180
    Width = 57
    Height = 14
    Caption = 'Undertime'
  end
  object RzLabel13: TRzLabel [5]
    Left = 35
    Top = 205
    Width = 32
    Height = 14
    Caption = 'Leave'
  end
  object RzLabel14: TRzLabel [6]
    Left = 35
    Top = 255
    Width = 40
    Height = 14
    Caption = 'Sunday'
  end
  object lblDefaults: TRzLabel [7]
    Left = 35
    Top = 328
    Width = 101
    Height = 16
    Cursor = crHandPoint
    Caption = 'Revert to defaults'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6572079
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblDefaultsClick
    FlyByEnabled = True
  end
  object RzLabel2: TRzLabel [8]
    Left = 35
    Top = 296
    Width = 44
    Height = 14
    Caption = 'Gridlines'
  end
  object RzLabel3: TRzLabel [9]
    Left = 35
    Top = 230
    Width = 67
    Height = 14
    Caption = 'Business trip'
  end
  inherited pnlTitle: TRzPanel
    Width = 758
    BorderSides = []
    ExplicitWidth = 630
    inherited lblTitle: TRzLabel
      Width = 52
      Caption = 'Settings'
      ExplicitWidth = 52
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 19
    Top = 52
    Width = 198
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Calendar colours'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clRed
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = 14273211
    FlatColor = 6572079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 6572079
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 1
  end
  object ceHoliday: TRzColorEdit
    Left = 128
    Top = 74
    Width = 89
    Height = 22
    CustomColors = ccCustom
    SelectedColor = 16750383
    ShowCustomColor = True
    FlatButtonColor = 14273211
    FlatButtons = True
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
  end
  object ceComplete: TRzColorEdit
    Left = 128
    Top = 99
    Width = 89
    Height = 22
    CustomColors = ccCustom
    SelectedColor = 5548032
    ShowCustomColor = True
    FlatButtonColor = 14273211
    FlatButtons = True
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
  end
  object ceIncomplete: TRzColorEdit
    Left = 128
    Top = 124
    Width = 89
    Height = 22
    CustomColors = ccCustom
    SelectedColor = 5373864
    ShowCustomColor = True
    FlatButtonColor = 14273211
    FlatButtons = True
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
  end
  object ceOverride: TRzColorEdit
    Left = 128
    Top = 149
    Width = 89
    Height = 22
    CustomColors = ccCustom
    SelectedColor = 917503
    ShowCustomColor = True
    FlatButtonColor = 14273211
    FlatButtons = True
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
  end
  object ceUndertime: TRzColorEdit
    Left = 128
    Top = 174
    Width = 89
    Height = 22
    CustomColors = ccCustom
    SelectedColor = 16730789
    ShowCustomColor = True
    FlatButtonColor = 14273211
    FlatButtons = True
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
  end
  object ceLeave: TRzColorEdit
    Left = 128
    Top = 199
    Width = 89
    Height = 22
    CustomColors = ccCustom
    SelectedColor = 4342527
    ShowCustomColor = True
    FlatButtonColor = 14273211
    FlatButtons = True
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
  end
  object ceSunday: TRzColorEdit
    Left = 128
    Top = 249
    Width = 89
    Height = 22
    CustomColors = ccCustom
    SelectedColor = 5548971
    ShowCustomColor = True
    FlatButtonColor = 14273211
    FlatButtons = True
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentShowHint = False
    ShowHint = False
    TabOrder = 9
  end
  object ceGridLine: TRzColorEdit
    Left = 128
    Top = 290
    Width = 89
    Height = 22
    CustomColors = ccCustom
    SelectedColor = clMenu
    ShowCustomColor = True
    FlatButtonColor = 14273211
    FlatButtons = True
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentShowHint = False
    ShowHint = False
    TabOrder = 10
  end
  object ceBusinessTrip: TRzColorEdit
    Left = 128
    Top = 224
    Width = 89
    Height = 22
    CustomColors = ccCustom
    SelectedColor = 4227327
    ShowCustomColor = True
    FlatButtonColor = 14273211
    FlatButtons = True
    FrameColor = 8675134
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
  end
  object ccCustom: TRzCustomColors
    Colors.Strings = (
      'ColorA=FFFFFF'
      'ColorB=FFFFFF'
      'ColorC=FFFFFF'
      'ColorD=FFFFFF'
      'ColorE=FFFFFF'
      'ColorF=FFFFFF'
      'ColorG=FFFFFF'
      'ColorH=FFFFFF'
      'ColorI=FFFFFF'
      'ColorJ=FFFFFF'
      'ColorK=FFFFFF'
      'ColorL=FFFFFF'
      'ColorM=FFFFFF'
      'ColorN=FFFFFF'
      'ColorO=FFFFFF'
      'ColorP=FFFFFF')
    Left = 592
    Top = 40
  end
end
