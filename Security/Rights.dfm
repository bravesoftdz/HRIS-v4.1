inherited frmRights: TfrmRights
  Caption = 'frmRights'
  ClientHeight = 449
  ClientWidth = 684
  OnCreate = FormCreate
  ExplicitWidth = 700
  ExplicitHeight = 488
  PixelsPerInch = 96
  TextHeight = 14
  object lblDate: TLabel [0]
    Left = 23
    Top = 15
    Width = 39
    Height = 14
    Caption = 'Module'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited pnlTitle: TRzPanel
    Top = -30
    Align = alNone
    Visible = False
    ExplicitTop = -30
  end
  object chlRights: TRzCheckList
    Left = 23
    Top = 56
    Width = 642
    Height = 361
    HighlightColor = 15327448
    OnChange = chlRightsChange
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    Color = clMenu
    Columns = 3
    DisabledColor = clBlack
    FrameColor = clMenu
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ItemHeight = 17
    ParentColor = True
    TabOrder = 1
  end
  object cmbModule: TRzComboBox
    Left = 71
    Top = 9
    Width = 234
    Height = 22
    Ctl3D = False
    FrameColor = 13816530
    FrameVisible = True
    FramingPreference = fpCustomFraming
    ParentCtl3D = False
    TabOrder = 2
    Text = 'Admin-related'
    OnChange = cmbModuleChange
    Items.Strings = (
      'Admin-related'
      'Employee'
      'PAF'
      'Payroll'
      'Time and Attendance'
      'Security'
      'Settings')
  end
end
