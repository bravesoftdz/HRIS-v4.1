unit SecurityData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Win.ADODB;

type
  TdmSecurity = class(TDataModule)
    dscUser: TDataSource;
    dscRole: TDataSource;
    dstUsers: TADODataSet;
    dstRoles: TADODataSet;
    dstRoleRights: TADODataSet;
    dstRights: TADODataSet;
    dstUserRoles: TADODataSet;
    dstUsersid_num: TStringField;
    dstUsersemployee_lastname: TStringField;
    dstUsersemployee_firstname: TStringField;
    dstUsersemployee_middlename: TStringField;
    dstUsersemployee_name: TStringField;
    dstUsersusername: TStringField;
    dstUserspassword: TStringField;
    dstUsersid_num_1: TStringField;
    dstUserscredit_limit: TBCDField;
    procedure fdtUserBeforePost(DataSet: TDataSet);
    procedure dstUserspasswordGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSecurity: TdmSecurity;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  AppData, SecurityUtil;

procedure TdmSecurity.dstUserspasswordGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := '*****';
end;

procedure TdmSecurity.fdtUserBeforePost(DataSet: TDataSet);
begin
  // DataSet.FieldByName('PASSKEY').AsString := Encrypt(DataSet.FieldByName('PASSKEY').AsString);
end;

end.
