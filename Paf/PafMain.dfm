inherited frmPafMain: TfrmPafMain
  Caption = 'frmPafMain'
  ClientHeight = 500
  ClientWidth = 1112
  OnShow = FormShow
  ExplicitWidth = 1128
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 14
  object JvLabel7: TJvLabel [0]
    Left = 43
    Top = 64
    Width = 55
    Height = 14
    Caption = 'Employee'
    Transparent = True
  end
  object JvLabel1: TJvLabel [1]
    Left = 43
    Top = 92
    Width = 84
    Height = 14
    Caption = 'Effective dates'
    Transparent = True
  end
  object JvLabel5: TJvLabel [2]
    Left = 459
    Top = 64
    Width = 47
    Height = 14
    Caption = 'Remarks'
    Transparent = True
  end
  object JvLabel2: TJvLabel [3]
    Left = 43
    Top = 122
    Width = 37
    Height = 14
    Caption = 'Status'
    Transparent = True
  end
  object JvLabel3: TJvLabel [4]
    Left = 60
    Top = 205
    Width = 44
    Height = 14
    Caption = 'Position'
    Transparent = True
  end
  object JvLabel4: TJvLabel [5]
    Left = 60
    Top = 234
    Width = 81
    Height = 14
    Caption = 'Position status'
    Transparent = True
  end
  object JvLabel6: TJvLabel [6]
    Left = 60
    Top = 263
    Width = 107
    Height = 14
    Caption = 'Employment status'
    Transparent = True
  end
  object JvLabel8: TJvLabel [7]
    Left = 60
    Top = 291
    Width = 39
    Height = 14
    Caption = 'Branch'
    Transparent = True
  end
  object JvLabel9: TJvLabel [8]
    Left = 60
    Top = 319
    Width = 68
    Height = 14
    Caption = 'Department'
    Transparent = True
  end
  object JvLabel10: TJvLabel [9]
    Left = 60
    Top = 347
    Width = 33
    Height = 14
    Caption = 'Salary'
    Transparent = True
  end
  object JvLabel11: TJvLabel [10]
    Left = 715
    Top = 347
    Width = 37
    Height = 14
    Caption = 'Total:'
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
  object lblTotalAllowance: TJvLabel [11]
    Left = 763
    Top = 347
    Width = 30
    Height = 14
    Caption = '0.00'
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
  object lblSummary: TJvLabel [12]
    Left = 884
    Top = 64
    Width = 130
    Height = 14
    Caption = 'Summary of changes'
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
  object lblSummaryOfChanges: TJvLabel [13]
    Left = 884
    Top = 92
    Width = 197
    Height = 381
    AutoSize = False
    Caption = 'None'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    Anchors = [akLeft, akTop, akRight, akBottom]
    ParentFont = False
    Transparent = True
    WordWrap = True
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -12
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
  end
  inherited pnlTitle: TRzPanel
    Width = 1112
    ExplicitWidth = 1112
    inherited lblTitle: TRzLabel
      Width = 66
      Caption = 'PAF record'
      ExplicitWidth = 66
    end
  end
  object edEmployee: TRzButtonEdit
    Left = 136
    Top = 58
    Width = 248
    Height = 22
    Text = ''
    Color = clInfoBk
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnly = True
    TabOrder = 1
    AltBtnKind = bkReject
    ButtonKind = bkFind
    AltBtnVisible = True
    AltBtnWidth = 15
    ButtonWidth = 15
    FlatButtons = True
    HideButtonsOnReadOnly = False
    OnButtonClick = edEmployeeButtonClick
  end
  object RzDBDateTimeEdit1: TRzDBDateTimeEdit
    Left = 136
    Top = 86
    Width = 121
    Height = 22
    DataSource = dmPaf.dscPaf
    DataField = 'effective_date'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 2
    EditType = etDate
    Format = 'mm/dd/yyyy'
    FlatButtons = True
  end
  object RzDBDateTimeEdit2: TRzDBDateTimeEdit
    Left = 263
    Top = 86
    Width = 121
    Height = 22
    DataSource = dmPaf.dscPaf
    DataField = 'effective_until'
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 3
    EditType = etDate
    Format = 'mm/dd/yyyy'
    FlatButtons = True
  end
  object RzDBMemo1: TRzDBMemo
    Left = 552
    Top = 59
    Width = 289
    Height = 61
    DataField = 'paf_remarks'
    DataSource = dmPaf.dscPaf
    TabOrder = 4
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzGroupBox3: TRzGroupBox
    Left = 43
    Top = 169
    Width = 382
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Changes'
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
    TabOrder = 5
  end
  object RzDBLookupComboBox1: TRzDBLookupComboBox
    Left = 194
    Top = 199
    Width = 231
    Height = 22
    DataField = 'position_code'
    DataSource = dmPaf.dscPaf
    KeyField = 'position_code'
    ListField = 'position'
    ListSource = dmPaf.dscPosition
    TabOrder = 6
    FlatButtons = True
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBLookupComboBox2: TRzDBLookupComboBox
    Left = 194
    Top = 228
    Width = 231
    Height = 22
    DataField = 'posstatus_code'
    DataSource = dmPaf.dscPaf
    KeyField = 'posstatus_code'
    ListField = 'posstatus_name'
    ListSource = dmPaf.dscPositionStatus
    TabOrder = 7
    FlatButtons = True
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBLookupComboBox3: TRzDBLookupComboBox
    Left = 194
    Top = 257
    Width = 231
    Height = 22
    DataField = 'empstatus_code'
    DataSource = dmPaf.dscPaf
    KeyField = 'empstatus_code'
    ListField = 'empstatus_name'
    ListSource = dmPaf.dscEmpStatus
    TabOrder = 8
    FlatButtons = True
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBLookupComboBox4: TRzDBLookupComboBox
    Left = 194
    Top = 285
    Width = 231
    Height = 22
    DataField = 'location_code'
    DataSource = dmPaf.dscPaf
    KeyField = 'location_code'
    ListField = 'location_name'
    ListSource = dmPaf.dscLocations
    TabOrder = 9
    OnClick = RzDBLookupComboBox4Click
    FlatButtons = True
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBLookupComboBox5: TRzDBLookupComboBox
    Left = 194
    Top = 313
    Width = 231
    Height = 22
    DataField = 'department_code'
    DataSource = dmPaf.dscPaf
    KeyField = 'department_code'
    ListField = 'department_name'
    ListSource = dmPaf.dscDepartments
    TabOrder = 10
    FlatButtons = True
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzDBLookupComboBox6: TRzDBLookupComboBox
    Left = 304
    Top = 341
    Width = 121
    Height = 22
    DataField = 'frequency_code'
    DataSource = dmPaf.dscPaf
    KeyField = 'frequency_code'
    ListField = 'frequency_name'
    ListSource = dmPaf.dscSalaryFrequency
    TabOrder = 11
    FlatButtons = True
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
  end
  object RzGroupBox1: TRzGroupBox
    Left = 459
    Top = 169
    Width = 382
    Height = 22
    BorderColor = 6572079
    BorderSides = []
    BorderWidth = 1
    Caption = 'Allowance summary'
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
    TabOrder = 12
  end
  object pnlDetail: TRzPanel
    Left = 459
    Top = 199
    Width = 382
    Height = 136
    BorderOuter = fsNone
    BorderColor = 13816530
    BorderWidth = 1
    Color = clMenu
    TabOrder = 13
    object grSearch: TRzDBGrid
      Left = 1
      Top = 1
      Width = 380
      Height = 134
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = True
      DataSource = dmPaf.dscPafAllowances
      FixedColor = clMenu
      GradientEndColor = 12955288
      GradientStartColor = 12955288
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      FrameColor = 13816530
      FrameVisible = True
      FramingPreference = fpCustomFraming
      FixedLineColor = clMenu
      AltRowShadingColor = clBtnFace
      Columns = <
        item
          Expanded = False
          FieldName = 'allowancetype_name'
          Title.Alignment = taCenter
          Title.Caption = 'Allowance type'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'allowance_amount'
          Title.Alignment = taCenter
          Title.Caption = 'Amount'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'expiry_date'
          Title.Alignment = taCenter
          Title.Caption = 'Expiry'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 85
          Visible = True
        end>
    end
  end
  object RzDBNumericEdit1: TRzDBNumericEdit
    Left = 194
    Top = 341
    Width = 104
    Height = 22
    DataSource = dmPaf.dscPaf
    DataField = 'salary'
    Alignment = taLeftJustify
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    TabOrder = 14
    IntegersOnly = False
    DisplayFormat = '###,###,##0.00'
  end
  object pnlApprove: TRzPanel
    Left = 43
    Top = 421
    Width = 65
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderOuter = fsNone
    BorderColor = 13816530
    BorderWidth = 1
    Color = clMenu
    TabOrder = 15
    object btnApprove: TRzShapeButton
      Left = 0
      Top = 0
      Width = 65
      Height = 22
      Hint = 'Approve this PAF'
      BorderStyle = bsNone
      Caption = 'Approve'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnApproveClick
    end
  end
  object pnlStatus: TRzPanel
    Left = 136
    Top = 115
    Width = 81
    Height = 22
    BorderSides = []
    Caption = 'New'
    Color = clPurple
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
  end
  object pnlCancel: TRzPanel
    Left = 115
    Top = 421
    Width = 117
    Height = 22
    Anchors = [akLeft, akBottom]
    BorderOuter = fsNone
    BorderColor = 13816530
    BorderWidth = 1
    Color = clMenu
    TabOrder = 17
    object btnCancel: TRzShapeButton
      Left = 0
      Top = 0
      Width = 117
      Height = 22
      Hint = 'Cancel this entry'
      BorderStyle = bsNone
      Caption = 'Cancel this entry'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelClick
    end
  end
  object pnlAdd: TRzPanel
    Left = 460
    Top = 341
    Width = 50
    Height = 22
    BorderOuter = fsNone
    BorderColor = 13816530
    BorderWidth = 1
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    object btnAdd: TRzShapeButton
      Left = 0
      Top = 0
      Width = 50
      Height = 22
      Hint = 'Add allowance'
      BorderStyle = bsNone
      Caption = 'Add'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnAddClick
    end
  end
  object pnlDelete: TRzPanel
    Left = 517
    Top = 341
    Width = 50
    Height = 22
    BorderOuter = fsNone
    BorderColor = 13816530
    BorderWidth = 1
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
    object btnDelete: TRzShapeButton
      Left = 0
      Top = 0
      Width = 50
      Height = 22
      Hint = 'Remove selected allowance'
      BorderStyle = bsNone
      Caption = 'Delete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnDeleteClick
    end
  end
end
