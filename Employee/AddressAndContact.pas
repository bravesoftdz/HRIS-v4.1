unit AddressAndContact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.StdCtrls, Vcl.DBCtrls,
  RzDBEdit, Vcl.Mask, RzEdit, Vcl.ExtCtrls, RzPanel, JvExControls, JvLabel,
  RzCmboBx, RzDBCmbo, RzButton, RzRadChk, RzDBChk;

type
  TfrmAddressAndContact = class(TfrmBase)
    JvLabel1: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    JvLabel9: TJvLabel;
    JvLabel16: TJvLabel;
    JvLabel17: TJvLabel;
    JvLabel18: TJvLabel;
    JvLabel14: TJvLabel;
    JvLabel15: TJvLabel;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox1: TRzGroupBox;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzGroupBox3: TRzGroupBox;
    RzGroupBox4: TRzGroupBox;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    JvLabel4: TJvLabel;
    RzDBMemo1: TRzDBMemo;
    JvLabel2: TJvLabel;
    JvLabel5: TJvLabel;
    RzDBEdit4: TRzDBEdit;
    JvLabel10: TJvLabel;
    RzDBMemo2: TRzDBMemo;
    RzDBEdit5: TRzDBEdit;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBMemo3: TRzDBMemo;
    RzDBCheckBox1: TRzDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  EmployeeData, FormsUtil;

procedure TfrmAddressAndContact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  OpenDropdownDataSources(self,false);
end;

procedure TfrmAddressAndContact.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(self);
end;

end.
