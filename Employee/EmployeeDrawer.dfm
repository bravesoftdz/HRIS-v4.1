inherited frmEmployeeDrawer: TfrmEmployeeDrawer
  Caption = 'gm'
  ClientHeight = 352
  ClientWidth = 696
  OnShow = FormShow
  ExplicitWidth = 712
  ExplicitHeight = 391
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 696
    ExplicitWidth = 696
    inherited lblTitle: TRzLabel
      Width = 101
      Caption = 'Employee record'
      ExplicitWidth = 101
    end
    object lblIdNumber: TRzLabel
      Left = 664
      Top = 7
      Width = 4
      Height = 14
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8026685
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BorderSides = [sdBottom]
    end
  end
  object pnlDock: TRzPanel
    Left = 176
    Top = 28
    Width = 520
    Height = 324
    Align = alClient
    BorderOuter = fsNone
    BorderSides = []
    BorderColor = 13816530
    BorderWidth = 1
    Color = clMenu
    GradientColorStyle = gcsCustom
    GradientColorStart = 8421440
    GradientColorStop = 10329423
    TabOrder = 1
    VisualStyle = vsClassic
  end
  object pnlMenu: TRzPanel
    Left = 0
    Top = 28
    Width = 176
    Height = 324
    Align = alLeft
    BorderOuter = fsNone
    BorderSides = [sdRight]
    BorderColor = 12961221
    BorderWidth = 1
    Color = 15395562
    Enabled = False
    GradientColorStyle = gcsCustom
    GradientColorStart = 8421440
    GradientColorStop = 10329423
    TabOrder = 2
    VisualStyle = vsClassic
    object urlMain: TRzURLLabel
      Left = 24
      Top = 24
      Width = 24
      Height = 14
      Caption = 'Main'
      Color = 15395562
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8026685
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = urlMainClick
    end
    object urlAddressAndContact: TRzURLLabel
      Left = 24
      Top = 48
      Width = 113
      Height = 14
      Caption = 'Address and contact'
      Color = 15395562
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8026685
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = urlAddressAndContactClick
    end
    object urlFamily: TRzURLLabel
      Left = 24
      Top = 72
      Width = 104
      Height = 14
      Caption = 'Family and relatives'
      Color = 15395562
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8026685
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = urlFamilyClick
    end
    object urlPhoto: TRzURLLabel
      Left = 24
      Top = 96
      Width = 33
      Height = 14
      Caption = 'Photo'
      Color = 15395562
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8026685
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = urlPhotoClick
    end
    object urlPAFRecords: TRzURLLabel
      Left = 24
      Top = 120
      Width = 65
      Height = 14
      Caption = 'PAF records'
      Color = 15395562
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8026685
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = urlPAFRecordsClick
    end
    object urlPayroll: TRzURLLabel
      Left = 24
      Top = 144
      Width = 34
      Height = 14
      Caption = 'Payroll'
      Color = 15395562
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8026685
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
    end
  end
end
