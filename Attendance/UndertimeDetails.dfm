inherited frmUndertimeDetails: TfrmUndertimeDetails
  Caption = 'frmUndertimeDetails'
  ClientHeight = 355
  ClientWidth = 581
  OnCreate = FormCreate
  ExplicitWidth = 581
  ExplicitHeight = 355
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 581
    ExplicitWidth = 581
    inherited imgClose: TImage
      Left = 560
      ExplicitLeft = 591
    end
    inherited lblCaption: TRzLabel
      Width = 60
      Caption = 'Undertime'
      ExplicitWidth = 60
    end
  end
  inherited pnlMain: TRzPanel
    Width = 581
    Height = 334
    ExplicitWidth = 581
    ExplicitHeight = 334
    DesignSize = (
      581
      334)
    object lblDate: TRzLabel [0]
      Left = 19
      Top = 61
      Width = 106
      Height = 14
      Caption = 'No date selected.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel5: TRzLabel [1]
      Left = 19
      Top = 24
      Width = 53
      Height = 14
      Caption = 'Employee'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited pnlDetail: TRzPanel
      Left = 19
      Top = 99
      Width = 541
      Height = 32
      ExplicitLeft = 19
      ExplicitTop = 99
      ExplicitWidth = 541
      ExplicitHeight = 32
      object grDateSelector: TRzStringGrid
        Left = 1
        Top = 1
        Width = 539
        Height = 30
        Align = alClient
        BevelEdges = [beLeft, beTop]
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 14932430
        ColCount = 30
        DefaultColWidth = 53
        DefaultRowHeight = 30
        DrawingStyle = gdsGradient
        FixedColor = 14205355
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientStartColor = 917503
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
        ParentFont = False
        ScrollBars = ssNone
        TabOrder = 0
        OnClick = grDateSelectorClick
        OnDrawCell = grDateSelectorDrawCell
        FixedLineColor = 14205355
        LineColor = 14205355
        UseDrawingStyle = False
        ColWidths = (
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53
          53)
        RowHeights = (
          30)
      end
    end
    inherited btnSave: TRzPanel
      Left = 456
      Top = 304
      ExplicitLeft = 456
      ExplicitTop = 304
      inherited sbtnSave: TRzShapeButton
        CaptionX = 10
        CaptionY = 1
      end
    end
    inherited btnCancel: TRzPanel
      Left = 510
      Top = 304
      ExplicitLeft = 510
      ExplicitTop = 304
      inherited sbtnCancel: TRzShapeButton
        CaptionX = 4
        CaptionY = 1
      end
    end
    object pnlAM: TRzPanel
      Tag = 1
      Left = 19
      Top = 149
      Width = 262
      Height = 137
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
      TabOrder = 3
      object RzLabel7: TRzLabel
        Left = 19
        Top = 58
        Width = 27
        Height = 14
        Caption = 'Time'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel1: TRzLabel
        Left = 19
        Top = 85
        Width = 39
        Height = 14
        Caption = 'Reason'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblStatusAM: TRzLabel
        Left = 224
        Top = 21
        Width = 18
        Height = 14
        Alignment = taRightJustify
        Caption = 'xxx'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbluReasonAM: TRzDBLookupComboBox
        Left = 67
        Top = 79
        Width = 175
        Height = 22
        DataField = 'undertime_reason_code'
        DataSource = dmTimelog.dscUndertimeAM
        Enabled = False
        KeyField = 'undertime_reason_code'
        ListField = 'undertime_reason_name'
        ListSource = dmTimelog.dscUndertimeReason
        TabOrder = 3
        FlatButtons = True
        DisabledColor = 14932430
        FocusColor = clWhite
        FrameColor = 14205355
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
      end
      object chbAM: TRzCheckBox
        Left = 19
        Top = 20
        Width = 104
        Height = 16
        Caption = 'Morning (AM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbUnchecked
        TabOrder = 0
        OnClick = chbAMClick
      end
      object dteFromAM: TRzDateTimeEdit
        Left = 67
        Top = 52
        Width = 85
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        OnInvalidTime = dteFromAMInvalidTime
        BeepOnInvalidKey = False
        DisabledColor = 14932430
        DropButtonVisible = False
        Enabled = False
        FlatButtons = True
        FrameColor = 14205355
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 1
      end
      object dteUntilAM: TRzDateTimeEdit
        Left = 157
        Top = 52
        Width = 85
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        OnInvalidTime = dteUntilAMInvalidTime
        DisabledColor = 14932430
        DropButtonVisible = False
        Enabled = False
        FlatButtons = True
        FrameColor = 14205355
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 2
      end
      object chbPaidAM: TRzDBCheckBox
        Left = 67
        Top = 107
        Width = 41
        Height = 16
        DataField = 'is_paid'
        DataSource = dmTimelog.dscUndertimeAM
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = 'Paid'
        DisabledColor = 14273211
        FillColor = 14273211
        FocusColor = 14273211
        TabOrder = 4
      end
    end
    object pnlPM: TRzPanel
      Tag = 1
      Left = 298
      Top = 149
      Width = 262
      Height = 137
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
      TabOrder = 4
      object RzLabel2: TRzLabel
        Left = 19
        Top = 58
        Width = 27
        Height = 14
        Caption = 'Time'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel3: TRzLabel
        Left = 19
        Top = 85
        Width = 39
        Height = 14
        Caption = 'Reason'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblStatusPM: TRzLabel
        Left = 224
        Top = 21
        Width = 18
        Height = 14
        Alignment = taRightJustify
        Caption = 'xxx'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbluReasonPM: TRzDBLookupComboBox
        Left = 67
        Top = 79
        Width = 175
        Height = 22
        DataField = 'undertime_reason_code'
        DataSource = dmTimelog.dscUndertimePM
        Enabled = False
        KeyField = 'undertime_reason_code'
        ListField = 'undertime_reason_name'
        ListSource = dmTimelog.dscUndertimeReason
        TabOrder = 2
        FlatButtons = True
        DisabledColor = 14932430
        FocusColor = clWhite
        FrameColor = 14205355
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
      end
      object chbPaidPM: TRzDBCheckBox
        Left = 67
        Top = 107
        Width = 41
        Height = 16
        DataField = 'is_paid'
        DataSource = dmTimelog.dscUndertimePM
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = 'Paid'
        DisabledColor = 14273211
        FillColor = 14273211
        FocusColor = 14273211
        TabOrder = 3
      end
      object chbPM: TRzCheckBox
        Left = 19
        Top = 20
        Width = 116
        Height = 16
        Caption = 'Afternoon (PM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbUnchecked
        TabOrder = 4
        OnClick = chbPMClick
      end
      object dteFromPM: TRzDateTimeEdit
        Left = 67
        Top = 52
        Width = 85
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        OnInvalidTime = dteFromAMInvalidTime
        DisabledColor = 14932430
        DropButtonVisible = False
        Enabled = False
        FlatButtons = True
        FrameColor = 14205355
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 0
      end
      object dteUntilPM: TRzDateTimeEdit
        Left = 157
        Top = 52
        Width = 85
        Height = 22
        ShowHowToUseHint = False
        EditType = etTime
        Format = 'hh:nn'
        UseFormatToParse = True
        OnInvalidTime = dteUntilAMInvalidTime
        DisabledColor = 14932430
        DropButtonVisible = False
        Enabled = False
        FlatButtons = True
        FrameColor = 14205355
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 14273211
        TabOnEnter = True
        TabOrder = 1
      end
    end
    object bteEmployee: TRzButtonEdit
      Left = 86
      Top = 18
      Width = 474
      Height = 22
      Text = ''
      Color = clWhite
      FocusColor = 14932430
      FrameColor = 14205355
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnly = True
      ReadOnlyColor = clWhite
      TabOrder = 5
      AltBtnKind = bkFind
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      HideButtonsOnReadOnly = False
      OnButtonClick = bteEmployeeButtonClick
    end
    object chbCloseOnSave: TRzCheckBox
      Left = 19
      Top = 308
      Width = 93
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'Close on save'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 6
    end
  end
end
