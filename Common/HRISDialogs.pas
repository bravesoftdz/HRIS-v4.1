unit HRISDialogs;

interface

uses InfoBox, InfoBox2, ErrorBox, ConfBox, DecisionBox, WarningBox, ConfBox2, ErrorBox2,
  DecisionBox2;

procedure ShowInfoBox(const info: string);
procedure ShowInfoBox2(const info: string);
procedure ShowErrorBox(const error: string);
procedure ShowErrorBox2(const error: string);
procedure ShowConfirmationBox(const conf: string = 'Changes have been saved successfully.');
procedure ShowConfirmationBox2(const conf: string = 'Changes have been saved successfully.');
function ShowDecisionBox(const confMessage: string): integer;
function ShowDecisionBox2(const confMessage: string): integer;
function ShowWarningBox(const confMessage: string): integer;

implementation

procedure ShowInfoBox(const info: string);
begin
  with TfrmInfoBox.Create(nil,info) do
  try
    ShowModal;
  finally
    Free;
  end
end;

procedure ShowInfoBox2(const info: string);
begin
  with TfrmInfoBox2.Create(nil,info) do
  try
    ShowModal;
  finally
    Free;
  end
end;

procedure ShowErrorBox(const error: string);
begin
  with TfrmErrorBox.Create(nil,error) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure ShowErrorBox2(const error: string);
begin
  with TfrmErrorBox2.Create(nil,error) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure ShowConfirmationBox(const conf: string);
begin
  with TfrmConfBox.Create(nil,conf) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure ShowConfirmationBox2(const conf: string);
begin
  with TfrmConfBox2.Create(nil,conf) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

function ShowDecisionBox(const confMessage: string): integer;
begin
  with TfrmDecisionBox.Create(nil,confMessage) do
  try
    ShowModal;
    Result := Integer(ModalResult);
  finally
    Free;
  end;
end;

function ShowDecisionBox2(const confMessage: string): integer;
begin
  with TfrmDecisionBox2.Create(nil,confMessage) do
  try
    ShowModal;
    Result := Integer(ModalResult);
  finally
    Free;
  end;
end;

function ShowWarningBox(const confMessage: string): integer;
begin
  with TfrmWarningBox.Create(nil,confMessage) do
  try
    ShowModal;
    Result := Integer(ModalResult);
  finally
    Free;
  end;
end;

end.
