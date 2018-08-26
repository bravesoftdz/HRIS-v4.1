unit PafController;

interface

uses
  Employee, PafRecord, System.Classes, SysUtils, BaseActionIntf, DB, Controls,
  DateUtils, DBUtil;

type
  TPafAction = (paNone,paAdding,paEditing);

  TOnUpdate = procedure of object;

  TChanges = class
  private
    FItems: array of string;

    function GetCount: integer;
    function GetItems(const i: integer): string;

    procedure SetItems(const i: integer; const Value: string);
  public
    property Items[const i: integer]: string  read GetItems write SetItems;
    property Count: integer read GetCount;

    procedure Add(const AChange: string);
    procedure Clear;

    constructor Create;
    destructor Destroy; override;
  end;

  TPafController = class(TInterfacedObject,IBaseAction)
  private
    FEmployee: TEmployee;
    FPaf: TPaf;
    FPafLatest: TPaf;
    FData: TDataModule;
    FAction: TPafAction;
    FOnUpdate: TOnUpdate;
    FChanges: TChanges;
    FStatus: string;

    procedure SaveAllowances;
    procedure SaveComponents;
    procedure Bind;
    procedure FilterAllowanceTypes;
    procedure RemoveDepartmentFilter;
    procedure SetPafEffectiveUntil;
    procedure UpdateEmployee;

    function GetHasChanges: boolean;
    function GetTotalAllowance: currency;
    function GetSummaryOfChanges: string;
    function CheckNewAllowanceComponent: boolean;
    function CheckRemoveAllowanceComponent: boolean;
    function Add: boolean;
    function GetStatus: string;
    function EditAllowed: boolean;
    function CancellationAllowed: boolean;
    function AddingAllowed: boolean;
    function ApprovingAllowed: boolean;
    function ErrorsExists: boolean;
    function AddingAllowanceAllowed: boolean;
    function DeletingAllowanceAllowed: boolean;
    function AllowanceExists(const AType: string): boolean;

  public
    property Employee: TEmployee read FEmployee write FEmployee;
    property Action: TPafAction read FAction write FAction;
    property OnUpdate: TOnUpdate read FOnUpdate write FOnUpdate;
    property HasChanges: boolean read GetHasChanges;
    property TotalAllowance: currency read GetTotalAllowance;
    property SummaryOfChanges: string read GetSummaryOfChanges;
    property Status: string read GetStatus;

    function Save: boolean;
    function Cancel: boolean;
    function Delete: boolean;
    function CheckAllowance: string;

    procedure AddAllowance;
    procedure RemoveAllowance;
    procedure NewAllowance;
    procedure FindEmployee;
    procedure ApprovePaf;
    procedure CancelPaf;
    procedure Retrieve;
    procedure FilterDepartments;

    constructor Create; overload;
    constructor Create(const APafId: integer; AEmployee: TEmployee); overload;
    destructor Destroy; override;
  end;

implementation

{ TPafController }

uses
  PafData, HRISGlobal, HRISDialogs, AllowanceDetails, EmployeeSearch, AppConstants;

function TPafController.Add: boolean;
var
  LAllowance: TAllowance;
  i, cnt: integer;
begin
  FAction := paAdding;
  FPaf.EFfectiveDate := HRIS.CurrentDate;

  Retrieve;

  {$region 'New PAF'}
  with (FData as TdmPaf).dstPaf, FPafLatest do
  begin
    if State = dsInsert then Cancel
    else Open;

    Append;

    FieldByName('id_num').AsString := FEmployee.IdNumber;

    // prepopulate new paf if possible
    if Assigned(FPafLatest) then
    begin
      FieldbyName('position_code').AsString := PositionCode;
      FieldbyName('posstatus_code').AsString := PositionStatusCode;
      FieldbyName('empstatus_code').AsString := EmploymentStatusCode;
      FieldbyName('location_code').AsString := BranchCode;

      if DepartmentCode <> '' then FieldbyName('department_code').AsString := DepartmentCode;

      FieldbyName('salary').AsSingle := Salary;
      FieldbyName('frequency_code').AsString := SalaryFrequencyCode;
      FieldbyName('effective_date').AsDateTime := HRIS.CurrentDate;
    end;
  end;
  {$endregion}

  {$region 'PAF allowances'}
  with (FData as TdmPaf).dstPafAllowances, FPafLatest do
  begin
    // close the dataset to cancel all pending
    Close;

    FPaf.Allowances.Clear;

    Open;

    if Assigned(FPafLatest) and (not FPafLatest.Allowances.IsEmpty) then
    begin
      cnt := FPafLatest.Allowances.Count - 1;
      for i := 0 to cnt do
      begin
        // ALWAYS create an instance of the allowance
        // when the PAF instance is destroyed.. allowances are automatically freed up
        LAllowance := TAllowance.Create;

        LAllowance.AllowanceType := FPafLatest.Allowances.Items[i].AllowanceType;
        LAllowance.Amount := FPafLatest.Allowances.Items[i].Amount;

        Append;
        FieldByName('allowancetype_code').AsString := LAllowance.AllowanceType;
        FieldByName('allowance_amount').AsSingle := LAllowance.Amount;

        FPaf.Allowances.Add(LAllowance);

        Post;
      end;
    end;
  end;
  {$endregion}

  FilterDepartments;

  FOnUpdate;

  Result := true;
end;

procedure TPafController.AddAllowance;
var
  LAllowance: TAllowance;
begin
  if AddingAllowanceAllowed then
  begin
    with TfrmAllowanceDetails.Create(nil,self) do
    begin
      FilterAllowanceTypes;

      (FData as TdmPaf).dstPafAllowances.Append;

      ShowModal;

      if ModalResult = mrOk then
      begin
        (FData as TdmPaf).dstPafAllowances.Post;

        LAllowance := TAllowance.Create;
        LAllowance.AllowanceType := (FData as TdmPaf).dstPafAllowances.FieldByName('allowancetype_code').AsString;
        LAllowance.Expiry := (FData as TdmPaf).dstPafAllowances.FieldByName('expiry_date').AsDateTime;
        LAllowance.Amount := (FData as TdmPaf).dstPafAllowances.FieldByName('allowance_amount').AsSingle;

        FPaf.Allowances.Add(LAllowance);

        FOnUpdate;
      end
      else (FData as TdmPaf).dstPafAllowances.Cancel;

      Free;
    end;
  end;
end;

function TPafController.AddingAllowanceAllowed: boolean;
begin
  Result := (Assigned(FEmployee)) and (FPaf.StatusCode <> PAF_STATUS_APPROVED)
    and (not FPaf.Cancelled);
end;

function TPafController.AddingAllowed: boolean;
begin
  Result := FEmployee.IdNumber <> HRIS.User.UserId;
  if not Result then ShowErrorBox2('Self-creation of PAF is not allowed.');
end;

function TPafController.AllowanceExists(const AType: string): boolean;
var
  i, cnt: integer;
  LAllowance: TAllowance;
begin
  Result := true;

  cnt := FPaf.Allowances.Count - 1;

  for i := 0 to cnt do
  begin
    LAllowance := FPaf.Allowances.Items[i];
    if LAllowance.AllowanceType = AType then Exit;
  end;

  Result := false;
end;

procedure TPafController.ApprovePaf;
begin
  with (FData as TdmPaf).dstPaf do
  begin
    if ApprovingAllowed then
      if HasChanges then
      begin
        if ShowDecisionBox2('Approving this PAF restricts making changes to it. Do you want to continue?') = mrYes then
        begin
          Edit;
          FieldByName('pafstatus_code').AsString := PAF_STATUS_APPROVED;
          Post;

          FPaf.StatusCode := FieldByName('pafstatus_code').AsString;

          FOnUpdate;
        end;
      end
      else ShowErrorBox2('No changes have been made to this PAF.');
  end;
end;

function TPafController.ApprovingAllowed: boolean;
var
  error: string;
  hasRight: boolean;
begin
  Result := false;

  if Assigned(FEmployee) then
  begin
    error := '';
    hasRight := true;

    if not HRIS.User.HasRights([PRIV_PAF_APPROVE],true) then
    begin
      Result := false;
      Exit;
    end
    else if FPaf.Cancelled then  error := 'Cannot approve a cancelled PAF.'
    else if FPaf.StatusCode = PAF_STATUS_APPROVED then error := 'PAF record has already been approved.';

    Result := (error = '') and (hasRight);

    if error <> '' then ShowErrorBox2(error);
  end;
end;

procedure TPafController.Bind;
var
  i: integer;
begin
  with (FData as TdmPaf).dstPaf, FPaf do
  begin
    // iterate thru all the fields and transfer focus control to effect changes
    if FAction = paAdding then
    begin
      for i := 0 to Fields.Count - 1 do Fields[i].FocusControl;
      FieldByName('effective_date').FocusControl;
    end;

    Id := FieldbyName('paf_id').AsInteger;
    PositionCode := FieldbyName('position_code').AsString;
    PositionStatusCode := FieldbyName('posstatus_code').AsString;
    EmploymentStatusCode := FieldbyName('empstatus_code').AsString;
    BranchCode := FieldbyName('location_code').AsString;
    DepartmentCode := FieldbyName('department_code').AsString;
    Salary := FieldbyName('salary').AsSingle;
    SalaryFrequencyCode := FieldbyName('frequency_code').AsString;
    EffectiveDate := FieldbyName('effective_date').AsDateTime;
    EffectiveUntil := FieldbyName('effective_until').AsDateTime;
    StatusCode := FieldbyName('pafstatus_code').AsString;

  end;
end;

function TPafController.Cancel: boolean;
begin
  Result := false;

  with (FData as TdmPaf) do
  begin
    dstPaf.Cancel;

    if dstPafComp.Modified then dstPafComp.CancelBatch;

    if dstPafAllowances.Modified then dstPafAllowances.CancelBatch;
  end;

  Result := true;
end;

function TPafController.CancellationAllowed: boolean;
var
  error: string;
  hasRight: boolean;
begin
  Result := false;

  if Assigned(FEmployee) then
  begin
    error := '';
    hasRight := true;

    if not HRIS.User.HasRights([PRIV_PAF_CANCEL],true) then Exit
    else if FPaf.Cancelled then  error := 'PAF has already been cancelled.';

    Result := (error = '') and (hasRight);

    if error <> '' then ShowErrorBox2(error);
  end;
end;

procedure TPafController.CancelPaf;
begin
  with (FData as TdmPaf).dstPaf do
  begin
    if CancellationAllowed then
      if ShowDecisionBox2('Are you sure you want to CANCEL this PAF?') = mrYes then
      begin
        Edit;
        FieldByName('is_cancelled').AsInteger := 1;
        SetModifiedFields((FData as TdmPaf).dstPaf);
        Post;

        FPaf.IsCancelled := FieldByName('is_cancelled').AsInteger;
        Bind;
        FOnUpdate;
      end;
  end;
end;

function TPafController.CheckAllowance: string;
var
  i: integer;
  LType: string;
begin
  Result := '';

  with (FData as TdmPaf).dstPafAllowances do
  begin
    // iterate thru all the fields and transfer focus control to effect changes
    for i := 0 to Fields.Count - 1 do Fields[i].FocusControl;

    // iterate thru all the fields and check for required
    for i := 0 to Fields.Count - 1 do
    begin
      if (Fields[i].Required) and (Fields[i].IsNull) then
      begin
        Result := Fields[i].DisplayLabel + ' is required.';
        Fields[i].FocusControl;
        Exit;
      end;
    end;

    // check if allowance already exists
    LType := FieldByName('allowancetype_code').AsString;
    if AllowanceExists(LType) then Result := 'Allowance already exists.';
  end;
end;

function TPafController.CheckNewAllowanceComponent: boolean;
var
  LAllowance, LAllowance2: TAllowance;
  i, cnt: integer;
  i2, cnt2: integer;
  allowanceExists: boolean;
begin
  // this routine checks for new allowances added to this PAF entry
  Result := false;

  cnt := FPaf.Allowances.Count - 1;

  i := 0;

  allowanceExists := false;

  while (i <= cnt) and (not allowanceExists) do
  begin
    LAllowance := FPaf.Allowances.Items[i];

    cnt2 := FPafLatest.Allowances.Count - 1;

    i2 := 0;

    allowanceExists := false;

    while (i2 <= cnt2) and (not allowanceExists) do
    begin
      LAllowance2 := FPafLatest.Allowances.Items[i2];
      if LAllowance2.AllowanceType = LAllowance.AllowanceType then allowanceExists := true;
      Inc(i2);
    end;

    // if not allowanceExists then Result := true;

    Inc(i);
  end;

  Result := (not allowanceExists) and (FPaf.Allowances.Count > 0);
end;

function TPafController.CheckRemoveAllowanceComponent: boolean;
var
  LAllowance, LAllowance2: TAllowance;
  i, cnt: integer;
  i2, cnt2: integer;
  allowanceExists: boolean;
begin
  // this routine checks for new allowances added to this PAF entry
  Result := false;

  cnt := FPafLatest.Allowances.Count - 1;

  i := 0;

  allowanceExists := false;

  while (i <= cnt) and (not allowanceExists) do
  begin
    LAllowance := FPafLatest.Allowances.Items[i];

    cnt2 := FPaf.Allowances.Count - 1;

    i2 := 0;

    allowanceExists := false;

    while (i2 <= cnt2) and (not allowanceExists) do
    begin
      LAllowance2 := FPaf.Allowances.Items[i2];
      if LAllowance2.AllowanceType = LAllowance.AllowanceType then allowanceExists := true;
      Inc(i2);
    end;

    // if not allowanceExists then Result := true;

    Inc(i);
  end;

  Result := (not allowanceExists) and (FPafLatest.Allowances.Count > 0);
end;

constructor TPafController.Create(const APafId: integer; AEmployee: TEmployee);
begin
  Create;
  FPaf.Id := APafId;
  FEmployee := AEmployee;
  FAction := paEditing;
end;

constructor TPafController.Create;
begin
  FData := TdmPaf.Create(nil);
  FPaf := TPaf.Create;
end;

function TPafController.Delete: boolean;
begin
  Result := true;
end;

function TPafController.DeletingAllowanceAllowed: boolean;
begin
  Result := (FPaf.StatusCode <> PAF_STATUS_APPROVED) and (not FPaf.Cancelled);
end;

destructor TPafController.Destroy;
begin
  // Cancel all pending changes
  Cancel;

  if Assigned(FEmployee) then FreeAndNil(FEmployee);
  if Assigned(FPaf) then FreeAndNil(FPaf);
  if Assigned(FPafLatest) then FreeAndNil(FPafLatest);

  FreeAndNil(FData);

  if Assigned(FChanges) then FreeAndNil(FChanges);
  inherited;
end;

function TPafController.EditAllowed: boolean;
var
  hasRight: boolean;
begin
  Result := false;

  hasRight := HRIS.User.HasRights([PRIV_PAF_EDIT],true);

  if hasRight then
  begin
    Result := (Assigned(FEmployee))
            and (FPaf.StatusCode = PAF_STATUS_PENDING);

    if not Result then ShowErrorBox2('Editing this PAF is restricted.');
  end;
end;

function TPafController.ErrorsExists: boolean;
var
  i: integer;
  error: string;
begin
  Result := true;

  with (FData as TdmPaf).dstPaf do
  begin
    // iterate thru all the fields and transfer focus control to effect changes
    for i := 0 to Fields.Count - 1 do Fields[i].FocusControl;

    // check for selected employee
    if not Assigned(FEmployee) then
    begin
      error := 'No employee selected.';
      ShowErrorBox2(error);
      Exit;
    end;

    // iterate thru all the fields and check for required
    for i := 0 to Fields.Count - 1 do
    begin
      if (Fields[i].Required) and (Fields[i].IsNull) then
      begin
        error := Fields[i].DisplayLabel + ' is required.';
        Fields[i].FocusControl;
        ShowErrorBox2(error);
        Fields[i].FocusControl;
        Exit;
      end;
    end;

    if not FieldByName('effective_until').IsNull then
      if CompareDate(FieldByName('effective_date').AsDateTime,
        FieldByName('effective_until').AsDateTime) in [0,1] then
      begin
        error := 'Invalid value for effective dates.';
        ShowErrorBox2(error);
        Exit;
      end;
  end;

  Result := false;
end;

procedure TPafController.FilterAllowanceTypes;
begin
  // filter types depending on branch (location_code)
  with (FData as TdmPaf).dstAllowanceTypes do
  begin
    Bind;
    Filter := 'location_code = ' + QuotedStr(FPaf.BranchCode)
  end;
end;

procedure TPafController.FilterDepartments;
begin
  // filter types depending on branch (location_code)
  with (FData as TdmPaf).dstDepartments do
  begin
    Bind;
    Filter := 'location_code = ' + QuotedStr(FPaf.BranchCode)
  end;
end;

procedure TPafController.FindEmployee;
var
  LEmployee: TEmployee;
begin
  if (FPaf.StatusCode <> PAF_STATUS_APPROVED) and (FPaf.StatusCode <> PAF_STATUS_PENDING) then
  begin
    LEmployee := TEmployee.Create;

    with TfrmEmployeeSearch.Create(nil,LEmployee) do
    try
      ShowModal;
      if ModalResult = mrOK  then
      begin
        FEmployee := LEmployee;
        if AddingAllowed then
        begin
          Add;
          FOnUpdate;
        end
        else FreeAndNil(FEmployee);
      end
      else FreeAndNil(LEmployee);
    finally
      Free;
    end;
  end;
end;

function TPafController.GetSummaryOfChanges: string;
var
  changes: TStringList;
  change: string;
begin
  Result := '';

  changes := TStringList.Create;
  try
    if Assigned(FPafLatest) and (not FPaf.IsNew) then
    begin
      // position
      if FPaf.PositionCode <> FPafLatest.PositionCode then changes.Add('Changed position');
      // position status
      if FPaf.PositionStatusCode <> FPafLatest.PositionStatusCode then changes.Add('Changed position status');
      // employment status
      if FPaf.EmploymentStatusCode <> FPafLatest.EmploymentStatusCode then changes.Add('Changed employment status');
      // transfer
      if FPaf.BranchCode <> FPafLatest.BranchCode then changes.Add('Branch transfer');
      // salary adjustment
      if FPaf.Salary <> FPafLatest.Salary then changes.Add('Salary adjustment');
      // add allowance
      if CheckNewAllowanceComponent then changes.Add('Added allowance');
      // remove allowance
      if CheckRemoveAllowanceComponent then changes.Add('Removed allowance');
    end
    else if not Assigned(FPafLatest) then changes.Add('Initial PAF');

    // construct the text
    for change in changes do Result := Result + change + #13#10#13#10;
  finally
    changes.Free;
  end;
end;

function TPafController.GetHasChanges: boolean;
begin
  Result := GetSummaryOfChanges <> '';
end;

function TPafController.GetStatus: string;
begin
  Result := FPaf.Status;
end;

function TPafController.GetTotalAllowance: currency;
begin
  Result := FPaf.Allowances.Total;
end;

procedure TPafController.NewAllowance;
begin

end;

procedure TPafController.RemoveAllowance;
var
  LType: string;
begin
  with (FData as TdmPaf).dstPafAllowances do
  begin
    if DeletingAllowanceAllowed then
    begin
      if RecordCount > 0 then
      begin
        LType := FieldByName('allowancetype_code').AsString;
        FPaf.Allowances.Remove(LType);

        // remove from dataset
        Delete;

        FOnUpdate;
      end;
    end;
  end;
end;

procedure TPafController.RemoveDepartmentFilter;
begin
  // filter types depending on branch (location_code)
  with (FData as TdmPaf).dstDepartments do
  begin
    if Active then
    begin
      Filter := '';
      First;
    end;
  end;
end;

procedure TPafController.Retrieve;
var
  LAllowance: TAllowance;
begin
  // destroy every time
  if Assigned(FPafLatest) then FreeAndNil(FPafLatest);

  RemoveDepartmentFilter;

  if FAction = paEditing then
  begin
    {$region 'Current PAF'}
    with (FData as TdmPaf).dstPaf do
    begin
      try
        Parameters.ParamByName('@paf_id').Value := FPaf.Id;
        Open;
        Bind;
      finally

      end;
    end;
    {$endregion}

    {$region 'Allowances'}
    with (FData as TdmPaf).dstPafAllowances do
    begin
      try
        Parameters.ParamByName('@paf_id').Value := FPaf.Id;
        Open;

        if RecordCount > 0 then
        begin
          while not Eof do
          begin
            LAllowance := TAllowance.Create;
            LAllowance.AllowanceType := FieldByName('allowancetype_code').AsString;
            LAllowance.Expiry := FieldByName('expiry_date').AsDateTime;
            LAllowance.Amount := FieldByName('allowance_amount').AsSingle;

            FPaf.Allowances.Add(LAllowance);

            Next;
          end;
        end;
      finally

      end;
    end;
    {$endregion}
  end;

  {$region 'Latest PAF'}
  with (FData as TdmPaf).dstLatestPaf do
  begin
    try
      Parameters.ParamByName('@id_num').Value := FEmployee.IdNumber;
      Parameters.ParamByName('@as_of_date').Value := FPaf.EffectiveDate;
      Open;

      if RecordCount <> 0 then
      begin
        FPafLatest := TPaf.Create;

        with FPafLatest do
        begin
          Id := FieldbyName('paf_id').AsInteger;
          PositionCode := FieldbyName('position_code').AsString;
          PositionStatusCode := FieldbyName('posstatus_code').AsString;
          EmploymentStatusCode := FieldbyName('empstatus_code').AsString;
          BranchCode := FieldbyName('location_code').AsString;
          DepartmentCode := FieldbyName('department_code').AsString;
          Salary := FieldbyName('salary').AsSingle;
          SalaryFrequencyCode := FieldbyName('frequency_code').AsString;
          EffectiveDate := FieldbyName('effective_date').AsDateTime;
          EffectiveUntil := FieldbyName('effective_until').AsDateTime;
          StatusCode := FieldbyName('pafstatus_code').AsString;
        end;
      end;

    finally
      Close;
    end;
  end;
  {$endregion}

  {$region 'Latest allowances'}
  if Assigned(FPafLatest) then
  begin
    with (FData as TdmPaf).dstLatestPafAllowances do
    begin
      try
        Parameters.ParamByName('@paf_id').Value := FPafLatest.Id;
        Open;

        if RecordCount > 0 then
        begin
          while not Eof do
          begin
            LAllowance := TAllowance.Create;
            LAllowance.AllowanceType := FieldByName('allowancetype_code').AsString;
            LAllowance.Expiry := FieldByName('expiry_date').AsDateTime;
            LAllowance.Amount := FieldByName('allowance_amount').AsSingle;

            FPafLatest.Allowances.Add(LAllowance);

            Next;
          end;
        end;
      finally
        Close;
      end;
    end;
  end;
  {$endregion}
end;

function TPafController.Save: boolean;
begin
  Result := false;
  try
    Bind;

    if ErrorsExists then Exit;

    if FPaf.StatusCode = PAF_STATUS_APPROVED then
      if ShowDecisionBox2('PAF has been approved. Do you want to continue saving the changes?') <> mrYes then
      begin
        Cancel;
        Exit;
      end;

    with (FData as TdmPaf).dstPaf do
    begin
      if FAction = paAdding then SetCreatedFields((FData as TdmPaf).dstPaf);

      if Modified then
      begin
        Post;
        Refresh;
      end;

      FPaf.Id := FieldByName('paf_id').AsInteger;
      FPaf.StatusCode := FieldByName('pafstatus_code').AsString;
    end;

    SaveAllowances;

    // SaveComponents;

    // set effective until field of last recorded paf
    SetPafEffectiveUntil;

    // update employee record
    if FPaf.StatusCode = PAF_STATUS_APPROVED then UpdateEmployee;

    Result := true;

    FOnUpdate;
  except
    on E: Exception do ShowErrorBox2(E.Message);
  end;
end;

procedure TPafController.SaveAllowances;
begin
  with (FData as TdmPaf).dstPafAllowances do
  begin
    DisableControls;
    First;

    while not Eof do
    begin
      Edit;
      FieldByName('paf_id').AsInteger := FPaf.Id;
      Next;
    end;

    UpdateBatch;
    EnableControls;
  end;
end;

procedure TPafController.SaveComponents;
var
  comps: TStringList;
  comp: string;
begin
  comps := TStringList.Create;
  try
    // position
    if FPaf.PositionCode <> FPafLatest.PositionCode then comps.Add('CHP');
    // position status
    if FPaf.PositionStatusCode <> FPafLatest.PositionStatusCode then comps.Add('CPS');
    // employment status
    if FPaf.EmploymentStatusCode <> FPafLatest.EmploymentStatusCode then comps.Add('CES');
    // transfer
    if FPaf.BranchCode <> FPafLatest.BranchCode then comps.Add('TRF');
    // salary adjustment
    if FPaf.Salary <> FPafLatest.Salary then comps.Add('SAD');
    // add allowance
    if CheckNewAllowanceComponent then comps.Add('AAL');
    // remove allowance
    if CheckRemoveAllowanceComponent then comps.Add('RAL');

    with (FData as TdmPaf).dstPafComp do
    begin
      Open;

      for comp in comps do
      begin
        Append;
        FieldByName('paf_id').AsInteger := FPaf.Id;
        FieldByName('pafcomp_type_code').AsString := comp;
        Post;
      end;

      UpdateBatch;

      Close;
    end;
  finally
    comps.Free;
  end;
end;

procedure TPafController.SetPafEffectiveUntil;
begin
  with (FData as TdmPaf).spPafEffectiveUntil do
  begin
    Parameters.ParamByName('@id_num').Value := FEmployee.IdNumber;
    ExecProc;
  end;
end;

procedure TPafController.UpdateEmployee;
begin
  with (FData as TdmPaf).spPafEffectiveUntil do
  begin
    Parameters.ParamByName('@id_num').Value := FEmployee.IdNumber;
    ExecProc;
  end;
end;

{ TChanges }

procedure TChanges.Add(const AChange: string);
begin
  SetLength(FItems,Length(FItems)+1);
  FItems[Length(FItems)-1] := AChange;
end;

procedure TChanges.Clear;
var
  i, cnt: integer;
begin
  cnt := GetCount - 1;
  for i := 0 to cnt do FreeAndNil(FItems[i]);
  SetLength(FItems,0);
end;

constructor TChanges.Create;
begin
  SetLength(FItems,0);
end;

destructor TChanges.Destroy;
begin
  Clear;
  inherited;
end;

function TChanges.GetCount: integer;
begin
  Result := Length(FItems);
end;

function TChanges.GetItems(const i: integer): string;
begin
  Result := FItems[i];
end;

procedure TChanges.SetItems(const i: integer; const Value: string);
begin
  FItems[i] := Value;
end;


end.
