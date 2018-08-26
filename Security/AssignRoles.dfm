inherited frmAssignRoles: TfrmAssignRoles
  Caption = 'frmAssignRoles'
  ClientHeight = 443
  ClientWidth = 678
  ExplicitWidth = 678
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 678
    ExplicitWidth = 678
    inherited imgClose: TImage
      Left = 657
      ExplicitLeft = 597
    end
    inherited lblCaption: TRzLabel
      Width = 104
      Caption = 'Assigned roles for '
      ExplicitWidth = 104
    end
  end
  inherited pnlMain: TRzPanel
    Width = 678
    Height = 422
    ExplicitWidth = 678
    ExplicitHeight = 422
    inherited pnlDetail: TRzPanel
      Width = 660
      Height = 375
      ExplicitWidth = 660
      ExplicitHeight = 375
      inherited lblError: TJvLabel
        Top = 341
        ExplicitTop = 116
      end
      object chlRoles: TRzCheckList
        Left = 16
        Top = 12
        Width = 627
        Height = 349
        OnChange = chlRolesChange
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clMenu
        Columns = 3
        FrameColor = clMenu
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ItemHeight = 17
        ParentColor = True
        TabOrder = 0
      end
    end
    inherited btnSave: TRzPanel
      Left = 563
      Top = 392
      ExplicitLeft = 563
      ExplicitTop = 392
    end
    inherited btnCancel: TRzPanel
      Left = 619
      Top = 392
      ExplicitLeft = 619
      ExplicitTop = 392
    end
  end
end
