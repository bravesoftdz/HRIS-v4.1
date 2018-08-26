unit InfoBox2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup2, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, JvExControls, JvLabel, RzButton;

type
  TfrmInfoBox2 = class(TfrmBasePopup2)
    pnlClose: TRzPanel;
    btnClose: TRzShapeButton;
    lblMessage: TJvLabel;
    Image1: TImage;
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const infoMessage: string); reintroduce; overload;
  end;

implementation

{$R *.dfm}

{ TfrmInfoBox2 }

constructor TfrmInfoBox2.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TfrmInfoBox2.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrClose;
end;

constructor TfrmInfoBox2.Create(AOwner: TComponent; const infoMessage: string);
begin
  inherited Create(AOwner);
  lblMessage.Caption := infoMessage;
end;

procedure TfrmInfoBox2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then ModalResult := mrClose;
end;

end.
