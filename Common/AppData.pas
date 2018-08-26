unit AppData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, ConnUtil;

type
  TdmApplication = class(TDataModule)
    acMain: TADOConnection;
    dstUser: TADODataSet;
    dstConfig: TADODataSet;
    dstPayrollCode: TADODataSet;
    dstLocation: TADODataSet;
    dstEmployees: TADODataSet;
    dscEmployees: TDataSource;
    dstHRISEmployees: TADODataSet;
    dscHRISEmployees: TDataSource;
    dscPendingPAF: TDataSource;
    dstPendingPAF: TADODataSet;
    dstPendingPAFpaf_id: TIntegerField;
    dstPendingPAFid_num: TStringField;
    dstPendingPAFemployee_firstname: TStringField;
    dstPendingPAFemployee_lastname: TStringField;
    dstPendingPAFemployee_middlename: TStringField;
    dstPendingPAFemployee_name: TStringField;
    dstPendingPAFposition_name: TStringField;
    dstPendingPAFposstatus_name: TStringField;
    dstPendingPAFempstatus_name: TStringField;
    dstPendingPAFlocation_name: TStringField;
    dstPendingPAFsalary: TBCDField;
    dstPendingPAFeffective_date: TDateTimeField;
    dstPendingPAFrank_movement: TIntegerField;
    dstPendingPAFpafstatus_code: TStringField;
    dstPendingPAFis_cancelled: TSmallintField;
    dstPendingPAFis_external: TSmallintField;
    dstPendingPAFeffective_until: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
    procedure acMainBeforeConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dstEmployeesBeforeOpen(DataSet: TDataSet);
    procedure dstPendingPAFBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmApplication: TdmApplication;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  HRISGlobal;

procedure TdmApplication.acMainBeforeConnect(Sender: TObject);
begin
  acMain.ConnectionString := GetConnection('','','');
end;

procedure TdmApplication.DataModuleCreate(Sender: TObject);
begin
  acMain.Open;
end;

procedure TdmApplication.DataModuleDestroy(Sender: TObject);
begin
  acMain.Close;
end;

procedure TdmApplication.dstEmployeesBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@dtr_date_from').Value := HRIS.CurrentDate;
  (DataSet as TADODataSet).Parameters.ParamByName('@dtr_date_until').Value := HRIS.CurrentDate;
end;

procedure TdmApplication.dstPendingPAFBeforeOpen(DataSet: TDataSet);
begin
  (DataSet as TADODataSet).Parameters.ParamByName('@user_id_num').Value := HRIS.User.UserId;
end;

end.
