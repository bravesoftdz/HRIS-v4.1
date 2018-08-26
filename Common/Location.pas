unit Location;

interface

type
  TLocation = class(TObject)
  private
    FLocationCode: string;
    FLocationName: string;
    FLocationType: string;

    function GetIsServer: boolean;
  public
    property LocationCode: string read FLocationCode write FLocationCode;
    property LocationName: string read FLocationName write FLocationName;
    property LocationType: string read FLocationType write FLocationType;
    property IsServer: boolean read GetIsServer;
  end;

implementation

function TLocation.GetIsServer: boolean;
begin
  Result := FLocationType = 'SVR';
end;

end.
