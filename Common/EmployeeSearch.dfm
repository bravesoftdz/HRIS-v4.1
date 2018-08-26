inherited frmEmployeeSearch: TfrmEmployeeSearch
  Caption = 'frmEmployeeSearch'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 96
      Caption = 'Employee search'
      ExplicitWidth = 96
    end
  end
  inherited pnlMain: TRzPanel
    inherited pnlSearch: TRzPanel
      inherited grSearch: TRzDBGrid
        DataSource = dmApplication.dscEmployees
        Columns = <
          item
            Expanded = False
            FieldName = 'employee_name'
            Width = 250
            Visible = True
          end>
      end
    end
    inherited pnlNew: TRzPanel
      Visible = False
      inherited btnNew: TRzShapeButton
        Visible = False
      end
    end
  end
end
