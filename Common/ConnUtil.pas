unit ConnUtil;

interface

uses SysUtils, IniFiles, AppUtil;

function GetConnection(const appPath, AUser, APassword: string;
  const core: boolean = false): string;

implementation

function GetConnection(const appPath, AUser, APassword: string;
  const core: boolean = false): string;
var
  dir, inifile, section, connStr: string;
  Ini: TInifile;
  provider, user, pw, server, db, datasource: string;
begin
  // application path parameter is only used by the windows service
  if appPath = '' then
    dir := GetCurrentDir
  else
    dir := appPath;

  // specify section
  if core then
    section := 'CORE'
  else
    section := 'CONNECTION';

  inifile := dir + '\' + KIOSK_INI;

  Ini := TIniFile.Create(inifile);

  provider := Ini.ReadString(section,'Provider','');
  user := Ini.ReadString(section,'User','');
  pw := Ini.ReadString(section,'Password','');
  server := Ini.ReadString(section,'Server','BRYAN-PC\SQLEXPRESS');
  db := Ini.ReadString(section,'Dbase','');
  datasource := Ini.ReadString(section,'DataSource','');

  // overwrite the username and password with the parameters
  if AUser <> '' then
    user := AUser;

  if APassword <> '' then
    pw := APassword;

  connStr := 'Provider=' + provider + ';Password=' + pw + ';' +
              'Persist Security Info=False;' +
              'User ID=' + user + ';Initial Catalog=' + db +
              ';Data Source=' + datasource +
              ';Use Procedure for Prepare=1;' +
              'Auto Translate=True;Packet Size=4096;' +
              'Workstation ID=' + server +
              ';Use Encryption for Data=False;' +
              'Tag with column collation when possible=False;' +
              'MARS Connection=False;DataTypeCompatibility=0;' +
              'Trust Server Certificate=False';

  Result := connStr;
end;


end.


