inherited frmTimelogPayPeriod: TfrmTimelogPayPeriod
  Caption = 'frmTimelogPayPeriod'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 14
  inherited RzLabel1: TRzLabel
    Width = 72
    Caption = 'Payroll period'
    ExplicitWidth = 72
  end
  object lblStatus: TRzLabel [1]
    Left = 898
    Top = 51
    Width = 163
    Height = 14
    Anchors = [akTop, akRight]
    Caption = 'Retrieving data. Please wait...'
    Visible = False
  end
  object lblSwitchView: TRzLabel [2]
    Left = 965
    Top = 454
    Width = 109
    Height = 14
    Cursor = crHandPoint
    Hint = 'Switch to year view'
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Switch to year view'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8806462
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = lblSwitchViewClick
    FlyByEnabled = True
  end
  inherited RzLabel18: TRzLabel
    Left = 318
    ExplicitLeft = 318
  end
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 47
      Caption = 'Timelog'
      ExplicitWidth = 47
    end
    object lblNext: TLabel
      Left = 1056
      Top = 7
      Width = 26
      Height = 14
      Cursor = crHandPoint
      Hint = 'Next'
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Next'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = lblNextClick
    end
    object lblPrevious: TLabel
      Left = 1003
      Top = 7
      Width = 45
      Height = 14
      Cursor = crHandPoint
      Hint = 'Previous'
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Previous'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = lblPreviousClick
    end
  end
  inherited cmbPeriod: TRzComboBox
    Left = 107
    Width = 190
    Ctl3D = True
    DisabledColor = 14932430
    FrameHotStyle = fsFlat
    ExplicitLeft = 107
    ExplicitWidth = 190
  end
  inherited pnlCalendar: TRzPanel
    Width = 1057
    Height = 371
    BorderSides = []
    ExplicitWidth = 1057
    ExplicitHeight = 371
    inherited grCalendar: TRzStringGrid
      Width = 1057
      Height = 371
      Anchors = [akLeft, akTop, akRight]
      DefaultColWidth = 52
      GradientEndColor = 8806462
      GradientStartColor = 8806462
      OnDblClick = grCalendarDblClick
      OnDrawCell = grCalendarDrawCell
      FixedLineColor = clMenu
      ExplicitWidth = 1057
      ExplicitHeight = 371
      ColWidths = (
        52
        52
        52
        52
        52
        52
        52
        52
        52
        52
        52
        52
        52
        52
        52
        52)
    end
  end
  inherited bteFilter: TRzButtonEdit
    Left = 365
    DisabledColor = 14932430
    ParentCtl3D = False
    ExplicitLeft = 365
  end
end
