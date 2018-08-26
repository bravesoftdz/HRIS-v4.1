unit WebFamilyAndRelatives;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, EmployeeController, uniLabel, uniEdit, uniDBEdit, uniCheckBox,
  uniDBCheckBox, uniDateTimePicker, uniDBDateTimePicker, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox;

type
  TFamilyAndRelativesFrame = class(TUniFrame)
    DetailPanel: TUniSimplePanel;
    ListGrid: TUniDBGrid;
    UniDBEdit1: TUniDBEdit;
    UniLabel1: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel2: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniLabel7: TUniLabel;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel4: TUniLabel;
    UniDBLookupComboBox2: TUniDBLookupComboBox;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBCheckBox2: TUniDBCheckBox;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
    Controller: TEmployeeController;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const AController: TEmployeeController); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  EmployeeData, FormsUtil;



{ TFamilyAndRelativesFrame }

constructor TFamilyAndRelativesFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

constructor TFamilyAndRelativesFrame.Create(AOwner: TComponent;
  const AController: TEmployeeController);
begin
  inherited Create(AOwner);
  Controller := AController;
end;

procedure TFamilyAndRelativesFrame.UniFrameCreate(Sender: TObject);
begin
  OpenDropdownDataSources(self);
end;

end.
