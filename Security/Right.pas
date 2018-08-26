unit Right;

interface

type
  TRight = class
  strict private
    FName: string;
    FCode: string;
    FAssignedOldValue: boolean;
  private
    FModified: boolean;
    FAssignedNewValue: boolean;

    function GetModified: boolean;
  public
    property Code: string read FCode write FCode;
    property Name: string read FName write FName;
    property AssignedOldValue: boolean read FAssignedOldValue write FAssignedOldValue;
    property AssignedNewValue: boolean read FAssignedNewValue write FAssignedNewValue;
    property Modified: boolean read GetModified;
  end;

implementation

{ TRight }

function TRight.GetModified: boolean;
begin
  Result := FAssignedOldValue <> FAssignedNewValue;
end;

end.
