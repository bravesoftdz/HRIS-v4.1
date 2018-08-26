

/****** Object:  StoredProcedure [dbo].[dtr_get_leaves]    Script Date: 18/06/2018 11:28:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[dtr_get_leaves]
	@date_from datetime,
	@date_until datetime,
	@id_num varchar(12),
	@branch_code char(3)
AS
BEGIN
	declare @range_from datetime,
	        @range_until datetime

	set @range_from = dateadd(dd,-1,@date_from);
	set @range_until = dateadd(dd,1,@date_until);

	with dateRange as
	(
	  select dt = dateadd(dd, 1, @range_from)
	  where dateadd(dd, 1, @range_from) < @range_until
	  union all
	  select dateadd(dd, 1, dt)
	  from dateRange
	  where dateadd(dd, 1, dt) < @range_until
	)

	-- get all dates of date range
	select id_num,
	       d.*
	  into #dates
	  from dateRange d, 
	       employee e (nolock) 
     where ((isnull(@id_num,'') = '') or (e.id_num = @id_num))
	   and ((isnull(@branch_code,'') = '') or (e.location_code = @branch_code))
	option (maxrecursion 0)

	-- get leaves
	select ld.leave_date,
	       l.id_num,
	       ld.am_pm,
	       l.leavetype_code,
		   r.leavereason_name,
		   ld.leave_remarks,
		   t.leavetype_name,
		   ld.leavestatus_code,
		   ld.is_paid
	  into #leaves
	  from leavedetail ld (nolock)
	  join leave l (nolock)
		on l.location_code = ld.location_code
	   and l.leave_id = ld.leave_id
	  join t_leavetype t (nolock)
	    on t.leavetype_code = l.leavetype_code
	  join t_leavereason r (nolock)
	    on r.leavereason_code = ld.leavereason_code
	 where ld.leave_date 
   between @date_from 
       and @date_until
	   -- and ld.leavestatus_code = 'APP'
	   and (isnull(@id_num,'') = '' or (l.id_num = @id_num))

	-- get leaves - full
	select leave_date leave_date_full,
	       leavetype_code leavetype_code_full,
		   leavereason_name leave_reason_full,
		   leave_remarks leave_remarks_full,
           leavetype_name leavetype_name_full,
		   id_num,
		   is_paid,
		   leavestatus_code
	  into #leaves_full
	  from #leaves lvf
	 where isnull(am_pm,'') = ''

	-- get leaves am
	select leave_date leave_date_am,
	       leavetype_code leavetype_code_am,
		   leavereason_name leave_reason_am,
		   leave_remarks leave_remarks_am,
           leavetype_name leavetype_name_am,
		   id_num,
		   is_paid,
		   leavestatus_code
	  into #leaves_am
	  from #leaves lva
	 where isnull(am_pm,'') = 'A'

	-- get leaves pm
	select leave_date leave_date_pm,
	       leavetype_code leavetype_code_pm,
		   leavereason_name leave_reason_pm,
		   leave_remarks leave_remarks_pm,
           leavetype_name leavetype_name_pm,
		   id_num,
		   is_paid,
		   leavestatus_code
	  into #leaves_pm
	  from #leaves lvp
	 where isnull(am_pm,'') = 'P'

	 -- get holidays national
	select holiday_date,
		   holiday_name,
		   is_national 
	  into #holidays_national
	  from dbo.dtr_fn_get_holidays(@date_from,@date_until) h
	 where isnull(is_national,0) = 1

	-- get holidays local
	select holiday_date,
		   holiday_name,
		   is_national,
		   h.loc_code as location_code
	  into #holidays_local
	  from dbo.dtr_fn_get_holidays(@date_from,@date_until) h
	 where isnull(is_national,0) = 0

	select distinct d.dt,
	       e.id_num,
		   e.employee_firstname,
		   e.employee_lastname,
		   e.location_code,
		   e.department_code,
		   e.positiontype_code,
		   lvf.leave_date_full,
		   lvf.leavetype_code_full,
		   lvf.leave_remarks_full,
           lvf.leavetype_name_full,
		   lvf.leave_reason_full,
		   lvf.is_paid is_paid_leave_full,
		   lvf.leavestatus_code status_full,
		   lva.leave_date_am,
		   lva.leavetype_code_am,
		   lva.leave_remarks_am,
           lva.leavetype_name_am,
		   lva.leave_reason_am,
		   lva.is_paid is_paid_leave_am,
		   lva.leavestatus_code status_am,
		   lvp.leave_date_pm,
		   lvp.leavetype_code_pm,
		   lvp.leave_remarks_pm,
           lvp.leavetype_name_pm,
		   lvp.leave_reason_pm,
		   lvp.is_paid is_paid_leave_pm,
		   lvp.leavestatus_code status_pm,
		   coalesce(hn.holiday_date,hl.holiday_date) holiday_date,
		   coalesce(hn.holiday_name,hl.holiday_name) holiday_name,
		   coalesce(hn.is_national,hl.is_national) holiday_is_national
	  from #dates d 
 left join employee e (nolock)
        on e.id_num = d.id_num
	   and d.id_num= d.id_num
 left join #leaves_full lvf
        on lvf.leave_date_full = d.dt
	   and d.id_num= lvf.id_num
 left join #leaves_am lva
        on lva.leave_date_am = d.dt
	   and d.id_num= lva.id_num
 left join #leaves_pm lvp
        on lvp.leave_date_pm = d.dt
	   and d.id_num= lvp.id_num
 left join #holidays_national hn
        on hn.holiday_date = d.dt
 left join #holidays_local hl
        on hl.holiday_date = d.dt
	   and e.location_code = hl.location_code
  order by e.employee_lastname,
           e.employee_firstname,
           d.dt 

	drop table #dates
	drop table #leaves
	drop table #leaves_full
	drop table #leaves_am
	drop table #leaves_pm
	drop table #holidays_national
	drop table #holidays_local


END

GO


