object FamilyAndRelativesFrame: TFamilyAndRelativesFrame
  Left = 0
  Top = 0
  Width = 927
  Height = 511
  OnCreate = UniFrameCreate
  Color = clWindow
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  Font.Height = -12
  TabOrder = 0
  ParentColor = False
  ParentFont = False
  ParentBackground = False
  ExplicitWidth = 451
  ExplicitHeight = 305
  DesignSize = (
    927
    511)
  object DetailPanel: TUniSimplePanel
    Left = 612
    Top = 0
    Width = 315
    Height = 511
    Hint = ''
    ParentColor = False
    Color = 16250871
    Align = alRight
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitLeft = 560
    ExplicitHeight = 491
    object UniDBEdit1: TUniDBEdit
      Left = 32
      Top = 48
      Width = 249
      Height = 22
      Hint = ''
      DataField = 'ef_lastname'
      DataSource = dmEmployee.dscFamily
      ParentFont = False
      Font.Height = -12
      TabOrder = 1
      Color = clInfoBk
      ReadOnly = True
    end
    object UniLabel1: TUniLabel
      Left = 32
      Top = 30
      Width = 52
      Height = 14
      Hint = ''
      Caption = 'Lastname'
      ParentFont = False
      Font.Height = -12
      TabOrder = 2
    end
    object UniDBEdit2: TUniDBEdit
      Left = 32
      Top = 104
      Width = 249
      Height = 22
      Hint = ''
      DataField = 'ef_firstname'
      DataSource = dmEmployee.dscFamily
      ParentFont = False
      Font.Height = -12
      TabOrder = 3
      Color = clInfoBk
      ReadOnly = True
    end
    object UniLabel2: TUniLabel
      Left = 32
      Top = 86
      Width = 52
      Height = 14
      Hint = ''
      Caption = 'Firstname'
      ParentFont = False
      Font.Height = -12
      TabOrder = 4
    end
    object UniDBEdit3: TUniDBEdit
      Left = 32
      Top = 160
      Width = 249
      Height = 22
      Hint = ''
      DataField = 'ef_middlename'
      DataSource = dmEmployee.dscFamily
      ParentFont = False
      Font.Height = -12
      TabOrder = 5
      Color = clInfoBk
      ReadOnly = True
    end
    object UniLabel3: TUniLabel
      Left = 32
      Top = 142
      Width = 34
      Height = 14
      Hint = ''
      Caption = 'Middle'
      ParentFont = False
      Font.Height = -12
      TabOrder = 6
    end
    object UniLabel7: TUniLabel
      Left = 32
      Top = 198
      Width = 43
      Height = 14
      Hint = ''
      Caption = 'Relation'
      ParentFont = False
      Font.Height = -12
      TabOrder = 7
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 32
      Top = 216
      Width = 249
      Hint = ''
      ListField = 'relation_name'
      ListSource = dmEmployee.dscRelation
      KeyField = 'relation_id'
      ListFieldIndex = 0
      DataField = 'relation_id'
      DataSource = dmEmployee.dscFamily
      ParentFont = False
      Font.Height = -12
      TabOrder = 8
      Color = clWindow
    end
    object UniLabel5: TUniLabel
      Left = 32
      Top = 254
      Width = 50
      Height = 14
      Hint = ''
      Caption = 'Birthdate'
      ParentFont = False
      Font.Height = -12
      TabOrder = 9
    end
    object UniDBDateTimePicker1: TUniDBDateTimePicker
      Left = 32
      Top = 272
      Width = 120
      Hint = ''
      DataField = 'ef_birth_date'
      DataSource = dmEmployee.dscFamily
      DateTime = 43199.000000000000000000
      DateFormat = 'mm/dd/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 10
      ParentFont = False
      Font.Height = -12
    end
    object UniLabel4: TUniLabel
      Left = 32
      Top = 310
      Width = 62
      Height = 14
      Hint = ''
      Caption = 'Occupation'
      ParentFont = False
      Font.Height = -12
      TabOrder = 11
    end
    object UniDBLookupComboBox2: TUniDBLookupComboBox
      Left = 32
      Top = 328
      Width = 249
      Hint = ''
      ListField = 'occupation_name'
      ListSource = dmEmployee.dscOccupation
      KeyField = 'occupation_id'
      ListFieldIndex = 0
      DataField = 'occupation_id'
      DataSource = dmEmployee.dscFamily
      ParentFont = False
      Font.Height = -12
      TabOrder = 12
      Color = clWindow
    end
    object UniDBCheckBox1: TUniDBCheckBox
      Left = 32
      Top = 368
      Width = 97
      Height = 17
      Hint = ''
      DataField = 'is_dependent'
      DataSource = dmEmployee.dscFamily
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Dependent'
      ParentFont = False
      Font.Height = -12
      TabOrder = 13
    end
    object UniDBCheckBox2: TUniDBCheckBox
      Left = 32
      Top = 400
      Width = 97
      Height = 17
      Hint = ''
      DataField = 'is_deceased'
      DataSource = dmEmployee.dscFamily
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Deceased'
      ParentFont = False
      Font.Height = -12
      TabOrder = 14
    end
  end
  object ListGrid: TUniDBGrid
    Left = 2
    Top = 2
    Width = 609
    Height = 507
    Hint = ''
    DataSource = dmEmployee.dscFamily
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
    ReadOnly = True
    LoadMask.Message = 'Loading data...'
    EmptyText = 'No record found.'
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'ef_lastname'
        Title.Alignment = taCenter
        Title.Caption = 'Lastname'
        Title.Font.Style = [fsBold]
        Width = 200
        Font.Height = -12
      end
      item
        FieldName = 'ef_firstname'
        Title.Alignment = taCenter
        Title.Caption = 'Firstname'
        Title.Font.Style = [fsBold]
        Width = 200
        Font.Height = -12
      end
      item
        FieldName = 'ef_middlename'
        Title.Alignment = taCenter
        Title.Caption = 'Middle'
        Title.Font.Style = [fsBold]
        Width = 200
        Font.Height = -12
      end>
  end
end
