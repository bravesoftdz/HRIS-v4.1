unit InfoBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, JvExControls, JvLabel,
  RzButton, Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmInfoBox = class(TfrmBasePopup)
    pnlClose: TRzPanel;
    btnClose: TRzShapeButton;
    Image1: TImage;
    lblMessage: TJvLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const infoMessage: string); reintroduce; overload;
  end;

var
  frmInfoBox: TfrmInfoBox;

implementation

{$R *.dfm}

constructor TfrmInfoBox.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TfrmInfoBox.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrClose;
end;

constructor TfrmInfoBox.Create(AOwner: TComponent; const infoMessage: string);
begin
  inherited Create(AOwner);
  lblMessage.Caption := infoMessage;
end;

procedure TfrmInfoBox.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then ModalResult := mrClose;
end;

end.
