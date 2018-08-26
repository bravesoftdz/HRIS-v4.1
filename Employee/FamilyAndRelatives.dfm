inherited frmFamilyAndRelatives: TfrmFamilyAndRelatives
  Align = alClient
  Caption = 'frmFamilyAndRelatives'
  ClientHeight = 460
  ClientWidth = 960
  OnCreate = FormCreate
  ExplicitWidth = 976
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 14
  object pnlDetail: TRzPanel
    Left = 677
    Top = 0
    Width = 283
    Height = 460
    Align = alRight
    Anchors = [akLeft, akTop, akBottom]
    BorderOuter = fsNone
    BorderSides = [sdLeft]
    BorderColor = 13816530
    BorderWidth = 1
    Color = clMenu
    TabOrder = 0
    DesignSize = (
      283
      460)
    object JvLabel1: TJvLabel
      Left = 27
      Top = 24
      Width = 54
      Height = 14
      Caption = 'Lastname'
      Transparent = True
    end
    object JvLabel2: TJvLabel
      Left = 27
      Top = 76
      Width = 54
      Height = 14
      Caption = 'Firstname'
      Transparent = True
    end
    object JvLabel3: TJvLabel
      Left = 27
      Top = 128
      Width = 66
      Height = 14
      Caption = 'Middlename'
      Transparent = True
    end
    object JvLabel8: TJvLabel
      Left = 27
      Top = 178
      Width = 45
      Height = 14
      Caption = 'Relation'
      Transparent = True
    end
    object JvLabel10: TJvLabel
      Left = 27
      Top = 228
      Width = 52
      Height = 14
      Caption = 'Birthdate'
      Transparent = True
    end
    object JvLabel4: TJvLabel
      Left = 27
      Top = 278
      Width = 64
      Height = 14
      Caption = 'Occupation'
      Transparent = True
    end
    object edLastname: TRzDBEdit
      Left = 27
      Top = 42
      Width = 224
      Height = 22
      DataSource = dmEmployee.dscFamily
      DataField = 'ef_lastname'
      Ctl3D = True
      FrameColor = 13816530
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ParentCtl3D = False
      ReadOnlyColor = clWhite
      TabOnEnter = True
      TabOrder = 0
    end
    object edFirstname: TRzDBEdit
      Left = 27
      Top = 94
      Width = 224
      Height = 22
      DataSource = dmEmployee.dscFamily
      DataField = 'ef_firstname'
      FrameColor = 13816530
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = clWhite
      TabOnEnter = True
      TabOrder = 1
    end
    object edMiddlename: TRzDBEdit
      Left = 27
      Top = 146
      Width = 224
      Height = 22
      DataSource = dmEmployee.dscFamily
      DataField = 'ef_middlename'
      FrameColor = 13816530
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = clWhite
      TabOnEnter = True
      TabOrder = 2
    end
    object RzDBDateTimeEdit2: TRzDBDateTimeEdit
      Left = 27
      Top = 247
      Width = 121
      Height = 22
      DataSource = dmEmployee.dscFamily
      DataField = 'ef_birth_date'
      FrameColor = 13816530
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 4
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FlatButtons = True
    end
    object RzDBLookupComboBox1: TRzDBLookupComboBox
      Left = 27
      Top = 196
      Width = 224
      Height = 22
      DataField = 'relation_id'
      DataSource = dmEmployee.dscFamily
      KeyField = 'relation_id'
      ListField = 'relation_name'
      ListSource = dmEmployee.dscRelation
      TabOrder = 3
      FlatButtons = True
      FrameColor = 13816530
      FrameVisible = True
      FramingPreference = fpCustomFraming
    end
    object RzDBLookupComboBox2: TRzDBLookupComboBox
      Left = 27
      Top = 296
      Width = 224
      Height = 22
      DataField = 'occupation_id'
      DataSource = dmEmployee.dscFamily
      KeyField = 'occupation_id'
      ListField = 'occupation_name'
      ListSource = dmEmployee.dscOccupation
      TabOrder = 5
      FlatButtons = True
      FrameColor = 13816530
      FrameVisible = True
      FramingPreference = fpCustomFraming
    end
    object RzDBCheckBox1: TRzDBCheckBox
      Left = 27
      Top = 329
      Width = 81
      Height = 16
      DataField = 'is_dependent'
      DataSource = dmEmployee.dscFamily
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Dependent'
      TabOrder = 6
    end
    object RzDBCheckBox2: TRzDBCheckBox
      Left = 27
      Top = 355
      Width = 72
      Height = 16
      DataField = 'is_deceased'
      DataSource = dmEmployee.dscFamily
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Deceased'
      TabOrder = 7
    end
    object pnlNew: TRzPanel
      Left = 16
      Top = 426
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 13816530
      BorderWidth = 1
      Color = clMenu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object btnNew: TRzShapeButton
        Left = 2
        Top = 0
        Width = 47
        Height = 22
        Hint = 'New'
        BorderStyle = bsNone
        Caption = 'New'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnNewClick
      end
    end
    object pnlCancel: TRzPanel
      Left = 74
      Top = 426
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 13816530
      BorderWidth = 1
      Color = clMenu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      object btnCancel: TRzShapeButton
        Left = 0
        Top = 0
        Width = 49
        Height = 22
        Hint = 'Cancel changes'
        BorderStyle = bsNone
        Caption = 'Cancel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnCancelClick
      end
    end
  end
  object grSearch: TRzDBGrid
    Left = 0
    Top = 0
    Width = 677
    Height = 460
    Align = alClient
    BorderStyle = bsNone
    Ctl3D = True
    DataSource = dmEmployee.dscFamily
    FixedColor = clMenu
    GradientEndColor = 12955288
    GradientStartColor = 12955288
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    FrameStyle = fsNone
    FrameVisible = True
    FramingPreference = fpCustomFraming
    FixedLineColor = clMenu
    AltRowShadingColor = clBtnFace
    Columns = <
      item
        Expanded = False
        FieldName = 'ef_lastname'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ef_firstname'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ef_middlename'
        Title.Alignment = taCenter
        Title.Caption = 'Middle'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 210
        Visible = True
      end>
  end
end
