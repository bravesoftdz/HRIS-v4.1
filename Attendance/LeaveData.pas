unit LeaveData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmLeave = class(TDataModule)
    dstLeaves: TADODataSet;
    dstLeaveCredits: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  AppData;

end.
