unit FormsUtil;

interface

uses
  Vcl.Controls, RzDBCmbo, RzDBGrid, RzGrids, DB, RzLstBox, RzChkLst, Vcl.ExtCtrls,
  System.Classes, RzCmboBx, HRISGlobal, PayrollCode, HRISDialogs, SysUtils, UniDBLookupComboBox;

procedure OpenDropdownDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
procedure OpenGridDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
procedure ButtonDown(Sender: TObject);
procedure ButtonUp(Sender: TObject);
procedure ExtendLastColumn(grid: TRzDBGrid); overload;
procedure ExtendLastColumn(grid: TRzStringGrid); overload;
procedure PopulateComboBox(source: TDataSet; comboBox: TRzComboBox;
  const codeField, nameField: string); overload;
procedure PopulatePayrollPeriodComboBox(comboBox: TRzComboBox);
procedure PopulateBranchComboBox(comboBox: TRzComboBox; const viewAllOption: boolean = false);

implementation

procedure OpenDropdownDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
var
  ctrlCnt: integer;
  i: integer;
  ds: TDataSet;
begin
  ctrlCnt := parentCtrl.ComponentCount - 1;
  {$ifndef WEB}
  for i := 0 to ctrlCnt do
  begin
    if parentCtrl.Components[i] is TRzDBLookupComboBox then
    begin
      if (parentCtrl.Components[i] as TRzDBLookupComboBox).DataSource <> nil then
      begin
        ds := (parentCtrl.Components[i] as TRzDBLookupComboBox).ListSource.DataSet;

        ds.Close;

        if open then ds.Open;
      end
    end
  end;
  {$else}
  for i := 0 to ctrlCnt do
  begin
    if parentCtrl.Components[i] is TUniDBLookupComboBox then
    begin
      if (parentCtrl.Components[i] as TUniDBLookupComboBox).DataSource <> nil then
      begin
        ds := (parentCtrl.Components[i] as TUniDBLookupComboBox).ListSource.DataSet;

        ds.Close;

        if open then ds.Open;
      end
    end
  end;
  {$endif}
end;

procedure OpenGridDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
var
  ctrlCnt: integer;
  i: integer;
  ds: TDataSet;
begin
  try
    ctrlCnt := parentCtrl.ControlCount - 1;
    for i := 0 to ctrlCnt do
    begin
      if parentCtrl.Controls[i] is TRzDBGrid then
      begin
        if (parentCtrl.Controls[i] as TRzDBGrid).DataSource <> nil then
        begin
          ds := (parentCtrl.Controls[i] as TRzDBGrid).DataSource.DataSet;

          ds.Close;

          if open then
            ds.Open;
        end
      end
    end;
  except
    on E: Exception do ShowErrorBox(E.Message);
  end;
end;

procedure ButtonDown(Sender: TObject);
begin
  (Sender as TImage).Left := (Sender as TImage).Left + 1;
  (Sender as TImage).Top := (Sender as TImage).Top + 1;
end;

procedure ButtonUp(Sender: TObject);
begin
  (Sender as TImage).Left := (Sender as TImage).Left - 1;
  (Sender as TImage).Top := (Sender as TImage).Top - 1;
end;

procedure ExtendLastColumn(grid: TRzDBGrid);
var
  widths, i: integer;
begin
  widths := 0;

  // get total width
  for i := 0 to grid.Columns.Count - 1 do widths := widths + grid.Columns[i].Width;

  // add extra column
  grid.Columns.Add;

  //extend to the size of the grid
  grid.Columns[grid.Columns.Count - 1].Width := grid.Width - widths + 5;
end;

procedure ExtendLastColumn(grid: TRzStringGrid);
var
  widths, i: integer;
begin
  widths := 0;

  // get total width
  for i := 0 to grid.ColCount - 1 do widths := widths + grid.ColWidths[i];

  // add extra column
  grid.ColCount := grid.ColCount + 1;

  //extend to the size of the grid
  grid.ColWidths[grid.ColCount - 1] := grid.Width - widths - 4;
end;

procedure PopulateComboBox(source: TDataSet; comboBox: TRzComboBox;
  const codeField, nameField: string); overload;
begin
  with source, comboBox do
  begin
    DisableControls;
    while not Eof do
    begin
      AddItemValue(FieldByName(nameField).AsString,FieldByName(codeField).AsString);
      Next;
    end;
    EnableControls;
  end;
end;

procedure PopulatePayrollPeriodComboBox(comboBox: TRzComboBox);
var
  i: integer;
  pc: TPayrollCode;
begin
  with comboBox do
  begin
    for i := 0 to HRIS.ActivePayrollCount - 1 do
    begin
      pc := HRIS.ActivePayrollCodes[i];
      AddObject(pc.Period,TObject(pc));
    end;
    ItemIndex := 0;
  end;
end;

procedure PopulateBranchComboBox(comboBox: TRzComboBox; const viewAllOption: boolean);
var
  i, cnt: integer;
begin
  cnt := HRIS.LocationCount - 1;

  if viewAllOption then comboBox.AddItemValue('- View all -','');

  for i := 0 to cnt do
    comboBox.AddItemValue(HRIS.Locations[i].LocationName,HRIS.Locations[i].LocationCode);

  // set default
  comboBox.FindItem(HRIS.GetLocationNameByCode(HRIS.LocationCode));
end;

end.
