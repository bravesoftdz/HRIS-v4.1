inherited frmLogin: TfrmLogin
  BorderIcons = [biSystemMenu]
  Caption = ''
  ClientHeight = 243
  ClientWidth = 434
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 434
  ExplicitHeight = 243
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 434
    OnMouseDown = pnlTitleMouseDown
    ExplicitWidth = 434
    inherited imgClose: TImage
      Left = 412
      ExplicitLeft = 410
    end
    inherited lblCaption: TRzLabel
      Width = 63
      Caption = 'Kiosk Login'
      ExplicitWidth = 63
    end
    object lblVersion: TLabel
      Left = 77
      Top = 4
      Width = 34
      Height = 13
      Caption = 'V1.0.0'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
  end
  inherited pnlMain: TRzPanel
    Width = 434
    Height = 222
    ExplicitWidth = 434
    ExplicitHeight = 222
    object Label4: TLabel
      Left = 174
      Top = 21
      Width = 125
      Height = 42
      Alignment = taCenter
      Caption = 'K i o s k'
      Color = 10196313
      Font.Charset = ANSI_CHARSET
      Font.Color = 6572079
      Font.Height = -35
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 176
      Top = 62
      Width = 120
      Height = 14
      Caption = 'Employee Self-Service'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 6572079
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object Label1: TLabel
      Left = 114
      Top = 100
      Width = 54
      Height = 14
      Anchors = [akLeft, akBottom]
      Caption = 'Username'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 114
      Top = 128
      Width = 51
      Height = 14
      Anchors = [akLeft, akBottom]
      Caption = 'Password'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbErrorMessage: TLabel
      Left = 14
      Top = 200
      Width = 69
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Error Message'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
      ExplicitTop = 164
    end
    object prbStatus: TRzProgressBar
      Left = 14
      Top = 206
      Width = 406
      Height = 6
      Anchors = [akLeft, akBottom]
      BarColor = 6008319
      BarColorStop = 6008319
      BarStyle = bsGradient
      BorderOuter = fsFlat
      BorderWidth = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6008319
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      InteriorOffset = 0
      ParentFont = False
      PartsComplete = 0
      Percent = 0
      ShowPercent = False
      ThemeAware = False
      TotalParts = 0
      Visible = False
      ExplicitTop = 170
    end
    object lblStatus: TLabel
      Left = 14
      Top = 187
      Width = 3
      Height = 13
      Anchors = [akLeft, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 197
    end
    object Image1: TImage
      Left = 118
      Top = 27
      Width = 48
      Height = 48
      AutoSize = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
        003008060000005702F987000004B54944415478DAD5997B5054651C86DF5D04
        0AC162478905014B0A31B3248B7028B9DFEFB7A268F21F07B154C06B49381216
        DEB848898CFFD8344271BFDF6F5648946199499B5802C2123A4BC94201C27618
        3A1FFB39B1BA2BEB57CFCC0EFCF69DE5BC0FB37BF67CDF11E07F8E80FF253B3B
        7B03F723867B3CCFBAD41DF89A7B644547479F22025CF944B158BCDFDEDE1E26
        2626AC0BAA64707010EDEDED904AA5FB3889245E401A1919696A646484D1D151
        4C4C4CB0EEF9AFE8EAEAC2C0C000C3C3C3C8CDCD1DE004C4BC802222220242A1
        10535353AC7BAA84EF989797074E4040092893F7D5057CFC4507BEEBEE675AF8
        192B33BCF1A21D225E584DF7BB5D203C3C9C8469D55F22EB521FC4AFF862A1B5
        05538191AE5E483FAD44CC4A73C4793B92E7F3F3F36981B0B03012DA25646261
        C826E88A4C307973088A5B6C3E138205BAD059648C09D920468A4EA023790BC9
        0A0A0AE616B0D89A8265AFC7727F410828187F26FEE970F59374F41EDB33B740
        686828092DB71D84D5AB5BD43F9816E9CEC9444FC66E32171616D20221212124
        B48A3D04CB97635877A6E8F92C0BDDE9BBC85C5454A45AC0226C23EBCE14BD05
        27550B040707937059DC612C0DDAC0BA33C5B59253B89AB693CCC5C5C5B44050
        5010091F8D3F0273BFD75877A6E8AB388D5F537790B9A4A48416080C0C24E163
        DB8F42EC19A1FE51B488B4360FBF1CDD4EE6D2D2525A2020208084CB77A4C2D4
        3558FDA3689181C6625C39124FE6B2B2325AC0DFDF9F84D63BD3F0C87A5FD69D
        297E3B5389AEC371642E2F2FA705FCFCFC48F8F8AE742C59E7C1BA33C5F5B375
        B87C2896CC151515B480AFEFEC7FFC89DD1958FC9C13EBCE1437BE69C1CF07B7
        91B9B2B252B58068CD3AD69D2964E7CFAA16F0F1F121A1CD9E63305EB5967567
        8AA18BE72049D94AE6AAAA2A5AC0DBDB9B842BDECEC4C3364FB3EE4CF1BBE47B
        FCF4C1ECF5597575352DE0E5E54542DB773EC4A2E5B6AC3B53DCBCD289CEF7DF
        22734D4D0D2DE0E9E949C2957B3F8291A535EBCE14C33D5DB874E04D32D7D6D6
        D2021E1EB3A7CD27138EC3D0CC8A75670A797F377E4CDE4CE6BABA3A5AC0DDDD
        9D84ABDECD82818919EBCE14A383FDB8F8DEEC257E7D7D3D2DE0E6E646C2A712
        4FE041D112D69D29FE945DC70F499BC8DCD0D0A05AE081878C5977A6F8EB8F21
        D502AEAEAE245CBD2F1BFA8646AC3B538CC98771617F34991B1B1B6901171717
        12BAA79EC6D0F814040281FA47D2020A8502C67A42D4C7CFAE519A9A9AE61638
        F9F9791C6FF9163A3A0B984B4C979F9CBC85CD4ECF62E34B6BE616707676A65E
        987DA603F9E73A71433ECA5460B1A101C2D7DA227ABD1DF57C7373332DE0E4E4
        C4B4A8BAB4B4B45002D71C1C1CCCF5F5F559F7BA2BC6C6C6D0D6D6D6C7092CE5
        05F68A44A2641B1B1BE8E9E9B1EEA792F1F171482412C864B2044EE080F21D9A
        44CCDCA131655DF20E0C60E60E4DD2F4704FA798DBF7933481DFDFD1F4F5F72C
        A0BC9BA109FCEE023301E5CD004DE017E7CC049497A29AC02F0D990928AFE434
        815F593113505E4768027F5DCF4C40F92A5613F8AB4AAD0BDCC7EF891ECC9CE7
        53E65B401A1515653A7DA3599BC8E572E4E4E4F4700277B5285747E0B2A3A3A3
        B5B605464646D0DADA2AE10456CCB7C0F4DEF6F45B48DBFB2D12CCBC8532E655
        E0BFCADF94B42C4F5D6654B30000000049454E44AE426082}
    end
    object edUsername: TRzEdit
      Left = 178
      Top = 95
      Width = 121
      Height = 22
      Text = ''
      Anchors = [akLeft, akBottom]
      CharCase = ecUpperCase
      DisabledColor = 14932430
      FrameColor = 14205355
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOnEnter = True
      TabOrder = 0
      OnChange = edUsernameChange
    end
    object edPassword: TRzEdit
      Left = 178
      Top = 123
      Width = 121
      Height = 22
      Text = ''
      Anchors = [akLeft, akBottom]
      DisabledColor = 14932430
      FrameColor = 14205355
      FrameVisible = True
      FramingPreference = fpCustomFraming
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = edPasswordKeyPress
    end
    object pnlClose: TRzPanel
      Left = 219
      Top = 164
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
      TabOrder = 2
      object btnCancel: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        BorderStyle = bsNone
        Caption = 'Close'
        OnClick = btnCloseClick
      end
    end
    object pnlLogin: TRzPanel
      Left = 163
      Top = 164
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
      TabOrder = 3
      object btnLogin: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        BorderStyle = bsNone
        Caption = 'Login'
        OnClick = btnLoginClick
      end
    end
  end
end
