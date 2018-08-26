unit LocalUser;

interface

uses
  Role;

type
  TLocalUser = class
  private
    FUserId: string;
    FPasskey: string;
    FRoles: array of TRole;
    FName: string;

    function GetHasName: boolean;
    function GetHasPasskey: boolean;
    function GetRole(const i: integer): TRole;
    procedure SetRole(const i: integer; const Value: TRole);
    function GetRolesCount: integer;

  public
    property Name: string read FName write FName;
    property UserId: string read FUserId write FUserId;
    property Passkey: string read FPasskey write FPasskey;
    property HasName: boolean read GetHasName;
    property HasPasskey: boolean read GetHasPasskey;
    property Roles[const i: integer]: TRole read GetRole write SetRole;
    property RolesCount: integer read GetRolesCount;

    constructor Create;
  end;

implementation

{ TLocalUser }

constructor TLocalUser.Create;
begin
  inherited Create;
  SetLength(FRoles,0);
end;

function TLocalUser.GetHasName: boolean;
begin
  Result := FUserId <> '';
end;

function TLocalUser.GetHasPasskey: boolean;
begin
  Result := FPasskey <> '';
end;

function TLocalUser.GetRole(const i: integer): TRole;
begin
  Result := FRoles[i];
end;

function TLocalUser.GetRolesCount: integer;
begin
  Result := Length(FRoles);
end;

procedure TLocalUser.SetRole(const i: integer; const Value: TRole);
begin
  if i >= Length(FRoles) then SetLength(FRoles,Length(FRoles)+1);
  
  FRoles[i] := Value;
end;

end.
