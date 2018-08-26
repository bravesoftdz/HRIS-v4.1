inherited frmBasePopupDetail: TfrmBasePopupDetail
  Caption = 'frmBasePopupDetail'
  ClientHeight = 248
  ClientWidth = 533
  OnClose = FormClose
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
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
      TabOrder = 0
    end
    object btnSave: TRzPanel
      Left = 417
      Top = 196
      Width = 50
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
      TabOrder = 1
      DesignSize = (
        50
        22)
      object sbtnSave: TRzShapeButton
        Left = 2
        Top = 2
        Width = 46
        Height = 18
        Cursor = crHandPoint
        BorderColor = 8806462
        CaptionPosition = cpXY
        CaptionX = 30
        CaptionY = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Save'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
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
        CaptionX = 30
        CaptionY = 8
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Cancel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
