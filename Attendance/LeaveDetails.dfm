inherited frmLeaveDetails: TfrmLeaveDetails
  Caption = 'frmLeaveDetails'
  ClientHeight = 530
  ClientWidth = 823
  ExplicitWidth = 823
  ExplicitHeight = 530
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 823
    ExplicitWidth = 1107
    inherited imgClose: TImage
      Left = 802
      ExplicitLeft = 832
    end
    inherited lblCaption: TRzLabel
      Width = 75
      Caption = 'Leave details'
      ExplicitWidth = 75
    end
  end
  inherited pnlMain: TRzPanel
    Width = 823
    Height = 509
    ExplicitWidth = 1107
    ExplicitHeight = 439
    object RzLabel5: TRzLabel
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
    object RzLabel1: TRzLabel
      Left = 579
      Top = 24
      Width = 68
      Height = 14
      Caption = 'Date applied'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel2: TRzLabel
      Left = 19
      Top = 52
      Width = 28
      Height = 14
      Caption = 'Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel3: TRzLabel
      Left = 19
      Top = 80
      Width = 61
      Height = 41
      AutoSize = False
      Caption = 'BM'#39's remarks'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object RzLabel4: TRzLabel
      Left = 410
      Top = 80
      Width = 70
      Height = 41
      AutoSize = False
      Caption = 'Justification for late filing'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
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
      TabOrder = 0
      AltBtnKind = bkFind
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      HideButtonsOnReadOnly = False
    end
    object dteFromAM: TRzDateTimeEdit
      Left = 662
      Top = 18
      Width = 140
      Height = 22
      ShowHowToUseHint = False
      EditType = etTime
      Format = 'hh:nn'
      UseFormatToParse = True
      BeepOnInvalidKey = False
      DisabledColor = clWhite
      DropButtonVisible = False
      Enabled = False
      FlatButtons = True
      FrameColor = 14205355
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = clWhite
      TabOnEnter = True
      TabOrder = 1
    end
    object dbluReasonAM: TRzDBLookupComboBox
      Left = 86
      Top = 46
      Width = 474
      Height = 22
      DataField = 'undertime_reason_code'
      DataSource = dmTimelog.dscUndertimeAM
      Enabled = False
      KeyField = 'undertime_reason_code'
      ListField = 'undertime_reason_name'
      ListSource = dmTimelog.dscUndertimeReason
      TabOrder = 2
      FlatButtons = True
      DisabledColor = 14932430
      FrameColor = 14205355
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 14273211
    end
    object RzDBMemo1: TRzDBMemo
      Left = 86
      Top = 74
      Width = 305
      Height = 47
      TabOrder = 3
      FrameColor = 14205355
      FrameVisible = True
      FramingPreference = fpCustomFraming
    end
    object pnlList: TRzPanel
      Left = 20
      Top = 128
      Width = 782
      Height = 196
      Anchors = [akLeft, akTop, akRight]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Caption = 'Retrieving data. Please wait...'
      ParentColor = True
      TabOrder = 4
      object grList: TRzDBGrid
        Left = 1
        Top = 1
        Width = 780
        Height = 194
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
            Title.Caption = 'Paid'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_f'
            Title.Alignment = taCenter
            Title.Caption = 'AM/PM'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 60
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
            Width = 240
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
            Width = 240
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 80
            Visible = True
          end>
      end
    end
    object RzDBMemo2: TRzDBMemo
      Left = 497
      Top = 74
      Width = 305
      Height = 47
      TabOrder = 5
      FrameColor = 14205355
      FrameVisible = True
      FramingPreference = fpCustomFraming
    end
  end
end
