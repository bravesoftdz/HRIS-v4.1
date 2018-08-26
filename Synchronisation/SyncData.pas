unit SyncData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmSync = class(TDataModule)
    dstMessages: TADODataSet;
    dscMessages: TDataSource;
    dstMessagesdirection: TIntegerField;
    dstMessagesevent_object_desc: TStringField;
    dstMessagesemployee_name: TStringField;
    dstMessagesevent_object: TStringField;
    dstMessagespk_event_object: TStringField;
    dstMessagesmessage_date: TDateTimeField;
    dstMessagessource_location_name: TStringField;
    dstMessagessync_attempts: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSync: TdmSync;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  AppData;

end.
