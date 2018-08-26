unit BaseActionIntf;

interface

type
  IBaseAction = interface(IInterface)
    ['{143B8062-F27F-4474-B5FC-D7A7E42C2C62}']
    function Save: boolean;
    function Add: boolean;
    function Cancel: boolean;
    function Delete: boolean;

    procedure Retrieve;
  end;


implementation

end.
