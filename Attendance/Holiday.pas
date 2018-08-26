unit Holiday;

interface

type
   THoliday = class
  private
    FName: string;
    FIsNational: integer;

    function GetIsNational: boolean;

  public
    property Name: string read FName write FName;
    property IsNational: boolean read GetIsNational;

    constructor Create(const nm: string; const isNat: integer);
  end;

implementation

{ THoliday }

constructor THoliday.Create(const nm: string; const isNat: Integer);
begin
  FName := nm;
  FIsNational := isNat;
end;

function THoliday.GetIsNational: boolean;
begin
  Result := FIsNational = 1;
end;

end.
