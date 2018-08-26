unit EmployeeController;

interface

uses
  SysUtils, Employee, BaseActionIntf, Classes, DB, ADODB, StrUtils, Forms;

type
  TEmployeeAction = (eaInserting,eaEditing);

  TSelected = (sdNone,sdMain,sdAddressAndContact,sdFamily,sdPAF,sdPayroll,sdPhoto);

  TSelectionChanged = procedure of object;

  TEmployeeController = class(TInterfacedObject,IBaseAction)
  private
    FData: TDataModule;
    FEmployee: TEmployee;
    FSelected: TSelected;
    FSelectionChanged: TSelectionChanged;
    FEmployeeAction: TEmployeeAction;

    procedure OnChange;
    procedure Bind;
    function GetNew: boolean;

    function GetIsEditing: boolean;
    function ErrorsExists: boolean;
  public
    property Employee: TEmployee read FEmployee write FEmployee;
    property Selected: TSelected write FSelected default sdMain;
    property OnSelectionChanged: TSelectionChanged read FSelectionChanged;
    property Action: TEmployeeAction read FEmployeeAction write FEmployeeAction;
    property IsEditing: boolean read GetIsEditing;

    function Save: boolean;
    function Add: boolean;
    function Cancel: boolean;
    function Delete: boolean;

    procedure Retrieve;
    procedure AddDetail;
    procedure OpenPaf;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TEmployeeController }

uses
  EmployeeData, HRISDialogs, PafController, PafMain,
  DockIntf, MainModule;

function TEmployeeController.Add: boolean;
begin
  with (FData as TdmEmployee).dstEmployee do
  begin
    Open;
    Append;
    FEmployeeAction := eaInserting;
  end;

  Result := true;
end;

procedure TEmployeeController.AddDetail;
var
  i, LTag: integer;
begin
  with (FData as TdmEmployee) do
  begin
    LTag := Integer(FSelected);
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag = LTag then
        begin
          (Components[i] as TADODataSet).Append;
          (Components[i] as TADODataSet).Fields[0].FocusControl;
        end;
    end;
  end;
end;

procedure TEmployeeController.Bind;
begin
  // bind the values to this object
  with (FData as TdmEmployee).dstEmployee do
  begin
    if not Assigned(FEmployee) then FEmployee := TEmployee.Create;

    FEmployee.IdNumber := FieldByName('id_num').AsString;
    FEmployee.LastName := FieldByName('employee_lastname').AsString;
    FEmployee.FirstName := FieldByName('employee_firstname').AsString;

    if not FieldByName('birth_date').IsNull then FEmployee.BirthDate := FieldByName('birth_date').AsDateTime;

    FEmployee.Height := FieldByName('height').AsInteger;
    FEmployee.Weight := FieldByName('weight').AsInteger;
  end;
end;

function TEmployeeController.Cancel: boolean;
var
  i: integer;
begin
  with (FData as TdmEmployee) do
  begin
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
          (Components[i] as TADODataSet).Cancel
    end;
  end;

  Result := true;
end;

constructor TEmployeeController.Create;
begin
  inherited;
  {$ifdef WEB}
  FData := TdmEmployee.Create(nil,UniMainModule.MainConnection);
  {$else}
  FData := TdmEmployee.Create(nil);
  {$endif}
  FEmployee := TEmployee.Create;
  FSelectionChanged := OnChange;
end;

function TEmployeeController.Delete: boolean;
begin

end;

destructor TEmployeeController.Destroy;
begin
  FreeAndNil(FEmployee);
  FreeAndNil(FData);
  inherited;
end;

function TEmployeeController.ErrorsExists: boolean;
var
  error: string;
  i, f, LTag: integer;
begin
  Result := true;

  with (FData as TdmEmployee) do
  begin
    LTag := Integer(FSelected);
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag = LTag then
        begin
          // iterate thru all the fields and transfer focus control to effect changes
          for f := 0 to (Components[i] as TADODataSet).Fields.Count - 1 do
             (Components[i] as TADODataSet).Fields[f].FocusControl;

          // iterate thru all the fields and check for required
          for f := 0 to (Components[i] as TADODataSet).Fields.Count - 1 do
          begin
            if ((Components[i] as TADODataSet).Fields[f].Required)
             and ((Components[i] as TADODataSet).Fields[f].IsNull) then
            begin
              error := (Components[i] as TADODataSet).Fields[f].DisplayLabel + ' is required.';
              ShowErrorBox2(error);
              (Components[i] as TADODataSet).Fields[f].FocusControl;
              Exit;
            end;
          end;
        end;
    end;
  end;

  Result := false;
end;

function TEmployeeController.GetIsEditing: boolean;
begin
  Result := FEmployeeAction = eaEditing;
end;

function TEmployeeController.GetNew: boolean;
begin
  Result := not Assigned(FEmployee);
end;

procedure TEmployeeController.OnChange;
var
  i, LTag: integer;
begin
  with (FData as TdmEmployee) do
  begin
    LTag := Integer(FSelected);

    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
      begin
        if (Components[i] as TADODataSet).Active then
        begin
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
            (Components[i] as TADODataSet).Cancel
        end
        else
        begin
           if (Components[i] as TADODataSet).Tag = LTag then
           begin
             // set parameter
             if Assigned(FEmployee) then (Components[i] as TADODataSet).Parameters.ParamByName('@id_num').Value := FEmployee.IdNumber;

             (Components[i] as TADODataSet).Open;
             if (Components[i] as TADODataSet).RecordCount = 0 then
               if not ((Components[i] as TADODataSet).LockType = ltReadOnly) then
                 (Components[i] as TADODataSet).Append;

             if FSelected = sdMain then
             begin
               Bind;

               if Assigned(FEmployee.OnUpdate) then FEmployee.OnUpdate;
             end;

           end;
        end;
      end;
    end;
  end;
end;

procedure TEmployeeController.OpenPaf;
var
  intf: IDock;
  pafId: integer;
  pafController: TPafController;
  LEmployee: TEmployee;
begin
  inherited;
  if Supports(Application.MainForm,IDock,intf) then
  begin
    pafId := (FData as TdmEmployee).dstPaf.FieldbyName('paf_id').AsInteger;

    with FEmployee do
    begin
      LEmployee := TEmployee.Create;
      LEmployee.IdNumber := IdNumber;
      LEmployee.LastName := LastName;
      LEmployee.FirstName := FirstName;
    end;

    pafController := TPafController.Create(pafId,LEmployee);

    intf.DockForm(fmPaf,pafController);
  end;
end;

procedure TEmployeeController.Retrieve;
var
  i, LTag: integer;
begin
  with (FData as TdmEmployee) do
  begin
    LTag := Integer(FSelected);
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TADODataSet then
        if (Components[i] as TADODataSet).Tag = LTag then
          (Components[i] as TADODataSet).Open;
    end;
  end;
end;

function TEmployeeController.Save: boolean;
var
  i: integer;
begin
  Result := false;
  try
    if ErrorsExists then Exit;

    with (FData as TdmEmployee) do
    begin
      for i := 0 to ComponentCount - 1 do
      begin
        if Components[i] is TADODataSet then
          if (Components[i] as TADODataSet).State in [dsInsert,dsEdit] then
          begin
            if (Components[i] as TADODataSet).State = dsInsert then
              if FSelected <> sdMain then
                (Components[i] as TADODataSet).FieldByName('id_num').AsString := FEmployee.IdNumber;
            (Components[i] as TADODataSet).Post
          end;
      end;

      Bind;
      FEmployeeAction := eaEditing;
      Result := true;

      if Assigned(FEmployee.OnUpdate) then FEmployee.OnUpdate;
    end;
  except
    on E: Exception do
    begin
      if FSelected = sdMain then
      begin
        if AnsiContainsStr(UpperCase(E.Message),'PRIMARY') then
          ShowErrorBox2('Identification number already exists.');
      end
      else ShowErrorBox2(E.Message);

      Abort;
    end;
  end;
end;

end.
