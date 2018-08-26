inherited frmAddressAndContact: TfrmAddressAndContact
  Caption = 'frmAddressAndContact'
  ClientHeight = 503
  ClientWidth = 824
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 840
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 14
  object JvLabel1: TJvLabel
    Left = 59
    Top = 67
    Width = 37
    Height = 14
    Caption = 'Street'
    Transparent = True
  end
  object JvLabel3: TJvLabel
    Left = 59
    Top = 151
    Width = 55
    Height = 14
    Caption = 'City town'
    Transparent = True
  end
  object JvLabel6: TJvLabel
    Left = 59
    Top = 267
    Width = 36
    Height = 14
    Caption = 'Mobile'
    Transparent = True
  end
  object JvLabel7: TJvLabel
    Left = 59
    Top = 40
    Width = 60
    Height = 14
    Caption = 'ID number'
    Transparent = True
  end
  object JvLabel8: TJvLabel
    Left = 59
    Top = 295
    Width = 46
    Height = 14
    Caption = 'Landline'
    Transparent = True
  end
  object JvLabel9: TJvLabel
    Left = 59
    Top = 324
    Width = 29
    Height = 14
    Caption = 'Email'
    Transparent = True
  end
  object JvLabel16: TJvLabel
    Left = 427
    Top = 267
    Width = 33
    Height = 14
    Caption = 'Name'
    Transparent = True
  end
  object JvLabel17: TJvLabel
    Left = 427
    Top = 295
    Width = 45
    Height = 14
    Caption = 'Address'
    Transparent = True
  end
  object JvLabel18: TJvLabel
    Left = 427
    Top = 351
    Width = 45
    Height = 14
    Caption = 'Relation'
    Transparent = True
  end
  object JvLabel14: TJvLabel
    Left = 427
    Top = 379
    Width = 91
    Height = 14
    Caption = 'Contact number'
    Transparent = True
  end
  object JvLabel15: TJvLabel
    Left = 427
    Top = 408
    Width = 29
    Height = 14
    Caption = 'Email'
    Transparent = True
  end
  object JvLabel4: TJvLabel
    Left = 59
    Top = 123
    Width = 51
    Height = 14
    Caption = 'Barangay'
    Transparent = True
  end
  object JvLabel2: TJvLabel
    Left = 427
    Top = 67
    Width = 37
    Height = 14
    Caption = 'Street'
    Transparent = True
  end
  object JvLabel5: TJvLabel
    Left = 427
    Top = 151
    Width = 55
    Height = 14
    Caption = 'City town'
    Transparent = True
  end
  object JvLabel10: TJvLabel
    Left = 427
    Top = 123
    Width = 51
    Height = 14
    Caption = 'Barangay'
    Transparent = True
  end
  object RzGroupBox2: TRzGroupBox
    Left = 43
    Top = 31
    Width = 302
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Home address'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clGray
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = clMenu
    FlatColor = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 14
  end
  object RzGroupBox1: TRzGroupBox
    Left = 43
    Top = 231
    Width = 302
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Contact details'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clGray
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = clMenu
    FlatColor = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 15
  end
  object RzDBEdit1: TRzDBEdit
    Left = 138
    Top = 117
    Width = 207
    Height = 22
    DataSource = dmEmployee.dscEmpAddressH
    DataField = 'barangay'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 1
  end
  object RzDBEdit2: TRzDBEdit
    Left = 506
    Top = 117
    Width = 207
    Height = 22
    DataSource = dmEmployee.dscEmpAddressP
    DataField = 'barangay'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 5
  end
  object RzDBEdit3: TRzDBEdit
    Left = 138
    Top = 261
    Width = 207
    Height = 22
    DataSource = dmEmployee.dscEmpContactH
    DataField = 'mobile_no'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 7
  end
  object RzGroupBox3: TRzGroupBox
    Left = 411
    Top = 31
    Width = 302
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Present address'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clGray
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = clMenu
    FlatColor = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 16
  end
  object RzGroupBox4: TRzGroupBox
    Left = 411
    Top = 231
    Width = 302
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Emergency contact'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clGray
    CaptionFont.Height = -12
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    Color = clMenu
    FlatColor = clMedGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    GradientColorStyle = gcsCustom
    GroupStyle = gsUnderline
    ParentFont = False
    TabOrder = 17
  end
  object RzDBEdit8: TRzDBEdit
    Left = 528
    Top = 261
    Width = 185
    Height = 22
    DataSource = dmEmployee.dscEmpEmergency
    DataField = 'em_name'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 10
  end
  object RzDBEdit10: TRzDBEdit
    Left = 528
    Top = 345
    Width = 185
    Height = 22
    DataSource = dmEmployee.dscEmpEmergency
    DataField = 'em_relation'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 11
  end
  object RzDBEdit11: TRzDBEdit
    Left = 528
    Top = 373
    Width = 185
    Height = 22
    DataSource = dmEmployee.dscEmpEmergency
    DataField = 'em_contact'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 12
  end
  object RzDBEdit12: TRzDBEdit
    Left = 528
    Top = 402
    Width = 185
    Height = 22
    DataSource = dmEmployee.dscEmpEmergency
    DataField = 'em_email'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 13
  end
  object RzDBMemo1: TRzDBMemo
    Left = 138
    Top = 61
    Width = 207
    Height = 50
    DataField = 'street'
    DataSource = dmEmployee.dscEmpAddressH
    TabOrder = 0
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBEdit4: TRzDBEdit
    Left = 138
    Top = 289
    Width = 207
    Height = 22
    DataSource = dmEmployee.dscEmpContactH
    DataField = 'landline_no'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 8
  end
  object RzDBMemo2: TRzDBMemo
    Left = 506
    Top = 61
    Width = 207
    Height = 50
    DataField = 'street'
    DataSource = dmEmployee.dscEmpAddressP
    TabOrder = 4
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBEdit5: TRzDBEdit
    Left = 138
    Top = 318
    Width = 207
    Height = 22
    DataSource = dmEmployee.dscEmpContactH
    DataField = 'email'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnlyColor = clWhite
    TabOnEnter = True
    TabOrder = 9
  end
  object RzDBLookupComboBox2: TRzDBLookupComboBox
    Left = 506
    Top = 145
    Width = 207
    Height = 22
    DataField = 'town_id'
    DataSource = dmEmployee.dscEmpAddressP
    KeyField = 'town_id'
    ListField = 'town'
    ListSource = dmEmployee.dscTowns
    TabOrder = 6
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBLookupComboBox1: TRzDBLookupComboBox
    Left = 138
    Top = 145
    Width = 207
    Height = 22
    DataField = 'town_id'
    DataSource = dmEmployee.dscEmpAddressH
    KeyField = 'town_id'
    ListField = 'town'
    ListSource = dmEmployee.dscTowns
    TabOrder = 2
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBMemo3: TRzDBMemo
    Left = 528
    Top = 289
    Width = 185
    Height = 49
    DataField = 'em_address'
    DataSource = dmEmployee.dscEmpEmergency
    TabOrder = 18
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBCheckBox1: TRzDBCheckBox
    Left = 59
    Top = 189
    Width = 198
    Height = 16
    DataField = 'is_present'
    DataSource = dmEmployee.dscEmpAddressH
    ValueChecked = '1'
    ValueUnchecked = '0'
    Caption = 'Home address is present address'
    TabOrder = 3
  end
end
