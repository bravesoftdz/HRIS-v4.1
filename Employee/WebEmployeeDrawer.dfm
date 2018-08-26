object EmployeeDrawerFrame: TEmployeeDrawerFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  TabOrder = 0
  object MenuPanel: TUniSimplePanel
    Left = 0
    Top = 0
    Width = 200
    Height = 305
    Hint = ''
    ParentColor = False
    Color = 16250871
    Align = alLeft
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    object MainLabel: TUniLabel
      Left = 41
      Top = 26
      Width = 28
      Height = 16
      Cursor = crHandPoint
      Hint = ''
      Caption = 'Main'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      TabOrder = 1
      OnClick = MainLabelClick
    end
    object AddressAndContactLabel: TUniLabel
      Left = 41
      Top = 58
      Width = 120
      Height = 16
      Cursor = crHandPoint
      Hint = ''
      Caption = 'Address and contact'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      TabOrder = 2
      OnClick = AddressAndContactLabelClick
    end
    object FamilyAndRelativesLabel: TUniLabel
      Left = 41
      Top = 90
      Width = 115
      Height = 16
      Cursor = crHandPoint
      Hint = ''
      Caption = 'Family and relatives'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      TabOrder = 3
      OnClick = FamilyAndRelativesLabelClick
    end
    object PafRecordsLabel: TUniLabel
      Left = 41
      Top = 122
      Width = 72
      Height = 16
      Cursor = crHandPoint
      Hint = ''
      Caption = 'PAF records'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      TabOrder = 4
    end
  end
  object DockPanel: TUniSimplePanel
    Left = 200
    Top = 0
    Width = 251
    Height = 305
    Hint = ''
    ParentColor = False
    Color = clWhite
    Align = alClient
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
end
