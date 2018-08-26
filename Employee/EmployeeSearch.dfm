inherited frmEmployeeSearch: TfrmEmployeeSearch
  Caption = 'frmEmployeeSearch'
  ClientHeight = 440
  ClientWidth = 456
  ExplicitWidth = 456
  ExplicitHeight = 440
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 456
    ExplicitWidth = 456
    inherited imgClose: TImage
      Left = 435
      ExplicitLeft = 435
    end
    inherited lblCaption: TRzLabel
      Width = 96
      Caption = 'Employee search'
      ExplicitWidth = 96
    end
  end
  inherited pnlMain: TRzPanel
    Width = 456
    Height = 419
    ExplicitWidth = 456
    ExplicitHeight = 419
    inherited edSearchKey: TRzEdit
      Width = 395
      ExplicitWidth = 395
    end
    inherited pnlSearch: TRzPanel
      Width = 438
      Height = 343
      ExplicitWidth = 438
      ExplicitHeight = 343
      inherited grSearch: TRzDBGrid
        Width = 436
        Height = 341
        DataSource = dmApplication.dscHRISEmployees
        Columns = <
          item
            Expanded = False
            FieldName = 'id_num'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'employee_lastname'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'employee_firstname'
            Width = 200
            Visible = True
          end>
      end
    end
    inherited pnlSelect: TRzPanel
      Top = 387
      ExplicitTop = 387
    end
    inherited pnlNew: TRzPanel
      Top = 387
      Visible = False
      ExplicitTop = 387
    end
    inherited pnlCancel: TRzPanel
      Left = 396
      Top = 387
      ExplicitLeft = 396
      ExplicitTop = 387
    end
  end
end
