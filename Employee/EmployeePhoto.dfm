inherited frmEmployeePhoto: TfrmEmployeePhoto
  Caption = 'frmEmployeePhoto'
  ClientHeight = 472
  ClientWidth = 805
  OnCreate = FormCreate
  ExplicitWidth = 821
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 14
  object pnlPhoto: TRzPanel
    Left = 157
    Top = 36
    Width = 524
    Height = 373
    BorderOuter = fsNone
    BorderColor = 13816530
    BorderWidth = 1
    Caption = 'No photo available.'
    Color = clMenu
    TabOrder = 4
    object EmployeePhoto: TImage
      Left = 1
      Top = 1
      Width = 522
      Height = 371
      Align = alClient
      Center = True
      Proportional = True
      ExplicitLeft = 157
      ExplicitTop = 36
      ExplicitWidth = 524
      ExplicitHeight = 373
    end
    object VideoWindow: TVideoWindow
      Left = 1
      Top = 1
      Width = 522
      Height = 371
      FilterGraph = CaptureGraph
      VMROptions.Mode = vmrRenderless
      Color = clBlack
      Visible = False
      Align = alClient
    end
  end
  object ListBox: TListBox
    Left = 17
    Top = 20
    Width = 121
    Height = 97
    ItemHeight = 14
    TabOrder = 0
    Visible = False
  end
  object ListBox2: TListBox
    Left = 17
    Top = 123
    Width = 121
    Height = 97
    ItemHeight = 14
    TabOrder = 1
    Visible = False
  end
  object pnlTakePhoto: TRzPanel
    Left = 157
    Top = 434
    Width = 95
    Height = 22
    BorderOuter = fsNone
    BorderColor = 13816530
    BorderWidth = 1
    Color = clMenu
    TabOrder = 2
    object btnTakePhoto: TRzShapeButton
      Left = 0
      Top = 0
      Width = 95
      Height = 22
      Hint = 'Take photo'
      BorderStyle = bsNone
      Caption = 'Take photo'
      OnClick = btnTakePhotoClick
    end
  end
  object pnlCancel: TRzPanel
    Left = 261
    Top = 434
    Width = 50
    Height = 22
    BorderOuter = fsNone
    BorderColor = 13816530
    BorderWidth = 1
    Color = clMenu
    TabOrder = 3
    object btnCancel: TRzShapeButton
      Left = 0
      Top = 0
      Width = 50
      Height = 22
      Hint = 'Cancel'
      BorderStyle = bsNone
      Caption = 'Cancel'
      OnClick = btnCancelClick
    end
  end
  object CaptureGraph: TFilterGraph
    Mode = gmCapture
    GraphEdit = False
    LinearVolume = True
    Left = 208
    Top = 65489
  end
  object SampleGrabber: TSampleGrabber
    FilterGraph = CaptureGraph
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 240
    Top = 65489
  end
  object VideoSourceFilter: TFilter
    BaseFilter.data = {00000000}
    Left = 176
    Top = 65489
  end
end
