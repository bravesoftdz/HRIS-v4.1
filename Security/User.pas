unit User;

interface

uses
  StrUtils, SysUtils, System.Rtti, Classes, Right;

type
  TSuperUser = class
  strict private
    FName: string;
    FPasskey: string;
  public
    property Name: string read FName write FName;
    property Passkey: string read FPasskey write FPasskey;
  end;

  TUser = class
  private
    FPasskey: string;
    FRoleCode: string;
    FRights: array of string;
    FSuperUser: TSuperUser;
    FLastName: string;
    FFirstName: string;
    FUserId: string;
    FCreditLimit: currency;

    function GetHasName: boolean;
    function GetHasPasskey: boolean;
    function GetHasRole: boolean;
    function GetIsSuperUser: boolean;
    function GetName: string;

  public
    property Passkey: string read FPasskey write FPasskey;
    property RoleCode: string read FRoleCode write FRoleCode;
    property HasName: boolean read GetHasName;
    property HasPasskey: boolean read GetHasPasskey;
    property HasRole: boolean read GetHasRole;
    property SuperUser: TSuperUser read FSuperUser write FSuperUser;
    property IsSuperUser: boolean read GetIsSuperUser;
    property UserId: string read FUserId write FUserId;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string write FLastName;
    property Name: string read GetName;
    property CreditLimit: currency read FCreditLimit write FCreditLimit;

    procedure SetRight(const right: string);
    procedure AddRight(const code: string);
    procedure ClearSuperUser;

    function HasRights(const ARights: array of string; const AWarn: boolean = false): boolean;
    function ChangePassword(ANewPasskey: AnsiString): Boolean;

    constructor Create; overload;
    constructor Create(const AName: string); overload;

    destructor Destroy; override;
  end;

implementation

{ TUser }

uses
  DBUtil, HRISDialogs;

procedure TUser.AddRight(const code: string);
begin
  SetLength(FRights, Length(FRights) + 1);
  FRights[Length(FRights) - 1] := code;
end;

function TUser.ChangePassword(ANewPasskey: AnsiString): Boolean;
var
  sql: string;
begin
  Result := false;
  try
    sql := 'UPDATE SYSUSER SET PASSWORD = ' + QuotedStr(Trim(ANewPasskey)) +
            ' WHERE ID_NUM = ' + QuotedStr(FUserId);

    ExecuteSQL(sql);
    Result := true;
  except
    on E: Exception do ShowErrorBox(E.Message);
  end;
end;

procedure TUser.ClearSuperUser;
begin
  FreeAndNil(FSuperUser);
end;

constructor TUser.Create(const AName: string);
begin
  FUserId := AName;
end;

destructor TUser.Destroy;
begin

  inherited;
end;

function TUser.GetHasName: boolean;
begin
  Result := FUserId <> '';
end;

function TUser.GetHasPasskey: boolean;
begin
  Result := FPasskey <> '';
end;

function TUser.GetHasRole: boolean;
begin
  Result := RoleCode <> '';
end;

function TUser.GetIsSuperUser: boolean;
begin
  Result := Assigned(FSuperUser);
end;

function TUser.GetName: string;
begin
  Result := FLastName + ', ' + FFirstName;
end;

constructor TUser.Create;
begin
  inherited Create;
end;

function TUser.HasRights(const ARights: array of string;
  const AWarn: boolean = false): boolean;
var
  sl: TStringList;
  i, cnt, rightCnt: integer;
begin
  rightCnt := 0;

  cnt := Length(ARights) - 1;

  for i := 0 to cnt do
  begin
    sl := TStringList.Create;
    sl.Delimiter := ';';
    sl.DelimitedText := ARights[i];

    if MatchStr(sl[0],FRights) then Inc(rightCnt);

    sl.Free;
  end;

  Result := rightCnt > 0;

  if (not Result) and (AWarn) then ShowErrorBox2('Access is denied. Please contact system administrator.');
end;

procedure TUser.SetRight(const right: string);
var
  len: integer;
begin
  len := Length(FRights);

  SetLength(FRights, len + 1);
  FRights[len] := right;
end;

end.
