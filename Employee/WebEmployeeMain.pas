unit WebEmployeeMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniLabel, uniGUIBaseClasses, uniEdit, uniDBEdit,
  uniPanel, uniMemo, uniDBMemo, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker, Employee;

type
  TEmployeeMainFrame = class(TUniFrame)
    UniDBEdit1: TUniDBEdit;
    UniLabel1: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel2: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel3: TUniLabel;
    CaptionPanel: TUniSimplePanel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniSimplePanel1: TUniSimplePanel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    UniDBMemo1: TUniDBMemo;
    UniDBLookupComboBox2: TUniDBLookupComboBox;
    UniDBLookupComboBox3: TUniDBLookupComboBox;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniDBEdit4: TUniDBEdit;
    UniLabel12: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniSimplePanel2: TUniSimplePanel;
    UniLabel15: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    UniLabel16: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    UniLabel17: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    UniLabel18: TUniLabel;
    UniSimplePanel3: TUniSimplePanel;
    UniLabel19: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniLabel20: TUniLabel;
    UniDBEdit11: TUniDBEdit;
    UniLabel21: TUniLabel;
    UniDBLookupComboBox4: TUniDBLookupComboBox;
    lblAge: TUniLabel;
    lblHeight: TUniLabel;
    lblWeight: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
    FEmployee: TEmployee;
    procedure RefreshForm;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const AEmployee: TEmployee); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  EmployeeData, FormsUtil;

constructor TEmployeeMainFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

constructor TEmployeeMainFrame.Create(AOwner: TComponent;
  const AEmployee: TEmployee);
begin
  inherited Create(AOwner);
  FEmployee := AEmployee;
  FEmployee.OnUpdate := RefreshForm;
end;

procedure TEmployeeMainFrame.RefreshForm;
begin
  lblAge.Caption := 'Age: ' + IntToStr(FEmployee.Age);
  lblHeight.Caption := FEmployee.HeightInFeetAndInches;
  lblWeight.Caption := FEmployee.WeightInKilos;
end;

procedure TEmployeeMainFrame.UniFrameCreate(Sender: TObject);
begin
  OpenDropdownDataSources(self);
  RefreshForm;
end;

end.
