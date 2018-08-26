object AddressAndContactFrame: TAddressAndContactFrame
  Left = 0
  Top = 0
  Width = 1025
  Height = 609
  OnCreate = UniFrameCreate
  ParentAlignmentControl = False
  Color = clWhite
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  Font.Charset = ANSI_CHARSET
  Font.Height = -12
  TabOrder = 0
  ParentColor = False
  ParentFont = False
  ParentBackground = False
  ExplicitWidth = 451
  ExplicitHeight = 305
  object UniDBEdit1: TUniDBEdit
    Left = 176
    Top = 143
    Width = 225
    Height = 22
    Hint = ''
    DataField = 'barangay'
    DataSource = dmEmployee.dscEmpAddressH
    TabOrder = 0
    ReadOnly = True
  end
  object UniLabel1: TUniLabel
    Left = 80
    Top = 86
    Width = 35
    Height = 14
    Hint = ''
    Caption = 'Street'
    TabOrder = 1
  end
  object UniLabel2: TUniLabel
    Left = 80
    Top = 150
    Width = 49
    Height = 14
    Hint = ''
    Caption = 'Barangay'
    TabOrder = 2
  end
  object UniLabel3: TUniLabel
    Left = 80
    Top = 190
    Width = 65
    Height = 14
    Hint = ''
    Caption = 'City / Town'
    TabOrder = 3
  end
  object CaptionPanel: TUniSimplePanel
    Left = 80
    Top = 60
    Width = 321
    Height = 1
    Hint = ''
    ParentColor = False
    Color = 14737632
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    TabOrder = 4
  end
  object UniLabel4: TUniLabel
    Left = 80
    Top = 46
    Width = 86
    Height = 14
    Hint = ''
    Caption = 'Home address'
    ParentFont = False
    Font.Height = -12
    Font.Style = [fsBold]
    TabOrder = 5
  end
  object UniDBMemo1: TUniDBMemo
    Left = 176
    Top = 80
    Width = 225
    Height = 46
    Hint = ''
    DataField = 'street'
    DataSource = dmEmployee.dscEmpAddressH
    TabOrder = 6
  end
  object UniDBLookupComboBox2: TUniDBLookupComboBox
    Left = 592
    Top = 183
    Width = 225
    Hint = ''
    ListField = 'town'
    ListSource = dmEmployee.dscTowns
    KeyField = 'town_id'
    ListFieldIndex = 0
    DataField = 'town_id'
    DataSource = dmEmployee.dscEmpAddressP
    TabOrder = 7
    Color = clWindow
  end
  object UniDBEdit2: TUniDBEdit
    Left = 592
    Top = 143
    Width = 225
    Height = 22
    Hint = ''
    DataField = 'barangay'
    DataSource = dmEmployee.dscEmpAddressP
    TabOrder = 8
    ReadOnly = True
  end
  object UniLabel5: TUniLabel
    Left = 496
    Top = 86
    Width = 35
    Height = 14
    Hint = ''
    Caption = 'Street'
    TabOrder = 9
  end
  object UniLabel6: TUniLabel
    Left = 496
    Top = 150
    Width = 49
    Height = 14
    Hint = ''
    Caption = 'Barangay'
    TabOrder = 10
  end
  object UniLabel7: TUniLabel
    Left = 496
    Top = 190
    Width = 65
    Height = 14
    Hint = ''
    Caption = 'City / Town'
    TabOrder = 11
  end
  object UniSimplePanel1: TUniSimplePanel
    Left = 496
    Top = 60
    Width = 321
    Height = 1
    Hint = ''
    ParentColor = False
    Color = 14737632
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    TabOrder = 12
  end
  object UniLabel8: TUniLabel
    Left = 496
    Top = 46
    Width = 98
    Height = 14
    Hint = ''
    Caption = 'Present address'
    ParentFont = False
    Font.Height = -12
    Font.Style = [fsBold]
    TabOrder = 13
  end
  object UniDBMemo2: TUniDBMemo
    Left = 592
    Top = 80
    Width = 225
    Height = 46
    Hint = ''
    DataField = 'street'
    DataSource = dmEmployee.dscEmpAddressP
    TabOrder = 14
  end
  object UniDBLookupComboBox1: TUniDBLookupComboBox
    Left = 176
    Top = 183
    Width = 225
    Hint = ''
    ListField = 'town'
    ListSource = dmEmployee.dscTowns
    KeyField = 'town_id'
    ListFieldIndex = 0
    DataField = 'town_id'
    DataSource = dmEmployee.dscEmpAddressH
    TabOrder = 15
    Color = clWindow
  end
  object UniDBCheckBox1: TUniDBCheckBox
    Left = 80
    Top = 232
    Width = 321
    Height = 17
    Hint = ''
    DataField = 'is_present'
    DataSource = dmEmployee.dscEmpAddressH
    Caption = 'Home address is present address'
    TabOrder = 16
  end
  object UniDBEdit7: TUniDBEdit
    Left = 592
    Top = 438
    Width = 225
    Height = 23
    Hint = ''
    DataField = 'em_relation'
    DataSource = dmEmployee.dscEmpEmergency
    TabOrder = 17
  end
  object UniLabel16: TUniLabel
    Left = 80
    Top = 324
    Width = 34
    Height = 14
    Hint = ''
    Caption = 'Mobile'
    TabOrder = 18
  end
  object UniDBEdit8: TUniDBEdit
    Left = 592
    Top = 478
    Width = 225
    Height = 23
    Hint = ''
    DataField = 'em_contact'
    DataSource = dmEmployee.dscEmpEmergency
    TabOrder = 19
  end
  object UniLabel17: TUniLabel
    Left = 80
    Top = 364
    Width = 44
    Height = 14
    Hint = ''
    Caption = 'Landline'
    TabOrder = 20
  end
  object UniDBEdit9: TUniDBEdit
    Left = 592
    Top = 518
    Width = 225
    Height = 23
    Hint = ''
    DataField = 'em_email'
    DataSource = dmEmployee.dscEmpEmergency
    TabOrder = 21
  end
  object UniLabel18: TUniLabel
    Left = 80
    Top = 404
    Width = 27
    Height = 14
    Hint = ''
    Caption = 'Email'
    TabOrder = 22
  end
  object UniSimplePanel3: TUniSimplePanel
    Left = 80
    Top = 298
    Width = 321
    Height = 1
    Hint = ''
    ParentColor = False
    Color = 14737632
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    TabOrder = 23
  end
  object UniLabel19: TUniLabel
    Left = 80
    Top = 284
    Width = 93
    Height = 14
    Hint = ''
    Caption = 'Contact details'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -12
    Font.Style = [fsBold]
    TabOrder = 24
  end
  object UniDBEdit3: TUniDBEdit
    Left = 176
    Top = 318
    Width = 225
    Height = 23
    Hint = ''
    DataField = 'mobile_no'
    DataSource = dmEmployee.dscEmpContactH
    TabOrder = 25
  end
  object UniLabel9: TUniLabel
    Left = 496
    Top = 324
    Width = 31
    Height = 14
    Hint = ''
    Caption = 'Name'
    TabOrder = 26
  end
  object UniDBEdit4: TUniDBEdit
    Left = 176
    Top = 358
    Width = 225
    Height = 23
    Hint = ''
    DataField = 'landline_no'
    DataSource = dmEmployee.dscEmpContactH
    TabOrder = 27
  end
  object UniLabel10: TUniLabel
    Left = 496
    Top = 364
    Width = 43
    Height = 14
    Hint = ''
    Caption = 'Address'
    TabOrder = 28
  end
  object UniDBEdit5: TUniDBEdit
    Left = 176
    Top = 398
    Width = 225
    Height = 23
    Hint = ''
    DataField = 'email'
    DataSource = dmEmployee.dscEmpContactH
    TabOrder = 29
  end
  object UniLabel11: TUniLabel
    Left = 496
    Top = 444
    Width = 43
    Height = 14
    Hint = ''
    Caption = 'Relation'
    TabOrder = 30
  end
  object UniSimplePanel2: TUniSimplePanel
    Left = 496
    Top = 298
    Width = 321
    Height = 1
    Hint = ''
    ParentColor = False
    Color = 14737632
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    TabOrder = 31
  end
  object UniLabel12: TUniLabel
    Left = 496
    Top = 284
    Width = 117
    Height = 14
    Hint = ''
    Caption = 'Emergency contact'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -12
    Font.Style = [fsBold]
    TabOrder = 32
  end
  object UniDBEdit6: TUniDBEdit
    Left = 592
    Top = 318
    Width = 225
    Height = 23
    Hint = ''
    DataField = 'em_name'
    DataSource = dmEmployee.dscEmpEmergency
    TabOrder = 33
  end
  object UniLabel13: TUniLabel
    Left = 496
    Top = 484
    Width = 89
    Height = 14
    Hint = ''
    Caption = 'Contact number'
    TabOrder = 34
  end
  object UniLabel14: TUniLabel
    Left = 496
    Top = 524
    Width = 27
    Height = 14
    Hint = ''
    Caption = 'Email'
    TabOrder = 35
  end
  object UniDBMemo3: TUniDBMemo
    Left = 592
    Top = 358
    Width = 225
    Height = 63
    Hint = ''
    DataField = 'em_address'
    DataSource = dmEmployee.dscEmpEmergency
    TabOrder = 36
  end
end
