unit AppConstants;

interface

type TForms = (fmClientMain, fmClientList, fmGroupList, fmEmployerList,
                fmBanksList, fmDesignationList, fmLoanClassList, fmLoanMain,
                fmLoanList, fmCompetitorList);

{
Entity types

CL = CLIENT
LL = LANDLORD
IH = IMMEDIATE HEAD
RF = REFEREE
CK = COMAKER
RP = RECIPIENT

}
type TEntityTypes = (CL,LL,IH,RF,CK,RP);

const
  // PAF STATUS CODE
  PAF_STATUS_PENDING = 'PND';
  PAF_STATUS_APPROVED = 'APP';

  // PAF STATUS CODE DESCRIPTION
  PAF_NEW = 'New';
  PAF_APPROVED = 'Approved';
  PAF_PENDING = 'Pending';
  PAF_CANCELLED = 'Cancelled';

  //************* PRIVILEGES ****************//
  PRIV_EMP_VIEW          = 'EMP_VIEW;View_employee_ record;EMP';
  PRIV_EMP_ADD_NEW       = 'EMP_ADD_NEW;Add_new_employee;EMP';
  PRIV_EMP_MODIFY        = 'EMP_MODIFY;Modify_employee_details;EMP';
  PRIV_EMP_DEPENDENT     = 'EMP_DEPENDENT;Setting_employee_dependents;EMP';
  PRIV_SYNC_EMPLOYEE     = 'SYNC_EMPLOYEE;Synchronise_employee_records;EMP';

  // PAF PRIVILEGES
  PRIV_PAF_ADD_NEW       = 'PAF_ADD_NEW;Add_new_PAF;PAF';
  PRIV_PAF_CANCEL        = 'PAF_CANCEL;Cancel_PAF;PAF';
  PRIV_PAF_VIEW          = 'PAF_VIEW;View_PAF;PAF';
  PRIV_PAF_APPROVE       = 'PAF_APPROVE;Approve_PAF;PAF';
  PRIV_PAF_EDIT          = 'PAF_EDIT;Edit_PAF;PAF';

  // SECURITY PRIVILEGES
  PRIV_USER_ADD_NEW      = 'USER_ADD_NEW;Add_system_user;SEC';
  PRIV_USER_MODIFY       = 'USER_MODIFY;Assign_user_roles;SEC';
  PRIV_USER_VIEW         = 'USER_VIEW;View_systerm_users;SEC';
  PRIV_ROLE_MODIFY       = 'ROLE_MODIFY;Add_or_remove_role_privileges;SEC';
  PRIV_ROLE_NEW          = 'ROLE_NEW;Add_new_role;SEC';
  PRIV_ROLE_VIEW         = 'ROLE_VIEW;View_system_roles;SEC';
  PRIV_PRIV_VIEW         = 'PRIV_VIEW;View_system_privileges;SEC';
  PRIV_PRIV_MODIFY       = 'PRIV_MODIFY;Add_or_remove_privileges;SEC';
  PRIV_SYSCONFIG_VIEW    = 'SYSCONFIG_VIEW;View_system_configuration;CFG';
  PRIV_SYSCONFIG_ADD     = 'SYSCONFIG_ADD;Add_new_value_in_system_configuration;CFG';
  PRIV_SYSCONFIG_MODIFY  = 'SYSCONFIG_MODIFY;Modify_system_configuration_values;CFG';
  PRIV_LEAVE_APPROVE     = 'LEAVE_APPROVE;Approve_leave_applications;LVE';
  PRIV_LEAVE_DISAPPROVE  = 'LEAVE_DISAPPROVE;Disapprove_leave_applications;LVE';
  // CONFIG_MANAGER    = 'CONFIG_MANAGER;Configuration_manager_access;CFG';

  // TIME AND ATTENDANCE
  PRIV_OVERRIDE_DTR      = 'OVERRIDE_DTR;Override_employee_time_log;DTR';
  PRIV_OVERTIME_DTR      = 'OVERTIME_DTR;Add_or_modify_overtime_records;DTR';
  PRIV_LEAVE_NEW         = 'LEAVE_NEW;Add_leave_records;DTR';
  PRIV_LEAVE_MODIFY_ST   = 'LEAVE_MODIFY_ST;Modify_leave_status;DTR';
  PRIV_LEAVE_VIEW_ALL    = 'LEAVE_VIEW_ALL;View_leaves_(ALL);DTR';
  PRIV_LEAVE_VIEW        = 'LEAVE_VIEW_LOC;View_location_or_department_leaves;DTR';
  PRIV_UNDERTIME_DTR     = 'UNDERTIME_DTR;Add_undertime_records;DTR';
  PRIV_UNDERTIME_APPROVE = 'UNDERTIME_APPROVE;Approve_undertime_records;DTR';
  PRIV_UNDERTIME_EDIT    = 'UNDERTIME_EDIT;Edit_undertime_records;DTR';
  PRIV_DTR_VIEW          = 'DTR_VIEW;View_location_or_department_time_log;DTR';
  PRIV_DTR_VIEW_ALL      = 'DTR_VIEW_ALL;View_time_log_(ALL);DTR';
  PRIV_ROSTER_VIEW       = 'ROSTER_VIEW;View_location_or_department_skeletal;DTR';
  PRIV_ROSTER_VIEW_ALL   = 'ROSTER_VIEW_ALL;View_skeletal_(ALL);DTR';
  PRIV_ROSTER_MODIFY     = 'ROSTER_MODIFY;Modify_skeletal;DTR';
  PRIV_HOLIDAY_VIEW      = 'HOLIDAY_VIEW;View_holiday;DTR';
  PRIV_HOLIDAY_MODIFY    = 'HOLIDAY_MODIFY;Modify_holiday;DTR';
  PRIV_HOLIDAY_NEW       = 'HOLIDAY_NEW;Add_holiday;DTR';
  PRIV_FILTER_BY_POS     = 'FILTER_BY_POS;Filter_time_and_attendance_by_position;DTR';

  // PAYROLL PRIVILEGES
  PRIV_PAYROLL_VIEW      = 'PAYROLL_VIEW;View_payroll;PAY';
  PRIV_PAYROLL_GENERATE  = 'PAYROLL_GENERATE;Generate_payroll;PAY';
  PRIV_PAYROLL_CLOSE     = 'PAYROLL_CLOSE;Close_payroll;PAY';
  PRIV_PAYROLL_MODIFY    = 'PAYROLL_MODIFY;Modify_payroll_record;PAY';
  PRIV_PAYROLL_DEDUCTION = 'PAYROLL_DEDUCTION;Add_or_modify_payroll_deduction;PAY';

  // adjust the array size before adding an item
  // array size is equal to the number of privileges
  PRIVILEGES: array [1..46] of string =
        (PRIV_EMP_VIEW,
         PRIV_EMP_ADD_NEW,
         PRIV_EMP_MODIFY,
         PRIV_EMP_DEPENDENT,
         PRIV_PAF_ADD_NEW,
         PRIV_PAF_CANCEL,
         PRIV_PAF_VIEW,
         PRIV_PAF_APPROVE,
         PRIV_PAF_EDIT,
         PRIV_USER_ADD_NEW,
         PRIV_USER_MODIFY,
         PRIV_USER_VIEW,
         PRIV_ROLE_MODIFY,
         PRIV_ROLE_NEW,
         PRIV_ROLE_VIEW,
         PRIV_PRIV_VIEW,
         PRIV_PRIV_MODIFY,
         PRIV_SYSCONFIG_VIEW,
         PRIV_SYSCONFIG_ADD,
         PRIV_SYSCONFIG_MODIFY,
         PRIV_LEAVE_APPROVE,
         PRIV_LEAVE_DISAPPROVE,
         PRIV_OVERRIDE_DTR,
         PRIV_SYNC_EMPLOYEE,
         PRIV_OVERTIME_DTR,
         PRIV_LEAVE_NEW,
         PRIV_LEAVE_MODIFY_ST,
         PRIV_LEAVE_VIEW_ALL,
         PRIV_LEAVE_VIEW,
         PRIV_UNDERTIME_DTR,
         PRIV_UNDERTIME_APPROVE,
         PRIV_UNDERTIME_EDIT,
         PRIV_DTR_VIEW,
         PRIV_DTR_VIEW_ALL,
         PRIV_ROSTER_VIEW,
         PRIV_ROSTER_VIEW_ALL,
         PRIV_ROSTER_MODIFY,
         PRIV_HOLIDAY_VIEW,
         PRIV_HOLIDAY_MODIFY,
         PRIV_HOLIDAY_NEW,
         PRIV_PAYROLL_VIEW,
         PRIV_PAYROLL_GENERATE,
         PRIV_PAYROLL_CLOSE,
         PRIV_PAYROLL_MODIFY,
         PRIV_FILTER_BY_POS,
         PRIV_PAYROLL_DEDUCTION);

  //************* PRIVILEGES ****************//


implementation

end.

