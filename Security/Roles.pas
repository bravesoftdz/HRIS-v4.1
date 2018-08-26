unit Roles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.DBCtrls, RzDBEdit, Role, AssignRights;

type
  TfrmRoles = class(TfrmBaseGridDetail)
    Label2: TLabel;
    edCode: TRzDBEdit;
    Label3: TLabel;
    edName: TRzDBEdit;
    Label4: TLabel;
    mmDescription: TRzDBMemo;
    urlRoles: TRzURLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure urlRolesClick(Sender: TObject);
    procedure grListDblClick(Sender: TObject);
  private
    { Private declarations }
    Role: TRole;
    procedure ShowAssignedRights;
    procedure SaveRights;
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
  SecurityData, HRISDialogs, HRISGlobal, User, Right, AppConstants;

{ TfrmRoles }

procedure TfrmRoles.BindToObject;
begin
  Role.Code := edCode.Text;
  Role.Name := edName.Text;
  Role.Description := mmDescription.Text;
end;

function TfrmRoles.EditIsAllowed: boolean;
begin
  Result := HRIS.User.HasRights([PRIV_ROLE_MODIFY],false);
end;

function TfrmRoles.EntryIsValid: boolean;
var
  error: string;
begin
  if not Role.HasCode then error := 'Please enter role code.'
  else if not Role.HasName then error := 'Please enter role name.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmRoles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Role.Free;
end;

procedure TfrmRoles.FormCreate(Sender: TObject);
begin
  Role := TRole.Create;
  inherited;
end;

procedure TfrmRoles.grListDblClick(Sender: TObject);
begin
  inherited;
  ShowAssignedRights;
end;

function TfrmRoles.NewIsAllowed: boolean;
begin
  Result := HRIS.User.HasRights([PRIV_ROLE_NEW]);
end;

procedure TfrmRoles.SaveRights;
var
  right: TRight;
  sql: string;
  i, cnt: integer;
begin
  try
    try
      cnt := Role.RightsCount - 1;

      for i := 0 to cnt do
      begin
        right := Role.Rights[i];

        if right.Modified then
        begin
          if right.AssignedNewValue then
            sql := 'INSERT INTO SYSROLEPRIVILEGE VALUES (' + QuotedStr(Role.Code) +
                  ',' + QuotedStr(right.Code) + ');'
          else
            sql := 'DELETE FROM SYSROLEPRIVILEGE WHERE ROLE_CODE = ' + QuotedStr(Role.Code) +
                  ' AND PRIVILEGE_CODE = ' + QuotedStr(right.Code) + ';';

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

procedure TfrmRoles.SearchList;
var
  filterStr: string;
begin
  filterStr := 'ROLE_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grList.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmRoles.ShowAssignedRights;
begin
  BindToObject;
  with TfrmAssignRights.Create(self.Parent,Role) do
  begin
    try
      ShowModal;

      if ModalResult = mrOk then SaveRights;
    finally
      Free;
    end;
  end;
end;

procedure TfrmRoles.urlRolesClick(Sender: TObject);
begin
  ShowAssignedRights;
end;

end.
