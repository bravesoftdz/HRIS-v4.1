object EmployeeMainFrame: TEmployeeMainFrame
  Left = 0
  Top = 0
  Width = 1168
  Height = 615
  OnCreate = UniFrameCreate
  Color = clWhite
  Font.Height = -12
  TabOrder = 0
  ParentColor = False
  ParentFont = False
  ParentBackground = False
  object UniDBEdit1: TUniDBEdit
    Left = 176
    Top = 80
    Width = 225
    Height = 22
    Hint = ''
    DataField = 'employee_lastname'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 0
    Color = clInfoBk
    ReadOnly = True
  end
  object UniLabel1: TUniLabel
    Left = 80
    Top = 86
    Width = 52
    Height = 14
    Hint = ''
    Caption = 'Lastname'
    TabOrder = 1
  end
  object UniDBEdit2: TUniDBEdit
    Left = 176
    Top = 120
    Width = 225
    Height = 22
    Hint = ''
    DataField = 'employee_firstname'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 2
    Color = clInfoBk
    ReadOnly = True
  end
  object UniLabel2: TUniLabel
    Left = 80
    Top = 126
    Width = 52
    Height = 14
    Hint = ''
    Caption = 'Firstname'
    TabOrder = 3
  end
  object UniDBEdit3: TUniDBEdit
    Left = 176
    Top = 160
    Width = 225
    Height = 22
    Hint = ''
    DataField = 'employee_middlename'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 4
    Color = clInfoBk
    ReadOnly = True
  end
  object UniLabel3: TUniLabel
    Left = 80
    Top = 166
    Width = 34
    Height = 14
    Hint = ''
    Caption = 'Middle'
    TabOrder = 5
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
    TabOrder = 6
  end
  object UniLabel4: TUniLabel
    Left = 80
    Top = 46
    Width = 95
    Height = 14
    Hint = ''
    Caption = 'Employee name'
    ParentFont = False
    Font.Height = -12
    Font.Style = [fsBold]
    TabOrder = 7
  end
  object UniLabel5: TUniLabel
    Left = 80
    Top = 270
    Width = 50
    Height = 14
    Hint = ''
    Caption = 'Birthdate'
    TabOrder = 8
  end
  object UniLabel6: TUniLabel
    Left = 80
    Top = 310
    Width = 72
    Height = 14
    Hint = ''
    Caption = 'Place of birth'
    TabOrder = 9
  end
  object UniLabel7: TUniLabel
    Left = 80
    Top = 390
    Width = 40
    Height = 14
    Hint = ''
    Caption = 'Gender'
    TabOrder = 10
  end
  object UniSimplePanel1: TUniSimplePanel
    Left = 80
    Top = 244
    Width = 321
    Height = 1
    Hint = ''
    ParentColor = False
    Color = 14737632
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    TabOrder = 11
  end
  object UniLabel8: TUniLabel
    Left = 80
    Top = 230
    Width = 80
    Height = 14
    Hint = ''
    Caption = 'Personal info'
    ParentFont = False
    Font.Height = -12
    Font.Style = [fsBold]
    TabOrder = 12
  end
  object UniLabel9: TUniLabel
    Left = 80
    Top = 430
    Width = 41
    Height = 14
    Hint = ''
    Caption = 'Religion'
    TabOrder = 13
  end
  object UniLabel10: TUniLabel
    Left = 80
    Top = 470
    Width = 56
    Height = 14
    Hint = ''
    Caption = 'Civil status'
    TabOrder = 14
  end
  object UniLabel11: TUniLabel
    Left = 80
    Top = 510
    Width = 74
    Height = 14
    Hint = ''
    Caption = 'Marriage date'
    TabOrder = 15
  end
  object UniDBDateTimePicker1: TUniDBDateTimePicker
    Left = 176
    Top = 264
    Width = 120
    Hint = ''
    DataField = 'birth_date'
    DataSource = dmEmployee.dsEmployee
    DateTime = 43199.000000000000000000
    DateFormat = 'mm/dd/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 16
  end
  object UniDBLookupComboBox1: TUniDBLookupComboBox
    Left = 176
    Top = 384
    Width = 120
    Hint = ''
    ListField = 'display'
    ListSource = dmEmployee.dscGender
    KeyField = 'value'
    ListFieldIndex = 0
    DataField = 'gender'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 17
    Color = clWindow
  end
  object UniDBMemo1: TUniDBMemo
    Left = 176
    Top = 304
    Width = 225
    Height = 62
    Hint = ''
    DataField = 'birth_place'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 18
  end
  object UniDBLookupComboBox2: TUniDBLookupComboBox
    Left = 176
    Top = 424
    Width = 225
    Hint = ''
    ListField = 'religion_name'
    ListSource = dmEmployee.dsReligion
    KeyField = 'religion_id'
    ListFieldIndex = 0
    DataField = 'religion_id'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 19
    Color = clWindow
  end
  object UniDBLookupComboBox3: TUniDBLookupComboBox
    Left = 176
    Top = 464
    Width = 225
    Hint = ''
    ListField = 'display'
    ListSource = dmEmployee.dsCivilStatus
    KeyField = 'value'
    ListFieldIndex = 0
    DataField = 'civil_status'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 20
    Color = clWindow
  end
  object UniDBDateTimePicker2: TUniDBDateTimePicker
    Left = 176
    Top = 504
    Width = 120
    Hint = ''
    DataField = 'marriage_date'
    DataSource = dmEmployee.dsEmployee
    DateTime = 43199.000000000000000000
    DateFormat = 'mm/dd/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 21
  end
  object UniDBEdit4: TUniDBEdit
    Left = 592
    Top = 80
    Width = 120
    Height = 22
    Hint = ''
    DataField = 'height'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 22
  end
  object UniLabel12: TUniLabel
    Left = 496
    Top = 86
    Width = 36
    Height = 14
    Hint = ''
    Caption = 'Height'
    TabOrder = 23
  end
  object UniDBEdit5: TUniDBEdit
    Left = 592
    Top = 120
    Width = 120
    Height = 22
    Hint = ''
    DataField = 'weight'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 24
  end
  object UniLabel13: TUniLabel
    Left = 496
    Top = 126
    Width = 40
    Height = 14
    Hint = ''
    Caption = 'Weight'
    TabOrder = 25
  end
  object UniLabel14: TUniLabel
    Left = 496
    Top = 166
    Width = 59
    Height = 14
    Hint = ''
    Caption = 'Blood type'
    TabOrder = 26
  end
  object UniSimplePanel2: TUniSimplePanel
    Left = 496
    Top = 60
    Width = 321
    Height = 1
    Hint = ''
    ParentColor = False
    Color = 14737632
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    TabOrder = 27
  end
  object UniLabel15: TUniLabel
    Left = 496
    Top = 46
    Width = 102
    Height = 14
    Hint = ''
    Caption = 'Biographical info'
    ParentFont = False
    Font.Height = -12
    Font.Style = [fsBold]
    TabOrder = 28
  end
  object UniDBEdit7: TUniDBEdit
    Left = 592
    Top = 264
    Width = 225
    Height = 22
    Hint = ''
    DataField = 'tin'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 29
  end
  object UniLabel16: TUniLabel
    Left = 496
    Top = 270
    Width = 20
    Height = 14
    Hint = ''
    Caption = 'TIN'
    TabOrder = 30
  end
  object UniDBEdit8: TUniDBEdit
    Left = 592
    Top = 304
    Width = 225
    Height = 22
    Hint = ''
    DataField = 'sss'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 31
  end
  object UniLabel17: TUniLabel
    Left = 496
    Top = 310
    Width = 21
    Height = 14
    Hint = ''
    Caption = 'SSS'
    TabOrder = 32
  end
  object UniDBEdit9: TUniDBEdit
    Left = 592
    Top = 344
    Width = 225
    Height = 22
    Hint = ''
    DataField = 'hdmf'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 33
  end
  object UniLabel18: TUniLabel
    Left = 496
    Top = 350
    Width = 31
    Height = 14
    Hint = ''
    Caption = 'HDMF'
    TabOrder = 34
  end
  object UniSimplePanel3: TUniSimplePanel
    Left = 496
    Top = 244
    Width = 321
    Height = 1
    Hint = ''
    ParentColor = False
    Color = 14737632
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    TabOrder = 35
  end
  object UniLabel19: TUniLabel
    Left = 496
    Top = 230
    Width = 119
    Height = 14
    Hint = ''
    Caption = 'Identification cards'
    ParentFont = False
    Font.Height = -12
    Font.Style = [fsBold]
    TabOrder = 36
  end
  object UniDBEdit10: TUniDBEdit
    Left = 592
    Top = 384
    Width = 225
    Height = 22
    Hint = ''
    DataField = 'phic'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 37
  end
  object UniLabel20: TUniLabel
    Left = 496
    Top = 390
    Width = 26
    Height = 14
    Hint = ''
    Caption = 'PHIC'
    TabOrder = 38
  end
  object UniDBEdit11: TUniDBEdit
    Left = 592
    Top = 424
    Width = 225
    Height = 22
    Hint = ''
    DataField = 'drivers_license'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 39
  end
  object UniLabel21: TUniLabel
    Left = 496
    Top = 430
    Width = 79
    Height = 14
    Hint = ''
    Caption = 'Driver'#39's license'
    TabOrder = 40
  end
  object UniDBLookupComboBox4: TUniDBLookupComboBox
    Left = 592
    Top = 160
    Width = 120
    Hint = ''
    ListField = 'display'
    ListSource = dmEmployee.dsBloodType
    KeyField = 'value'
    ListFieldIndex = 0
    DataField = 'blood_type'
    DataSource = dmEmployee.dsEmployee
    TabOrder = 41
    Color = clWindow
  end
  object lblAge: TUniLabel
    Left = 328
    Top = 270
    Width = 37
    Height = 14
    Hint = ''
    Caption = 'Age: 0'
    ParentFont = False
    Font.Color = clMaroon
    Font.Height = -12
    Font.Style = [fsItalic]
    TabOrder = 42
  end
  object lblHeight: TUniLabel
    Left = 736
    Top = 86
    Width = 4
    Height = 14
    Hint = ''
    Caption = ''
    ParentFont = False
    Font.Color = clMaroon
    Font.Height = -12
    Font.Style = [fsItalic]
    TabOrder = 43
  end
  object lblWeight: TUniLabel
    Left = 736
    Top = 126
    Width = 4
    Height = 14
    Hint = ''
    Caption = ''
    ParentFont = False
    Font.Color = clMaroon
    Font.Height = -12
    Font.Style = [fsItalic]
    TabOrder = 44
  end
end
