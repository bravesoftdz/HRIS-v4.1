unit AssignRights;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail2, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzLstBox,
  RzChkLst, Role, Right, RzCmboBx, JvExControls, JvLabel;

type
  TfrmAssignRights = class(TfrmBasePopupDetail2)
    chlRights: TRzCheckList;
    procedure chlRightsChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
  private
    { Private declarations }
    Role: TRole;
    procedure PopulateRightsList;
  protected
    procedure Save; override;
    procedure Cancel; override;
    procedure BindToObject; override;
    function ValidEntry: boolean; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; var ARole: TRole); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  SecurityData;

{ TfrmAssignRights }

constructor TfrmAssignRights.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmAssignRights.BindToObject;
begin
  inherited;

end;

procedure TfrmAssignRights.Cancel;
begin

end;

procedure TfrmAssignRights.chlRightsChange(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
begin
  (chlRights.Items.Objects[Index] as TRight).AssignedNewValue := NewState = cbChecked;
end;

constructor TfrmAssignRights.Create(AOwner: TComponent; var ARole: TRole);
begin
  Create(AOwner);

  Role := ARole;

  // caption
  lblCaption.Caption := 'Assigned rights to ' + ARole.Name;

  PopulateRightsList;
end;

procedure TfrmAssignRights.PopulateRightsList;
var
  LRight: TRight;
begin
  with dmSecurity.dstRoleRights, chlRights do
  begin
    try
      // open the datasource
      Parameters.ParamByName('@role_code').Value := Role.Code;

      Open;

      while not Eof do
      begin
        LRight := TRight.Create;
        LRight.Code := FieldByName('privilege_code_master').AsString;
        LRight.Name := FieldByName('privilege_name').AsString;
        LRight.AssignedOldValue := FieldByName('assigned').AsInteger = 1;
        LRight.AssignedNewValue := FieldByName('assigned').AsInteger = 1;

        AddItem(LRight.Name,LRight);
        ItemChecked[Items.Count-1] := LRight.AssignedOldValue;

        Next;
      end;
    finally
      Close;
    end;
  end;
end;

procedure TfrmAssignRights.Save;
var
  i, cnt: integer;
begin
  cnt := chlRights.Count - 1;
  for i := 0 to cnt  do Role.Rights[i] := chlRights.Items.Objects[i] as TRight;

  inherited;
end;

function TfrmAssignRights.ValidEntry: boolean;
begin
  Result := true;
end;

end.
