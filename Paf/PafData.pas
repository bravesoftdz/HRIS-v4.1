unit PafData;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB;

type
  TdmPaf = class(TDataModule)
    dscPaf: TDataSource;
    dstPaf: TADODataSet;
    dscPafComp: TDataSource;
    dstPafComp: TADODataSet;
    dscPafAllowances: TDataSource;
    dstPafAllowances: TADODataSet;
    dscAllowanceTypes: TDataSource;
    dstAllowanceTypes: TADODataSet;
    dscLatestPaf: TDataSource;
    dstLatestPaf: TADODataSet;
    dscPosition: TDataSource;
    dstPosition: TADODataSet;
    dscPositionStatus: TDataSource;
    dstPositionStatus: TADODataSet;
    dscEmpStatus: TDataSource;
    dstEmpStatus: TADODataSet;
    dscLocations: TDataSource;
    dstLocations: TADODataSet;
    dscLatestPafAllowances: TDataSource;
    dstLatestPafAllowances: TADODataSet;
    dscSalaryFrequency: TDataSource;
    dstSalaryFrequency: TADODataSet;
    dscDepartments: TDataSource;
    dstDepartments: TADODataSet;
    dscPafStatus: TDataSource;
    dstPafStatus: TADODataSet;
    dscPafPrint: TDataSource;
    dstPafPrint: TADODataSet;
    dscPafSignatories: TDataSource;
    dstPafSignatories: TADODataSet;
    spPafEffectiveUntil: TADOStoredProc;
    dstPafBranchManagers: TADODataSet;
    spUpdateEmployee: TADOStoredProc;
    dstPafAllowancespafallowance_id: TAutoIncField;
    dstPafAllowancespaf_id: TIntegerField;
    dstPafAllowancesallowance_amount: TBCDField;
    dstPafAllowancesallowancetype_code: TStringField;
    dstPafAllowancesexpiry_date: TDateTimeField;
    dstPafAllowancesallowancetype_name: TStringField;
    dstPafpaf_id: TAutoIncField;
    dstPafeffective_date: TDateTimeField;
    dstPafeffective_until: TDateTimeField;
    dstPafid_num: TStringField;
    dstPafsalary: TBCDField;
    dstPaffrequency_code: TStringField;
    dstPafposition_code: TStringField;
    dstPafempstatus_code: TStringField;
    dstPafposstatus_code: TStringField;
    dstPaflocation_code: TStringField;
    dstPafdepartment_code: TStringField;
    dstPafpaf_remarks: TStringField;
    dstPafcreated_by: TStringField;
    dstPafcreated_date: TDateTimeField;
    dstPafmodified_by: TStringField;
    dstPafmodified_date: TDateTimeField;
    dstPafrank_movement: TIntegerField;
    dstPafis_cancelled: TSmallintField;
    dstPafpafstatus_code: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  AppData;

end.
