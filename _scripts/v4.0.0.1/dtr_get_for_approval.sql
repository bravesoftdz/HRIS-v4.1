
/****** Object:  StoredProcedure [dbo].[dtr_get_for_approval]    Script Date: 11/03/2017 5:55:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dtr_get_for_approval]
AS
BEGIN
	declare @forApproval table
	(
		entitlement tinyint,
		leave_id integer,
		location_code char(3),
		dt datetime,
		app_dt datetime,
		id_num varchar(12),
		time_from char(5),
		time_until char(5),
		am_pm char(1),
		reason varchar(100),
		remarks varchar(200)
	)

	-- leaves
	insert into @forApproval
	select 0,
	       l.leave_id,
		   l.location_code,
	       d.leave_date,
		   l.leave_application_date,
		   l.id_num,
		   null,
		   null,
		   null,
		   r.leavereason_name,
		   d.leave_remarks
	  from leavedetail d (nolock)
	  join leave l (nolock)
	    on l.leave_id = d.leave_id
	   and l.location_code = d.location_code
	  join t_leavereason r (nolock)
	    on r.leavereason_code = d.leavereason_code
     where d.leavestatus_code = 'PND'

	-- undertime
	insert into @forApproval
	select 1,
	       null,
		   null,
	       d.dtr_date,
		   null,
	       d.id_num,
		   d.time_from,
		   d.time_until,
		   d.am_pm,
		   r.undertime_reason_name,
		   null
	  from dtrundertime d (nolock)
	  join t_undertimereason r (nolock)
	    on r.undertime_reason_code = d.undertime_reason_code
	 where d.timestatus_code = 'PND'

	select a.*,
	       (e.employee_lastname + ', ' + e.employee_firstname) employee_name,
		   e.location_code employee_location_code,
		   e.department_code,
		   e.positiontype_code,
	       convert(varchar(10),dt,101) dt_f,
		   convert(varchar(10),app_dt,101) app_dt_f
	  from @forApproval a
	  join employee e (nolock)
	    on e.id_num = a.id_num
  order by employee_name
END
