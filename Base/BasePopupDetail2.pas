unit BasePopupDetail2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, RzTabs, Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, RzPanel, BasePopup2, JvExControls, JvLabel;

type
  TfrmBasePopupDetail2 = class(TfrmBasePopup2)
    pnlDetail: TRzPanel;
    btnSave: TRzPanel;
    sbtnSave: TRzShapeButton;
    btnCancel: TRzPanel;
    sbtnCancel: TRzShapeButton;
    lblError: TJvLabel;
    procedure sbtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure Save; virtual;
    procedure Cancel; virtual;
    procedure BindToObject; virtual; abstract;
    function ValidEntry: boolean; virtual; abstract;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  HRISDialogs, FormsUtil;

procedure TfrmBasePopupDetail2.Cancel;
begin
  ModalResult := mrCancel;
end;

procedure TfrmBasePopupDetail2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  OpenDropdownDataSources(pnlDetail,false);
end;

procedure TfrmBasePopupDetail2.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(pnlDetail);
end;

procedure TfrmBasePopupDetail2.Save;
begin
  if ValidEntry then ModalResult := mrOK;
end;

procedure TfrmBasePopupDetail2.sbtnSaveClick(Sender: TObject);
begin
  Save;
end;

end.
