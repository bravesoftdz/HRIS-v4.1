unit ErrorBox;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, JvExControls, JvLabel, RzButton;

type
  TfrmErrorBox = class(TfrmBasePopup)
    lblMessage: TJvLabel;
    Image1: TImage;
    pnlClose: TRzPanel;
    btnClose: TRzShapeButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const errMessage: string); reintroduce; overload;
  end;

var
  frmErrorBox: TfrmErrorBox;

implementation

{$R *.dfm}

constructor TfrmErrorBox.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TfrmErrorBox.Create(AOwner: TComponent; const errMessage: string);
begin
  inherited Create(AOwner);
  lblMessage.Caption := errMessage;
end;


procedure TfrmErrorBox.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then ModalResult := mrClose;
end;

procedure TfrmErrorBox.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrClose;
end;

end.
