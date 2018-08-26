inherited frmPafListPending: TfrmPafListPending
  Caption = 'frmPafListPending'
  ClientHeight = 432
  ClientWidth = 946
  OnCreate = FormCreate
  ExplicitWidth = 962
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 946
    ExplicitWidth = 946
    inherited lblTitle: TRzLabel
      Width = 77
      Caption = 'Pending PAF'
      ExplicitWidth = 77
    end
  end
  object grList: TRzDBGrid
    Left = 0
    Top = 28
    Width = 946
    Height = 404
    Align = alClient
    BorderStyle = bsNone
    Ctl3D = True
    DataSource = dmApplication.dscPendingPAF
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
    OnDblClick = grListDblClick
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
        FieldName = 'effective_until'
        Title.Caption = 'Effective until'
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
        FieldName = 'id_num'
        Title.Alignment = taCenter
        Title.Caption = 'ID No.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Alignment = taCenter
        Title.Caption = 'Employee'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 220
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
        Width = 150
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
        Width = 100
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
        Width = 150
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
        Width = 80
        Visible = True
      end>
  end
end
