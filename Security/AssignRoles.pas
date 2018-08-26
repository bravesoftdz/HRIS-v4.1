unit AssignRoles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail2, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, LocalUser, Role,
  RzLstBox, RzChkLst, BasePopupDetail, JvExControls, JvLabel;

type
  TfrmAssignRoles = class(TfrmBasePopupDetail2)
    chlRoles: TRzCheckList;
    procedure chlRolesChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
  private
    { Private declarations }
    FUser: TLocalUser;
    procedure PopulateRolesList;
  protected
    procedure Save; override;
    procedure Cancel; override;
    procedure BindToObject; override;
    function ValidEntry: boolean; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; var AUser: TLocalUser); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  SecurityData;

{ TfrmAssignRoles }

procedure TfrmAssignRoles.BindToObject;
begin
  inherited;

end;

procedure TfrmAssignRoles.Cancel;
begin
  inherited;

end;

procedure TfrmAssignRoles.chlRolesChange(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
begin
  inherited;
  (chlRoles.Items.Objects[Index] as TRole).AssignedNewValue := NewState = cbChecked;
end;

constructor TfrmAssignRoles.Create(AOwner: TComponent; var AUser: TLocalUser);
begin
  inherited Create(AOwner);
  FUser := AUser;

  // caption
  lblCaption.Caption := 'Assigned roles to ' + AUser.Name;

  PopulateRolesList;
end;

procedure TfrmAssignRoles.PopulateRolesList;
var
  LRole: TRole;
begin
  with dmSecurity.dstUserRoles, chlRoles do
  begin
    try
      // open the datasource
      Parameters.ParamByName('@id_num').Value := FUser.UserId;

      Open;

      while not Eof do
      begin
        LRole := TRole.Create;
        LRole.Code := FieldByName('role_code_master').AsString;
        LRole.Name := FieldByName('role_name').AsString;
        LRole.AssignedOldValue := FieldByName('id_num').AsString <> '';
        LRole.AssignedNewValue := FieldByName('id_num').AsString <> '';

        AddItem(LRole.Name,LRole);
        ItemChecked[Items.Count-1] := LRole.AssignedOldValue;

        Next;
      end;
    finally
      Close;
    end;
  end;
end;

constructor TfrmAssignRoles.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmAssignRoles.Save;
var
  i, cnt: integer;
begin
  cnt := chlRoles.Count - 1;
  for i := 0 to cnt  do FUser.Roles[i] := chlRoles.Items.Objects[i] as TRole;

  inherited;
end;

function TfrmAssignRoles.ValidEntry: boolean;
begin
  Result := true;
end;

end.
