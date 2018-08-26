inherited frmBaseCalendar: TfrmBaseCalendar
  Caption = 'frmBaseCalendar'
  ClientHeight = 484
  ClientWidth = 1091
  OnCreate = FormCreate
  ExplicitWidth = 1107
  ExplicitHeight = 523
  DesignSize = (
    1091
    484)
  PixelsPerInch = 96
  TextHeight = 14
  object RzLabel1: TRzLabel [0]
    Left = 20
    Top = 51
    Width = 25
    Height = 14
    Caption = 'Year'
  end
  object RzLabel16: TRzLabel [1]
    Left = 20
    Top = 454
    Width = 49
    Height = 14
    Anchors = [akLeft, akBottom]
    Caption = 'Legend:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RzLabel18: TRzLabel [2]
    Left = 164
    Top = 51
    Width = 26
    Height = 14
    Caption = 'Filter'
  end
  inherited pnlTitle: TRzPanel
    Width = 1091
    ExplicitWidth = 1091
  end
  object cmbPeriod: TRzComboBox
    Left = 59
    Top = 45
    Width = 87
    Height = 22
    Ctl3D = False
    FlatButtonColor = 14273211
    FrameColor = 14205355
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    TabOrder = 1
    OnChange = cmbPeriodChange
  end
  object pnlCalendar: TRzPanel
    Left = 20
    Top = 73
    Width = 1046
    Height = 336
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 8675134
    Caption = 'Retrieving data. Please wait...'
    ParentColor = True
    TabOrder = 2
    object grCalendar: TRzStringGrid
      Left = 0
      Top = 0
      Width = 1046
      Height = 336
      Align = alClient
      BevelEdges = [beLeft, beTop]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 14932430
      ColCount = 16
      DefaultColWidth = 50
      DefaultRowHeight = 24
      DrawingStyle = gdsGradient
      FixedColor = 8806462
      RowCount = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14273211
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ParentColor = True
      ParentFont = False
      ScrollBars = ssNone
      TabOrder = 0
      OnMouseDown = grCalendarMouseDown
      FrameColor = 8806462
      FrameVisible = True
      FramingPreference = fpCustomFraming
      FixedLineColor = 14273211
      LineColor = clMenu
      UseDrawingStyle = False
      ColWidths = (
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50
        50)
      RowHeights = (
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24)
    end
  end
  object pnlColorLegend: TRzPanel
    Left = 110
    Top = 450
    Width = 731
    Height = 23
    Anchors = [akLeft, akBottom]
    BorderOuter = fsNone
    BorderSides = []
    ParentColor = True
    TabOrder = 3
    object RzLabel8: TRzLabel
      Left = 511
      Top = 5
      Width = 60
      Height = 13
      Caption = 'Business trip'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object shBusinessTrip: TShape
      Left = 493
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 33023
      Pen.Style = psClear
    end
    object shLeave: TShape
      Left = 424
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = clRed
      Pen.Style = psClear
    end
    object RzLabel7: TRzLabel
      Left = 442
      Top = 5
      Width = 29
      Height = 13
      Caption = 'Leave'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel6: TRzLabel
      Left = 352
      Top = 5
      Width = 49
      Height = 13
      Caption = 'Undertime'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object shUndertime: TShape
      Left = 334
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 16730789
      Pen.Style = psClear
    end
    object RzLabel5: TRzLabel
      Left = 271
      Top = 5
      Width = 42
      Height = 13
      Caption = 'Override'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object shOverride: TShape
      Left = 253
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 917503
      Pen.Style = psClear
    end
    object RzLabel4: TRzLabel
      Left = 177
      Top = 5
      Width = 53
      Height = 13
      Caption = 'Incomplete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object shIncomplete: TShape
      Left = 159
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 5373864
      Pen.Style = psClear
    end
    object RzLabel3: TRzLabel
      Left = 91
      Top = 5
      Width = 45
      Height = 13
      Caption = 'Complete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object shComplete: TShape
      Left = 73
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 5548032
      Pen.Style = psClear
    end
    object RzLabel2: TRzLabel
      Left = 17
      Top = 5
      Width = 35
      Height = 13
      Caption = 'Holiday'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object shHoliday: TShape
      Left = -1
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 16750383
      Pen.Style = psClear
    end
    object shSunday: TShape
      Left = 597
      Top = 6
      Width = 12
      Height = 12
      Brush.Color = 5548971
      Pen.Style = psClear
    end
    object RzLabel19: TRzLabel
      Left = 615
      Top = 5
      Width = 36
      Height = 13
      Caption = 'Sunday'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object bteFilter: TRzButtonEdit
    Left = 203
    Top = 45
    Width = 310
    Height = 22
    Text = ''
    DisabledColor = 14273211
    FrameColor = 14205355
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ReadOnly = True
    ReadOnlyColor = clWindow
    TabOrder = 4
    AltBtnKind = bkReject
    ButtonKind = bkFind
    AltBtnVisible = True
    AltBtnWidth = 15
    ButtonWidth = 15
    FlatButtons = True
    FlatButtonColor = 14273211
    HideButtonsOnReadOnly = False
    OnAltBtnClick = bteFilterAltBtnClick
    OnButtonClick = bteFilterButtonClick
  end
end
