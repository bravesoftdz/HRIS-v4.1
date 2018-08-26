inherited frmSecurityMain: TfrmSecurityMain
  Caption = 'frmSecurityMain'
  ClientHeight = 438
  ClientWidth = 813
  OnCreate = FormCreate
  ExplicitWidth = 829
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 813
    ExplicitWidth = 813
    inherited lblTitle: TRzLabel
      Width = 86
      Caption = 'User and roles'
      ExplicitWidth = 86
    end
  end
  object pnlOptions: TRzPanel
    Left = 0
    Top = 28
    Width = 155
    Height = 410
    Align = alLeft
    BorderOuter = fsNone
    BorderSides = [sdRight]
    BorderColor = 12961221
    BorderWidth = 1
    Color = 15395562
    TabOrder = 1
    object urlChangePassword: TRzURLLabel
      Left = 16
      Top = 21
      Width = 96
      Height = 14
      Caption = 'Change password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8026685
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlChangePasswordClick
    end
    object urlUsers: TRzURLLabel
      Left = 16
      Top = 45
      Width = 72
      Height = 14
      Caption = 'System users'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8026685
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlUsersClick
    end
    object urlRoles: TRzURLLabel
      Left = 16
      Top = 93
      Width = 69
      Height = 14
      Caption = 'System roles'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8026685
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlRolesClick
    end
    object urlRights: TRzURLLabel
      Left = 16
      Top = 69
      Width = 74
      Height = 14
      Caption = 'System rights'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8026685
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlRightsClick
    end
  end
  object pnlDock: TRzPanel
    Left = 155
    Top = 28
    Width = 658
    Height = 410
    Align = alClient
    BorderOuter = fsNone
    BorderSides = []
    BorderColor = 12961221
    BorderWidth = 1
    ParentColor = True
    TabOrder = 2
  end
end
