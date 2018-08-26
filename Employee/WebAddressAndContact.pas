unit WebAddressAndContact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniPanel, uniLabel, uniGUIBaseClasses, uniEdit,
  uniDBEdit, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  uniMemo, uniDBMemo, uniCheckBox, uniDBCheckBox;

type
  TAddressAndContactFrame = class(TUniFrame)
    UniDBEdit1: TUniDBEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    CaptionPanel: TUniSimplePanel;
    UniLabel4: TUniLabel;
    UniDBMemo1: TUniDBMemo;
    UniDBLookupComboBox2: TUniDBLookupComboBox;
    UniDBEdit2: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniSimplePanel1: TUniSimplePanel;
    UniLabel8: TUniLabel;
    UniDBMemo2: TUniDBMemo;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBEdit7: TUniDBEdit;
    UniLabel16: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    UniLabel17: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    UniLabel18: TUniLabel;
    UniSimplePanel3: TUniSimplePanel;
    UniLabel19: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniLabel11: TUniLabel;
    UniSimplePanel2: TUniSimplePanel;
    UniLabel12: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniDBMemo3: TUniDBMemo;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  EmployeeData, FormsUtil;

procedure TAddressAndContactFrame.UniFrameCreate(Sender: TObject);
begin
  OpenDropdownDataSources(self);
end;

end.
