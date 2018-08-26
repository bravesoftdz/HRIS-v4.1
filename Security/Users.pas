unit Users;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, User, LocalUser,
  JvExControls, JvLabel;

type
  TfrmUsers = class(TfrmBaseGridDetail)
    Label2: TLabel;
    edUsername: TRzDBEdit;
    Label3: TLabel;
    edPassword: TRzDBEdit;
    urlRoles: TRzURLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure urlRolesClick(Sender: TObject);
    procedure grListDblClick(Sender: TObject);
  private
    { Private declarations }
    LUser: TLocalUser;
    procedure ShowAssignedRoles;
    procedure SaveRoles;
  protected
    procedure SearchList; override;
    procedure BindToObject; override;

    function EntryIsValid: boolean; override;
    function NewIsAllowed: boolean; override;
    function EditIsAllowed: boolean; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  SecurityData, HRISDialogs, HRISGlobal, Right, AssignRoles, Role, AppConstants;

{ TfrmUsers }

procedure TfrmUsers.BindToObject;
begin
  inherited;
  LUser.Name := grList.DataSource.DataSet.FieldByName('employee_name').AsString;
  LUser.UserId := grList.DataSource.DataSet.FieldByName('id_num').AsString;
  LUser.Passkey := edPassword.Text;
end;

function TfrmUsers.EditIsAllowed: boolean;
begin
  Result := HRIS.User.HasRights([PRIV_USER_MODIFY],false);
end;

function TfrmUsers.EntryIsValid: boolean;
var
  error: string;
begin
  if not LUser.HasName then error := 'Please enter username.'
  else if not LUser.HasPasskey then error := 'Please enter password.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  LUser.Free;
end;

procedure TfrmUsers.FormCreate(Sender: TObject);
begin
  LUser := TLocalUser.Create;
  inherited;
end;

procedure TfrmUsers.grListDblClick(Sender: TObject);
begin
  inherited;
  ShowAssignedRoles;
end;

function TfrmUsers.NewIsAllowed: boolean;
begin
  Result := HRIS.User.HasRights([PRIV_USER_ADD_NEW]);
end;

procedure TfrmUsers.SaveRoles;
var
  LRole: TRole;
  sql: string;
  i, cnt: integer;
begin
  try
    try
      cnt := LUser.RolesCount - 1;

      for i := 0 to cnt do
      begin
        LRole := LUser.Roles[i];

        if LRole.Modified then
        begin
          if LRole.AssignedNewValue then
            sql := 'INSERT INTO SYSUSERROLE VALUES (' + QuotedStr(LRole.Code) +
                  ',' + QuotedStr(LUser.UserId) + ');'
          else
            sql := 'DELETE FROM SYSUSERROLE WHERE ROLE_CODE = ' + QuotedStr(LRole.Code) +
                  ' AND ID_NUM = ' + QuotedStr(LUser.UserId) + ';';

          // execute the sql
          dmSecurity.dstRoles.Connection.Execute(sql);
        end;
      end; // end for

    except
      on E: Exception do ShowErrorBox(E.Message);
    end;
  finally
  end;
end;

procedure TfrmUsers.SearchList;
var
  filterStr: string;
begin
  filterStr := 'EMPLOYEE_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grList.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmUsers.ShowAssignedRoles;
begin
  BindToObject;

  with TfrmAssignRoles.Create(self.Parent,LUser) do
  begin
    try
      ShowModal;

      if ModalResult = mrOk then SaveRoles;
    finally
      Free;
    end;
  end;
end;

procedure TfrmUsers.urlRolesClick(Sender: TObject);
begin
  inherited;
  ShowAssignedRoles;
end;

end.
