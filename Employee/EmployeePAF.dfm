inherited frmEmployeePAF: TfrmEmployeePAF
  Align = alClient
  Caption = 'frmEmployeePAF'
  ClientHeight = 369
  ClientWidth = 854
  ExplicitWidth = 870
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 14
  object grSearch: TRzDBGrid
    Left = 0
    Top = 0
    Width = 854
    Height = 369
    Align = alClient
    BorderStyle = bsNone
    Ctl3D = True
    DataSource = dmEmployee.dscPAF
    FixedColor = clMenu
    GradientEndColor = 12955288
    GradientStartColor = 12955288
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = grSearchDblClick
    FrameStyle = fsNone
    FrameVisible = True
    FramingPreference = fpCustomFraming
    FixedLineColor = clMenu
    AltRowShadingColor = clBtnFace
    Columns = <
      item
        Expanded = False
        FieldName = 'effective_date'
        Title.Alignment = taCenter
        Title.Caption = 'Effective date'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'position_name'
        Title.Alignment = taCenter
        Title.Caption = 'Position'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'posstatus_name'
        Title.Alignment = taCenter
        Title.Caption = 'Status'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'location_name'
        Title.Alignment = taCenter
        Title.Caption = 'Branch'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'salary'
        Title.Alignment = taCenter
        Title.Caption = 'Salary'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end>
  end
end
