unit Leave;

interface

uses
  SysUtils, Employee;

type
  TLeave = class
  private
    FAmPm: string;
    FLeaveType: string;
    FLeaveTypeName: string;
    FReason: string;
    FRemarks: string;
    FIsPaid: boolean;

    function GetHalfDay: boolean;
    function GetIsBusinessTrip: boolean;
    function GetPaidDescription: string;
    function GetIsAfternoon: boolean;
    function GetIsMorning: boolean;
    function GetIsWholeDay: boolean;

  public
    property AmPm: string read FAmPm write FAmPm;
    property LeaveType: string read FLeaveType write FLeaveType;
    property LeaveTypeName: string read FLeaveTypeName write FLeaveTypeName;
    property IsHalfDay: boolean read GetHalfDay;
    property Reason: string read FReason write FReason;
    property Remarks: string read FRemarks write FRemarks;
    property IsBusinessTrip: boolean read GetIsBusinessTrip;
    property IsPaid: boolean read FIsPaid write FIsPaid;
    property PaidDescription: string read GetPaidDescription;
    property IsWholeDay: boolean read GetIsWholeDay;
    property IsMorning: boolean read GetIsMorning;
    property IsAfternoon: boolean read GetIsAfternoon;

    constructor Create; overload;
    constructor Create(const ap, tp, nm, rs, rm: string; const ip: boolean); reintroduce; overload;
  end;

  TEmployeeLeave = class(TLeave)
  private
    FDate: TDateTime;
    FEmployee: TBaseEmployeeExt;
    FStatus: string;
    function GetIsApproved: boolean;
    function GetIsCancelled: boolean;
    function GetIsPending: boolean;

  public
    property Employee: TBaseEmployeeExt read FEmployee write FEmployee;
    property Date: TDateTime read FDate write FDate;
    property Status: string write FStatus;
    property IsPending: boolean read GetIsPending;
    property IsApproved: boolean read GetIsApproved;
    property IsCancelled: boolean read GetIsCancelled;
  end;

implementation

constructor TLeave.Create(const ap, tp, nm, rs, rm: string; const ip: boolean);
begin
  FAmPm := ap;
  FLeaveType := tp;
  FLeaveTypeName := nm;
  FReason := rs;
  FRemarks := rm;
  FIsPaid := ip;
end;

constructor TLeave.Create;
begin

end;

function TLeave.GetHalfDay;
begin
  Result := FAmPM <> '';
end;

function TLeave.GetIsAfternoon: boolean;
begin
  Result := FAmPm = 'P';
end;

function TLeave.GetIsBusinessTrip: boolean;
begin
  Result := Trim(FLeaveType) = 'BT';
end;

function TLeave.GetIsMorning: boolean;
begin
  Result := FAmPm = 'A';
end;

function TLeave.GetIsWholeDay: boolean;
begin
  Result := FAmPm = '';
end;

function TLeave.GetPaidDescription: string;
begin
  if FIsPaid then Result := 'Yes'
  else Result := 'No';
end;

{ TEmployeeLeave }

function TEmployeeLeave.GetIsApproved: boolean;
begin
  Result := FStatus = 'APP';
end;

function TEmployeeLeave.GetIsCancelled: boolean;
begin
  Result := FStatus = 'CNL';
end;

function TEmployeeLeave.GetIsPending: boolean;
begin
  Result := FStatus = 'PND'
end;

end.
