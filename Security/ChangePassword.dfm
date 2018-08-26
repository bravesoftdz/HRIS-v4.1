inherited frmChangePassword: TfrmChangePassword
  Caption = 'frmChangePassword'
  ClientHeight = 356
  OnCreate = FormCreate
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 37
    Top = 27
    Width = 96
    Height = 14
    Caption = 'Current password'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 37
    Top = 91
    Width = 80
    Height = 14
    Caption = 'New password'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 37
    Top = 155
    Width = 41
    Height = 14
    Caption = 'Confirm'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblErrorMessage: TLabel [3]
    Left = 37
    Top = 219
    Width = 139
    Height = 14
    Caption = 'Passwords do not match.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited pnlTitle: TRzPanel
    Top = -30
    Align = alNone
    ExplicitTop = -30
    inherited lblTitle: TRzLabel
      Width = 109
      Caption = 'Change password'
      ExplicitWidth = 109
    end
  end
  object edPassword: TRzEdit
    Left = 37
    Top = 47
    Width = 220
    Height = 22
    Text = ''
    DisabledColor = 12630669
    FrameColor = 12961221
    FrameVisible = True
    FramingPreference = fpCustomFraming
    PasswordChar = '*'
    TabOnEnter = True
    TabOrder = 1
  end
  object edNewPassword: TRzEdit
    Left = 37
    Top = 111
    Width = 220
    Height = 22
    Text = ''
    DisabledColor = 12630669
    FrameColor = 12961221
    FrameVisible = True
    FramingPreference = fpCustomFraming
    PasswordChar = '*'
    TabOnEnter = True
    TabOrder = 2
  end
  object edConfirm: TRzEdit
    Left = 37
    Top = 175
    Width = 220
    Height = 22
    Text = ''
    DisabledColor = 12630669
    FrameColor = 12961221
    FrameVisible = True
    FramingPreference = fpCustomFraming
    PasswordChar = '*'
    TabOnEnter = True
    TabOrder = 3
  end
end
