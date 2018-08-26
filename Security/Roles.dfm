inherited frmRoles: TfrmRoles
  Caption = 'frmRoles'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 55
      Caption = 'Roles list'
      ExplicitWidth = 55
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmSecurity.dscRole
      OnDblClick = grListDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ROLE_CODE'
          Title.Alignment = taCenter
          Title.Caption = 'Code'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ROLE_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
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
          FieldName = 'ROLE_DESCRIPTION'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 400
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    object Label2: TLabel [0]
      Left = 13
      Top = 23
      Width = 28
      Height = 14
      Caption = 'Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [1]
      Left = 13
      Top = 71
      Width = 31
      Height = 14
      Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel [2]
      Left = 13
      Top = 119
      Width = 60
      Height = 14
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object urlRoles: TRzURLLabel [3]
      Left = 13
      Top = 213
      Width = 82
      Height = 14
      Caption = 'Assigned rights'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlRolesClick
    end
    object edCode: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 43
      Width = 249
      Height = 22
      DataSource = dmSecurity.dscRole
      DataField = 'ROLE_CODE'
      CharCase = ecUpperCase
      Color = clWhite
      DisabledColor = 15794175
      FrameColor = 12961221
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = clWhite
      TabOnEnter = True
      TabOrder = 1
    end
    object edName: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 91
      Width = 249
      Height = 22
      DataSource = dmSecurity.dscRole
      DataField = 'ROLE_NAME'
      Color = clWhite
      DisabledColor = 15794175
      FrameColor = 12961221
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      TabOnEnter = True
      TabOrder = 3
    end
    object mmDescription: TRzDBMemo
      Tag = 1
      Left = 13
      Top = 139
      Width = 249
      Height = 55
      DataField = 'ROLE_DESCRIPTION'
      DataSource = dmSecurity.dscRole
      TabOrder = 2
      FrameColor = 12961221
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
    end
  end
end
