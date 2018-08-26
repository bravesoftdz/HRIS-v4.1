unit ResourceFilter;

interface

type
  TResourceFilterType = (ftNone, ftBranch, ftDepartment, ftPositionType);

type
  TResourceFilter = class
  private
    FResourceTypeName: string;
    FCode: string;
    FName: string;

    function GetFilterTypeName: string;
    function GetFilterType: TResourceFilterType;

  public
    property FilterType: TResourceFilterType read GetFilterType;
    property FilterTypeName: string read GetFilterTypeName;
    property ResourceTypeName: string write FResourceTypeName;
    property Code: string read FCode write FCode;
    property Name: string read FName write FName;

    procedure Clear;

    constructor Create;
  end;

var
  resFilter: TResourceFilter;

implementation

procedure TResourceFilter.Clear;
begin
  FResourceTypeName := '';
  FCode := '';
  FName := '';
end;

constructor TResourceFilter.Create;
begin
  if resFilter <> nil then resFilter := self
  else inherited Create;
end;

function TResourceFilter.GetFilterType: TResourceFilterType;
begin
  Result := ftNone;

  if FResourceTypeName = 'LOC' then Result := ftBranch
  else if FResourceTypeName = 'DEP' then Result := ftDepartment
  else if FResourceTypeName = 'POS' then Result := ftPositionType;
end;

function TResourceFilter.GetFilterTypeName: string;
begin
  case GetFilterType of
    ftNone: Result := '';
    ftBranch: Result := 'Branch';
    ftDepartment: Result := 'Department';
    ftPositionType: Result := 'Position';
  end;
end;

end.
