unit DBUtil;

interface

uses
  AppData, SysUtils, Vcl.ExtCtrls, DB, HRISGlobal, HRISDialogs;

procedure RefreshDataSet(const key: integer; const keyField: string; DataSet: TDataSet); overload;
procedure RefreshDataSet(const key, keyField: string; DataSet: TDataSet); overload;
procedure RefreshDataSet(const recordNo: integer; DataSet: TDataSet); overload;
procedure SetCreatedFields(ADataSet: TDataSet);
procedure SetModifiedFields(ADataSet: TDataSet);
procedure ExecuteSQL(const sql: string);

implementation

procedure RefreshDataSet(const key: integer; const keyField: string; DataSet: TDataSet);
begin
  with DataSet do
  begin
    DisableControls;
    Close;
    Open;
    Locate(keyField,key,[]);
    EnableControls;
  end;
end;

procedure RefreshDataSet(const key, keyField: string; DataSet: TDataSet);
begin
  with DataSet do
  begin
    DisableControls;
    Close;
    Open;
    Locate(keyField,key,[]);
    EnableControls;
  end;
end;

procedure RefreshDataSet(const recordNo: integer; DataSet: TDataSet); overload;
begin
  with DataSet do
  begin
    DisableControls;
    Close;
    Open;
    MoveBy(recordNo);
    EnableControls;
  end;
end;

procedure SetCreatedFields(ADataSet: TDataSet);
begin
  ADataSet.FieldByName('created_date').AsDateTime := HRIS.CurrentDate;
  ADataSet.FieldByName('created_by').AsString := HRIS.User.UserId;
end;

procedure SetModifiedFields(ADataSet: TDataSet);
begin
  ADataSet.FieldByName('modified_date').AsDateTime := HRIS.CurrentDate;
  ADataSet.FieldByName('modified_by').AsString := HRIS.User.UserId;
end;

procedure ExecuteSQL(const sql: string);
begin
  try
    with dmApplication.acMain do
      Execute(sql);
  except
    on E: Exception do ShowErrorBox(E.Message);
  end;
end;


end.


