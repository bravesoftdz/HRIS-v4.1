inherited frmBaseGridDetail: TfrmBaseGridDetail
  Caption = 'frmBaseGridDetail'
  ClientHeight = 474
  ClientWidth = 778
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 794
  ExplicitHeight = 513
  DesignSize = (
    778
    474)
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Top = -30
    Width = 778
    Align = alNone
    ExplicitTop = -30
    ExplicitWidth = 778
  end
  object pnlList: TRzPanel
    Left = 6
    Top = 38
    Width = 483
    Height = 430
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 13816530
    BorderWidth = 1
    ParentColor = True
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 481
      Height = 428
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      FixedColor = clWhite
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
      DisabledColor = clWhite
      FrameColor = 13816530
      FrameSides = []
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      FixedLineColor = clWhite
      LineColor = clWhite
      AltRowShadingColor = 15854564
    end
  end
  object pnlSearch: TRzPanel
    Left = 0
    Top = 0
    Width = 778
    Height = 33
    Align = alTop
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight]
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      778
      33)
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 37
      Height = 14
      Caption = 'Search'
    end
    object edSearchKey: TRzEdit
      Left = 52
      Top = 9
      Width = 437
      Height = 22
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      FrameColor = 13816530
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 0
      OnChange = edSearchKeyChange
    end
  end
  object pnlDetail: TRzPanel
    Left = 495
    Top = 9
    Width = 277
    Height = 459
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 13816530
    BorderWidth = 1
    ParentColor = True
    TabOrder = 3
    DesignSize = (
      277
      459)
    object pnlAdd: TRzPanel
      Left = 8
      Top = 429
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 13816530
      BorderWidth = 1
      Color = clMenu
      TabOrder = 0
      object sbtnNew: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Add a new record'
        BorderStyle = bsNone
        Caption = 'New'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnNewClick
      end
    end
  end
end
