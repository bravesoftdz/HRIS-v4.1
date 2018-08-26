unit DockIntf;

interface

type
  TForms = (fmNone, fmEmployeeDrawer,fmPaf,fmPendingPaf,fmTimelogYear,
    fmUndertime,fmForApproval,fmSynchronisation,fmTimelogPayPeriod,fmSettings,
    fmSecurity,fmLeaveMain);

  IDock = Interface(IInterface)
    ['{4D2068E2-715C-42F1-BA30-AC450E95F023}']
    procedure DockForm(const fm: TForms; AObject: TObject = nil); overload;
    procedure DockForm(const fm: TForms; const title: string = ''); overload;
  End;

implementation

end.
