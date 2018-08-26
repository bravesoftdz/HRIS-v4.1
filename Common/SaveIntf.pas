unit SaveIntf;

interface

type
  ISave = Interface(IInterface)
    ['{FC09AD90-FB42-45F5-A6AC-F5E7EF31C54B}']
    function Save: boolean;
    procedure Cancel;
  end;

implementation

end.
