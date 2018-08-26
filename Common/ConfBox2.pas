unit ConfBox2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup2, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, JvExControls, JvLabel, RzButton;

type
  TfrmConfBox2 = class(TfrmBasePopup2)
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
    constructor Create(AOwner: TComponent; const confMessage: string); reintroduce; overload;
  end;

implementation

{$R *.dfm}

procedure TfrmConfBox2.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrClose;
end;

constructor TfrmConfBox2.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TfrmConfBox2.Create(AOwner: TComponent;
  const confMessage: string);
begin
  inherited Create(AOwner);
  lblMessage.Caption := confMessage;
end;

procedure TfrmConfBox2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then ModalResult := mrClose;
end;

end.
