inherited frmFilterSelect: TfrmFilterSelect
  Caption = 'frmFilterSelect'
  ClientHeight = 342
  ClientWidth = 314
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 314
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 314
    ExplicitWidth = 314
    DesignSize = (
      314
      21)
    inherited imgClose: TImage
      Left = 293
      ExplicitLeft = 293
    end
    inherited lblCaption: TRzLabel
      Width = 66
      Caption = 'Filter select'
      ExplicitWidth = 66
    end
  end
  inherited pnlMain: TRzPanel
    Width = 314
    Height = 321
    ExplicitWidth = 314
    ExplicitHeight = 321
    DesignSize = (
      314
      321)
    object pnlFilter: TRzPanel
      Left = 8
      Top = 8
      Width = 298
      Height = 272
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14273211
      TabOrder = 0
      object tvFilter: TRzTreeView
        Left = 1
        Top = 1
        Width = 296
        Height = 270
        SelectionPen.Color = clBtnShadow
        Align = alClient
        BorderStyle = bsNone
        DragMode = dmAutomatic
        FramingPreference = fpCustomFraming
        Indent = 19
        ReadOnly = True
        RowSelect = True
        SortType = stText
        TabOrder = 0
        OnDblClick = tvFilterDblClick
        Items.NodeData = {
          03030000002A0000000000000001000000FFFFFFFFFFFFFFFF00000000000000
          000000000001064200720061006E0063006800320000000000000002000000FF
          FFFFFFFFFFFFFF000000000000000000000000010A4400650070006100720074
          006D0065006E0074002E0000000000000003000000FFFFFFFFFFFFFFFF000000
          000000000000000000010850006F0073006900740069006F006E00}
      end
    end
    object pnlSelect: TRzPanel
      Left = 9
      Top = 289
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14273211
      TabOrder = 1
      object btnSelect: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Select row '
        Caption = 'Select'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSelectClick
      end
    end
    object pnlCancel: TRzPanel
      Left = 256
      Top = 289
      Width = 50
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 14205355
      BorderWidth = 1
      Color = 14273211
      TabOrder = 2
      object btnCancel: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Select row '
        Caption = 'Cancel'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCancelClick
      end
    end
  end
end
