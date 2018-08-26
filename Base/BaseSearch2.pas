unit BaseSearch2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, RzButton,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel;

type
  TfrmBaseSearch2 = class(TfrmBaseSearch)
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    { Public declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  end;

implementation

{$R *.dfm}

{ TfrmBaseSearch2 }

procedure TfrmBaseSearch2.Add;
begin
  inherited;

end;

procedure TfrmBaseSearch2.Cancel;
begin
  inherited;

end;

procedure TfrmBaseSearch2.SearchList;
begin
  inherited;

end;

procedure TfrmBaseSearch2.SetReturn;
begin
  inherited;

end;

end.
