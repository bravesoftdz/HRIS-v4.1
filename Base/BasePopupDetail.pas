unit BasePopupDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, HRISDialogs;

type
  TfrmBasePopupDetail = class(TfrmBasePopup)
    pnlDetail: TRzPanel;
    btnSave: TRzPanel;
    sbtnSave: TRzShapeButton;
    btnCancel: TRzPanel;
    sbtnCancel: TRzShapeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure Save; virtual; abstract;
    procedure Cancel; virtual; abstract;
    function ValidEntry: boolean; virtual; abstract;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  ErrorBox;

procedure TfrmBasePopupDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if ModalResult = mrCancel then
    Cancel;
end;

procedure TfrmBasePopupDetail.sbtnSaveClick(Sender: TObject);
begin
  inherited;
  if ValidEntry then
  begin
    try
      Save;
      ModalResult := mrOK;
    except
      on e: Exception do ShowErrorBox(e.Message);
    end;
  end;

end;

end.
