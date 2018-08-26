inherited frmBasePopupDetail2: TfrmBasePopupDetail2
  Caption = 'frmBasePopupDetail2'
  ClientHeight = 248
  ClientWidth = 533
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 533
  ExplicitHeight = 248
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 533
    ExplicitWidth = 533
    DesignSize = (
      533
      21)
    inherited imgClose: TImage
      Left = 512
      ExplicitLeft = 528
    end
  end
  inherited pnlMain: TRzPanel
    Width = 533
    Height = 227
    ExplicitWidth = 533
    ExplicitHeight = 227
    DesignSize = (
      533
      227)
    object pnlDetail: TRzPanel
      Left = 9
      Top = 9
      Width = 514
      Height = 179
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 13816530
      BorderWidth = 1
      Color = clMenu
      TabOrder = 0
      DesignSize = (
        514
        179)
      object lblError: TJvLabel
        Left = 28
        Top = 145
        Width = 6
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Anchors = [akLeft, akBottom]
        ParentFont = False
        Transparent = True
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -12
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
    end
    object btnSave: TRzPanel
      Left = 417
      Top = 196
      Width = 50
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 13816530
      BorderWidth = 1
      Color = clMenu
      TabOrder = 1
      DesignSize = (
        50
        22)
      object sbtnSave: TRzShapeButton
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 46
        Height = 18
        Cursor = crHandPoint
        BorderColor = 8806462
        CaptionPosition = cpXY
        CaptionX = 10
        CaptionY = 1
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Save'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = sbtnSaveClick
      end
    end
    object btnCancel: TRzPanel
      Left = 473
      Top = 196
      Width = 50
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 13816530
      BorderWidth = 1
      Color = clMenu
      TabOrder = 2
      DesignSize = (
        50
        22)
      object sbtnCancel: TRzShapeButton
        Left = 2
        Top = 2
        Width = 46
        Height = 18
        Cursor = crHandPoint
        BorderColor = 8806462
        CaptionPosition = cpXY
        CaptionX = 5
        CaptionY = 1
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cancel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = imgCloseClick
      end
    end
  end
end
