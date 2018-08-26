inherited frmAssignRights: TfrmAssignRights
  Caption = 'frmAssignRights'
  ClientHeight = 443
  ClientWidth = 888
  Position = poOwnerFormCenter
  ExplicitWidth = 888
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 888
    ExplicitWidth = 770
    inherited imgClose: TImage
      Left = 867
      ExplicitLeft = 668
    end
    inherited lblCaption: TRzLabel
      Width = 73
      Caption = 'Assign rights'
      ExplicitWidth = 73
    end
  end
  inherited pnlMain: TRzPanel
    Width = 888
    Height = 422
    inherited pnlDetail: TRzPanel
      Width = 869
      Height = 374
      inherited lblError: TJvLabel
        Left = 1
        Top = 359
        ExplicitLeft = 1
        ExplicitTop = 1
      end
      object chlRights: TRzCheckList
        Left = 16
        Top = 12
        Width = 837
        Height = 349
        OnChange = chlRightsChange
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clMenu
        Columns = 3
        FrameColor = clMenu
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ItemHeight = 17
        ParentColor = True
        TabOrder = 0
        ExplicitWidth = 627
      end
    end
    inherited btnSave: TRzPanel
      Left = 772
      Top = 391
    end
    inherited btnCancel: TRzPanel
      Left = 828
      Top = 391
    end
  end
end
