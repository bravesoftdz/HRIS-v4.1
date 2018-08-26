unit LeaveDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Grids, RzGrids, RzEdit,
  Vcl.Mask, RzBtnEdt, Vcl.DBCtrls, RzDBCmbo, RzDBEdit, Data.DB, Vcl.DBGrids,
  RzDBGrid;

type
  TfrmLeaveDetails = class(TfrmBasePopup)
    RzLabel5: TRzLabel;
    bteEmployee: TRzButtonEdit;
    dteFromAM: TRzDateTimeEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    dbluReasonAM: TRzDBLookupComboBox;
    RzDBMemo1: TRzDBMemo;
    RzLabel3: TRzLabel;
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    RzLabel4: TRzLabel;
    RzDBMemo2: TRzDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLeaveDetails: TfrmLeaveDetails;

implementation

{$R *.dfm}

end.
