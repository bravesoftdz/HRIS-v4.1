unit BasePopup2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, RzPanel, Vcl.StdCtrls, RzLabel, BaseForm;

type
  TfrmBasePopup2 = class(TfrmBasePopup)
    procedure imgCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmBasePopup2.imgCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrClose;
end;

end.
