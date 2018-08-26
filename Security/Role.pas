unit Role;

interface

uses
  Right;

type
  TRole = class
  private
    FName: string;
    FCode: string;
    FDescription: string;
    FRights: array of TRight;
    FAssignedNewValue: boolean;
    FAssignedOldValue: boolean;

    function GetHasCode: boolean;
    function GetHasName: boolean;
    function GetRight(const i: integer): TRight;
    procedure SetRight(const i: integer; const Value: TRight);
    function GetRightsCount: integer;
    function GetModified: boolean;
  public
    property Code: string read FCode write FCode;
    property Name: string read FName write FName;
    property Description: string read FDescription write FDescription;
    property HasCode: boolean read GetHasCode;
    property HasName: boolean read GetHasName;
    property Rights[const i: integer]: TRight read GetRight write SetRight;
    property RightsCount: integer read GetRightsCount;
    property AssignedOldValue: boolean read FAssignedOldValue write FAssignedOldValue;
    property AssignedNewValue: boolean read FAssignedNewValue write FAssignedNewValue;
    property Modified: boolean read GetModified;
  end;

implementation

{ TRole }

function TRole.GetHasCode: boolean;
begin
  Result := FCode <> '';
end;

function TRole.GetHasName: boolean;
begin
  Result := FName <> '';
end;

function TRole.GetModified: boolean;
begin
  Result := FAssignedOldValue <> FAssignedNewValue;
end;

function TRole.GetRight(const i: integer): TRight;
begin
  Result := FRights[i];
end;

function TRole.GetRightsCount: integer;
begin
  Result := Length(FRights);
end;

procedure TRole.SetRight(const i: integer; const Value: TRight);
begin
  if i = Length(FRights) then SetLength(FRights,Length(FRights)+1);
  
  FRights[i] := Value;
end;

end.
