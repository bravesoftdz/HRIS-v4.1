inherited frmTimelogDetails: TfrmTimelogDetails
  Caption = 'frmTimelogDetails'
  ClientHeight = 352
  ClientWidth = 612
  OnCreate = FormCreate
  ExplicitWidth = 612
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 612
    ParentFont = False
    ExplicitWidth = 612
    inherited imgClose: TImage
      Left = 591
      ExplicitLeft = 637
    end
    inherited lblCaption: TRzLabel
      Width = 86
      Caption = 'Timelog details'
      ExplicitWidth = 86
    end
  end
  inherited pnlMain: TRzPanel
    Width = 612
    Height = 331
    ParentFont = False
    ExplicitWidth = 612
    ExplicitHeight = 331
    object lblDate: TRzLabel
      Left = 19
      Top = 23
      Width = 245
      Height = 14
      Caption = 'Log details for January 20, 2017 Friday.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHolidayWarning: TRzLabel
      Left = 19
      Top = 304
      Width = 202
      Height = 14
      Anchors = [akLeft, akBottom]
      Caption = 'Note: This date is declared a holiday.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 215
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 311
    end
    object pnlOfficelog: TRzPanel
      Tag = 1
      Left = 19
      Top = 50
      Width = 571
      Height = 18
      Anchors = [akLeft, akTop, akRight]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
      TabOrder = 0
      object RzLabel6: TRzLabel
        Left = 19
        Top = 28
        Width = 85
        Height = 14
        Caption = 'Morning (AM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel7: TRzLabel
        Left = 29
        Top = 56
        Width = 48
        Height = 14
        Caption = 'Time-in:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel8: TRzLabel
        Left = 29
        Top = 76
        Width = 59
        Height = 14
        Caption = 'Time-out:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblInAm: TRzLabel
        Left = 101
        Top = 56
        Width = 32
        Height = 14
        Caption = '08:30'
      end
      object lblOutAM: TRzLabel
        Left = 101
        Top = 76
        Width = 32
        Height = 14
        Caption = '12:00'
      end
      object RzLabel9: TRzLabel
        Left = 19
        Top = 111
        Width = 97
        Height = 14
        Caption = 'Afternoon (PM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel10: TRzLabel
        Left = 29
        Top = 139
        Width = 48
        Height = 14
        Caption = 'Time-in:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel11: TRzLabel
        Left = 29
        Top = 159
        Width = 59
        Height = 14
        Caption = 'Time-out:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOutPM: TRzLabel
        Left = 101
        Top = 159
        Width = 32
        Height = 14
        Caption = '05:30'
      end
      object lblInPM: TRzLabel
        Left = 101
        Top = 139
        Width = 32
        Height = 14
        Caption = '01:00'
      end
      object RzLabel15: TRzLabel
        Left = 187
        Top = 28
        Width = 51
        Height = 14
        Caption = 'Override'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOvInAm: TRzLabel
        Left = 187
        Top = 56
        Width = 4
        Height = 14
        Caption = '-'
      end
      object lblOvOutAM: TRzLabel
        Left = 187
        Top = 76
        Width = 4
        Height = 14
        Caption = '-'
      end
      object lblOvInPm: TRzLabel
        Left = 187
        Top = 139
        Width = 4
        Height = 14
        Caption = '-'
      end
      object lblOvOutPm: TRzLabel
        Left = 187
        Top = 159
        Width = 4
        Height = 14
        Caption = '-'
      end
      object lblOvAmReason: TRzLabel
        Left = 267
        Top = 56
        Width = 238
        Height = 34
        AutoSize = False
      end
      object lblOvPmReason: TRzLabel
        Left = 267
        Top = 140
        Width = 238
        Height = 34
        AutoSize = False
      end
      object pnlOfficeLogHead: TRzPanel
        Left = 1
        Top = 1
        Width = 569
        Height = 17
        Align = alTop
        BorderOuter = fsNone
        BorderSides = [sdBottom]
        BorderColor = 14205355
        BorderWidth = 1
        Color = 12955288
        GradientColorStyle = gcsCustom
        GradientColorStart = 8675134
        GradientColorStop = 8675134
        TabOrder = 0
        VisualStyle = vsGradient
        OnDblClick = imgOfficelogClick
        DesignSize = (
          569
          17)
        object RzLabel4: TRzLabel
          Tag = -1
          Left = 4
          Top = 1
          Width = 119
          Height = 13
          Caption = 'Office log / Overrides'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          FlatColor = clWhite
        end
        object imgOfficelog: TImage
          Tag = 1
          Left = 551
          Top = 0
          Width = 16
          Height = 16
          Hint = 'Expand'
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C0000021C4944415478DA63FCFFFF3F03
            258031B9F5350323236330107703F98A44E8B90FB4B41488D7CEA91261608CA9
            7B0C12BC571A23AAA8A7CA4E50F7A5DB3F19BA97BCBE0F642A2D6E9461600C28
            BA0E12FFBFB65B8DE1DFBF7F849DCCC8C81052761BCC5CDFABC1C0E89472026C
            C08E69460C7FFEFC2168003333338367F679B0017B679B33309A86EF021B7068
            812DC3AF5FBFE00A7FFFFECDF0F5EB37866FDFBE81C5FFFE8518CECBCBCB1055
            731F6CC0A915AE0C8C5A3E1BC0069C5EE9CAF0F3E74F86DCB68B0C4F5F7D6798
            582CCB008BA1FC9E470C22822C0CB5C9520CECECEC0CC1A5606F335EDDECCFC0
            A8ECBA1A6CC0C5F59E0C1F3F7E6678FF8581C13FE7088398102BC3EC5A0D86D4
            E61B0CAFDEFD66D838C506E8AC8F0C2C2C2C0CDEB9102FDCD915C2C0A8E4B216
            6CC089650E0C1F3E7C01DBFA97918BC127EB30DC3B5BA6D93230FFFF06663331
            3131B8679E061B7077771003A3AAFB56B00107E69903FDFA1BAEE9E73F7606DF
            ACE30C9BA75932B033FD448E0706B78CB360C6AD1D5E0C8CDABE07C106EC9965
            000C28D468E4E3E364F8F4E93B464CB8675E021B7065931D03A37128D83FFFB7
            4FD504A603E292B577EE0DB0016756193030F28B9B33E8B82DBB579726AE68AC
            C94150F3D9EB3F189A66BDBC7F655794D2871727801E626010D6B0E90D97548B
            2C636064962768C2FFBF0F9FDD5ADE7DF348F10A6080BF0519C0054A1FA04446
            94FB21E02F107F061AF08D91D2EC0C00FF44D3E1741FD00E0000000049454E44
            AE426082}
          ShowHint = True
          Transparent = True
          OnClick = imgOfficelogClick
          ExplicitLeft = 498
        end
        object lblExpandOfficeLog: TRzLabel
          Tag = 1
          Left = 554
          Top = 1
          Width = 10
          Height = 14
          Cursor = crHandPoint
          Hint = 'Expand'
          Caption = '+'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Transparent = True
          Visible = False
          OnClick = lblExpandOfficeLogDblClick
          FlatColor = clWhite
        end
      end
    end
    object pnlUndertime: TRzPanel
      Tag = 2
      Left = 19
      Top = 75
      Width = 571
      Height = 18
      Anchors = [akLeft, akTop, akRight]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
      TabOrder = 1
      object RzLabel1: TRzLabel
        Left = 19
        Top = 28
        Width = 85
        Height = 14
        Caption = 'Morning (AM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel12: TRzLabel
        Left = 19
        Top = 111
        Width = 97
        Height = 14
        Caption = 'Afternoon (PM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel13: TRzLabel
        Left = 29
        Top = 49
        Width = 65
        Height = 14
        Caption = 'Time from:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel14: TRzLabel
        Left = 29
        Top = 69
        Width = 64
        Height = 14
        Caption = 'Time until:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUTTimeUntilAM: TRzLabel
        Left = 101
        Top = 69
        Width = 4
        Height = 14
      end
      object lblUTTimeFromAM: TRzLabel
        Left = 101
        Top = 49
        Width = 4
        Height = 14
      end
      object RzLabel17: TRzLabel
        Left = 29
        Top = 132
        Width = 65
        Height = 14
        Caption = 'Time from:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel18: TRzLabel
        Left = 29
        Top = 152
        Width = 64
        Height = 14
        Caption = 'Time until:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUTTimeUntilPM: TRzLabel
        Left = 101
        Top = 152
        Width = 4
        Height = 14
      end
      object lblUTTimeFromPM: TRzLabel
        Left = 101
        Top = 132
        Width = 4
        Height = 14
      end
      object RzLabel3: TRzLabel
        Left = 172
        Top = 49
        Width = 49
        Height = 14
        Caption = 'Reason:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUTTimeReasonAM: TRzLabel
        Left = 227
        Top = 49
        Width = 301
        Height = 54
        AutoSize = False
      end
      object RzLabel16: TRzLabel
        Left = 172
        Top = 132
        Width = 49
        Height = 14
        Caption = 'Reason:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUTTimeReasonPM: TRzLabel
        Left = 228
        Top = 132
        Width = 301
        Height = 54
        AutoSize = False
      end
      object RzLabel22: TRzLabel
        Left = 29
        Top = 89
        Width = 30
        Height = 14
        Caption = 'Paid:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUTAMPaid: TRzLabel
        Left = 69
        Top = 89
        Width = 4
        Height = 14
      end
      object RzLabel26: TRzLabel
        Left = 29
        Top = 172
        Width = 30
        Height = 14
        Caption = 'Paid:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUTPMPaid: TRzLabel
        Left = 69
        Top = 172
        Width = 4
        Height = 14
      end
      object pnlUndertimeHead: TRzPanel
        Left = 1
        Top = 1
        Width = 569
        Height = 17
        Align = alTop
        BorderOuter = fsNone
        BorderSides = [sdBottom]
        BorderColor = 14205355
        BorderWidth = 1
        Color = 12955288
        GradientColorStyle = gcsCustom
        GradientColorStart = 8675134
        GradientColorStop = 8675134
        TabOrder = 0
        VisualStyle = vsGradient
        OnDblClick = imgOfficelogClick
        DesignSize = (
          569
          17)
        object RzLabel2: TRzLabel
          Tag = -1
          Left = 4
          Top = 1
          Width = 60
          Height = 13
          Caption = 'Undertime'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          FlatColor = clWhite
        end
        object imgUndertime: TImage
          Tag = 1
          Left = 551
          Top = 0
          Width = 16
          Height = 16
          Hint = 'Expand'
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C0000021C4944415478DA63FCFFFF3F03
            258031B9F5350323236330107703F98A44E8B90FB4B41488D7CEA91261608CA9
            7B0C12BC571A23AAA8A7CA4E50F7A5DB3F19BA97BCBE0F642A2D6E9461600C28
            BA0E12FFBFB65B8DE1DFBF7F849DCCC8C81052761BCC5CDFABC1C0E89472026C
            C08E69460C7FFEFC2168003333338367F679B0017B679B33309A86EF021B7068
            812DC3AF5FBFE00A7FFFFECDF0F5EB37866FDFBE81C5FFFE8518CECBCBCB1055
            731F6CC0A915AE0C8C5A3E1BC0069C5EE9CAF0F3E74F86DCB68B0C4F5F7D6798
            582CCB008BA1FC9E470C22822C0CB5C9520CECECEC0CC1A5606F335EDDECCFC0
            A8ECBA1A6CC0C5F59E0C1F3F7E6678FF8581C13FE7088398102BC3EC5A0D86D4
            E61B0CAFDEFD66D838C506E8AC8F0C2C2C2C0CDEB9102FDCD915C2C0A8E4B216
            6CC089650E0C1F3E7C01DBFA97918BC127EB30DC3B5BA6D93230FFFF06663331
            3131B8679E061B7077771003A3AAFB56B00107E69903FDFA1BAEE9E73F7606DF
            ACE30C9BA75932B033FD448E0706B78CB360C6AD1D5E0C8CDABE07C106EC9965
            000C28D468E4E3E364F8F4E93B464CB8675E021B7065931D03A37128D83FFFB7
            4FD504A603E292B577EE0DB0016756193030F28B9B33E8B82DBB579726AE68AC
            C94150F3D9EB3F189A66BDBC7F655794D2871727801E626010D6B0E90D97548B
            2C636064962768C2FFBF0F9FDD5ADE7DF348F10A6080BF0519C0054A1FA04446
            94FB21E02F107F061AF08D91D2EC0C00FF44D3E1741FD00E0000000049454E44
            AE426082}
          ShowHint = True
          Transparent = True
          OnClick = imgOfficelogClick
          ExplicitLeft = 498
        end
        object lblExpandUndertime: TRzLabel
          Tag = 1
          Left = 554
          Top = 0
          Width = 10
          Height = 14
          Cursor = crHandPoint
          Hint = 'Expand'
          Caption = '+'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Transparent = True
          Visible = False
          OnClick = lblExpandOfficeLogDblClick
          FlatColor = clWhite
        end
      end
    end
    object pnlLeaves: TRzPanel
      Tag = 3
      Left = 19
      Top = 100
      Width = 571
      Height = 18
      Anchors = [akLeft, akTop, akRight]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14932430
      TabOrder = 2
      object RzLabel19: TRzLabel
        Left = 19
        Top = 28
        Width = 85
        Height = 14
        Caption = 'Morning (AM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel20: TRzLabel
        Left = 29
        Top = 49
        Width = 33
        Height = 14
        Caption = 'Type:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel21: TRzLabel
        Left = 19
        Top = 111
        Width = 97
        Height = 14
        Caption = 'Afternoon (PM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6572079
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLvTypeAM: TRzLabel
        Left = 83
        Top = 49
        Width = 4
        Height = 14
      end
      object RzLabel23: TRzLabel
        Left = 217
        Top = 49
        Width = 56
        Height = 14
        Caption = 'Remarks:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLvRemarksAM: TRzLabel
        Left = 279
        Top = 49
        Width = 270
        Height = 54
        AutoSize = False
        WordWrap = True
      end
      object RzLabel25: TRzLabel
        Left = 29
        Top = 132
        Width = 33
        Height = 14
        Caption = 'Type:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLvTypePM: TRzLabel
        Left = 83
        Top = 132
        Width = 4
        Height = 14
      end
      object RzLabel27: TRzLabel
        Left = 217
        Top = 132
        Width = 56
        Height = 14
        Caption = 'Remarks:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLvRemarksPM: TRzLabel
        Left = 279
        Top = 132
        Width = 270
        Height = 54
        AutoSize = False
        WordWrap = True
      end
      object RzLabel29: TRzLabel
        Left = 29
        Top = 69
        Width = 49
        Height = 14
        Caption = 'Reason:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLvReasonAM: TRzLabel
        Left = 83
        Top = 69
        Width = 4
        Height = 14
      end
      object lblLvReasonPM: TRzLabel
        Left = 83
        Top = 152
        Width = 4
        Height = 14
      end
      object RzLabel24: TRzLabel
        Left = 29
        Top = 152
        Width = 49
        Height = 14
        Caption = 'Reason:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RzLabel28: TRzLabel
        Left = 29
        Top = 89
        Width = 30
        Height = 14
        Caption = 'Paid:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPaidAM: TRzLabel
        Left = 67
        Top = 89
        Width = 4
        Height = 14
      end
      object RzLabel30: TRzLabel
        Left = 29
        Top = 172
        Width = 30
        Height = 14
        Caption = 'Paid:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPaidPM: TRzLabel
        Left = 67
        Top = 172
        Width = 4
        Height = 14
      end
      object pnlLeavesHead: TRzPanel
        Left = 1
        Top = 1
        Width = 569
        Height = 17
        Align = alTop
        BorderOuter = fsNone
        BorderSides = [sdBottom]
        BorderColor = 14205355
        BorderWidth = 1
        Color = 12955288
        GradientColorStyle = gcsCustom
        GradientColorStart = 8675134
        GradientColorStop = 8675134
        TabOrder = 0
        VisualStyle = vsGradient
        OnDblClick = imgOfficelogClick
        DesignSize = (
          569
          17)
        object RzLabel5: TRzLabel
          Tag = -1
          Left = 4
          Top = 1
          Width = 130
          Height = 13
          Caption = 'Leaves / Business trips'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          FlatColor = clWhite
        end
        object imgLeaves: TImage
          Tag = 1
          Left = 551
          Top = 0
          Width = 16
          Height = 16
          Hint = 'Expand'
          Anchors = [akTop, akRight]
          DragCursor = crHandPoint
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF610000001974455874536F6674776172650041646F62
            6520496D616765526561647971C9653C0000021C4944415478DA63FCFFFF3F03
            258031B9F5350323236330107703F98A44E8B90FB4B41488D7CEA91261608CA9
            7B0C12BC571A23AAA8A7CA4E50F7A5DB3F19BA97BCBE0F642A2D6E9461600C28
            BA0E12FFBFB65B8DE1DFBF7F849DCCC8C81052761BCC5CDFABC1C0E89472026C
            C08E69460C7FFEFC2168003333338367F679B0017B679B33309A86EF021B7068
            812DC3AF5FBFE00A7FFFFECDF0F5EB37866FDFBE81C5FFFE8518CECBCBCB1055
            731F6CC0A915AE0C8C5A3E1BC0069C5EE9CAF0F3E74F86DCB68B0C4F5F7D6798
            582CCB008BA1FC9E470C22822C0CB5C9520CECECEC0CC1A5606F335EDDECCFC0
            A8ECBA1A6CC0C5F59E0C1F3F7E6678FF8581C13FE7088398102BC3EC5A0D86D4
            E61B0CAFDEFD66D838C506E8AC8F0C2C2C2C0CDEB9102FDCD915C2C0A8E4B216
            6CC089650E0C1F3E7C01DBFA97918BC127EB30DC3B5BA6D93230FFFF06663331
            3131B8679E061B7077771003A3AAFB56B00107E69903FDFA1BAEE9E73F7606DF
            ACE30C9BA75932B033FD448E0706B78CB360C6AD1D5E0C8CDABE07C106EC9965
            000C28D468E4E3E364F8F4E93B464CB8675E021B7065931D03A37128D83FFFB7
            4FD504A603E292B577EE0DB0016756193030F28B9B33E8B82DBB579726AE68AC
            C94150F3D9EB3F189A66BDBC7F655794D2871727801E626010D6B0E90D97548B
            2C636064962768C2FFBF0F9FDD5ADE7DF348F10A6080BF0519C0054A1FA04446
            94FB21E02F107F061AF08D91D2EC0C00FF44D3E1741FD00E0000000049454E44
            AE426082}
          ShowHint = True
          Transparent = True
          OnClick = imgOfficelogClick
          ExplicitLeft = 498
        end
        object lblExpandLeaves: TRzLabel
          Tag = 1
          Left = 554
          Top = 1
          Width = 10
          Height = 14
          Cursor = crHandPoint
          Hint = 'Expand'
          Caption = '+'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Transparent = True
          Visible = False
          OnClick = lblExpandOfficeLogDblClick
          FlatColor = clWhite
        end
      end
    end
  end
  object imageList: TImageList
    ColorDepth = cd32Bit
    BlendColor = 8675134
    DrawingStyle = dsTransparent
    Left = 536
    Top = 301
    Bitmap = {
      494C010102000800280010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000A000000170000001A0000
      001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
      001A0000001A000000170000000A000000000000000A000000170000001A0000
      001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
      001A0000001A000000170000000A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000013180A076AB14B31E0E962
      40FFE96240FFE96240FFE96240FFE96240FFE96240FFE96240FFE96240FFE962
      40FFB14B31E0180A066B000000130000000000000013180A076AB14B31E0E962
      40FFE96240FFE96240FFE96240FFE96240FFE96240FFE96240FFE96240FFE962
      40FFB14B31E0180A066B00000013000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7462CDEF4C3B9FFFCEC
      ECFFFCECECFFFCECECFFFCECECFFFCECECFFFCECECFFFCECECFFFCECECFFFCEC
      ECFFF4C3B9FFA7462CDE000000000000000000000000A7462CDEF4C3B9FFFCEC
      ECFFFCECECFFFCECECFFFCECECFFFCECECFFFCECECFFFCECECFFFCECECFFFCEC
      ECFFF4C3B9FFA7462CDE00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CF5432FFF8EAEAFFF7E8
      E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8
      E8FFF7E8E8FFCF5432FF000000000000000000000000CF5432FFF8EAEAFFF7E8
      E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8E8FFF7E8
      E8FFF7E8E8FFCF5432FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C14C2AFFF1E7E7FFEFE4
      E4FFEFE4E4FFEFE4E4FFEFE4E4FFEFE4E4FFEFE4E4FFEFE4E4FFEFE4E4FFEFE4
      E4FFEFE4E4FFC14C2AFF000000000000000000000000C14C2AFFF1E7E7FFEFE4
      E4FFEFE4E4FFEFE4E4FFEFE4E4FFF8F2F2FFEFE4E4FFEFE4E4FFEFE4E4FFEFE4
      E4FFEFE4E4FFC14C2AFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B54624FFECE5E5FFE7DF
      DFFFEEE7E7FFF1ECECFFE7DFDFFFE7DFDFFFE7DFDFFFF1ECECFFEEE7E7FFE7DF
      DFFFE8DFDFFFB54624FF000000000000000000000000B54624FFECE5E5FFE7DF
      DFFFE7DFDFFFE7DFDFFFEEDDD8FFB54624FFEEDDD8FFE7DFDFFFE7DFDFFFE7DF
      DFFFE8DFDFFFB54624FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD4321FFEDEAEAFFE1DA
      DAFFC17259FFB75B3DFFEDE8E8FFE0D9D9FFEDE8E8FFB75B3DFFC17259FFE0D9
      D9FFE2DBDBFFAD4321FF000000000000000000000000AD4321FFEDEAEAFFE1DA
      DAFFE0D9D9FFEADAD6FFAD4321FFAD4321FFAD4321FFEADAD6FFE0D9D9FFE0D9
      D9FFE2DBDBFFAD4321FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AB4422FFF4F4F4FFE7E5
      E5FFD4C4C0FFAB4422FFB55C3EFFEDEAEAFFB55C3EFFAB4422FFD2C2BEFFD8D4
      D4FFDCD8D8FFAB4422FF000000000000000000000000AB4422FFF4F4F4FFE7E5
      E5FFE7D9D4FFAB4422FFB05638FFD8D4D4FFB05638FFAB4422FFE7D9D4FFD8D4
      D4FFDCD8D8FFAB4422FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B04B29FFF5F5F5FFEEEE
      EEFFEAEAEAFFD8CAC6FFB04B29FFB04B29FFB04B29FFCDBFBBFFD2D0D0FFD2D0
      D0FFD9D7D7FFB04B29FF000000000000000000000000B04B29FFF5F5F5FFEEEE
      EEFFBF735AFFB65D3FFFD3D1D1FFD2D0D0FFD2D0D0FFB45B3EFFB86C52FFD2D0
      D0FFD9D7D7FFB04B29FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA5634FFF7F7F7FFF1F1
      F1FFF1F1F1FFF1F1F1FFE7DAD6FFBA5634FFD5C8C4FFD2D1D1FFCECECEFFCECE
      CEFFDBDBDBFFBA5634FF000000000000000000000000BA5634FFF7F7F7FFF1F1
      F1FFF1F1F1FFF1F1F1FFECECECFFE2E1E1FFD8D7D7FFD2D1D1FFCECECEFFCECE
      CEFFDBDBDBFFBA5634FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C86341FFFAFAFAFFF6F6
      F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
      F6FFF9F9F9FFC86341FF000000000000000000000000C86341FFFAFAFAFFF6F6
      F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
      F6FFF9F9F9FFC86341FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7714FFFFDFDFDFFFBFB
      FBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
      FBFFFCFCFCFFD7714FFF000000000000000000000000D7714FFFFDFDFDFFFBFB
      FBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
      FBFFFCFCFCFFD7714FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AC5F45DEF8DAD1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF8DAD1FFAC5F45DE000000000000000000000000AC5F45DEF8DAD1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF8DAD1FFAC5F45DE00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000180E0A53B3664CDEED87
      64FFED8764FFED8764FFED8764FFED8764FFED8764FFED8764FFED8764FFED87
      64FFB3664CDE180E0A53000000000000000000000000180E0A53B3664CDEED87
      64FFED8764FFED8764FFED8764FFED8764FFED8764FFED8764FFED8764FFED87
      64FFB3664CDE180E0A5300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
