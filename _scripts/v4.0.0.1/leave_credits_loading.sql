
	 -- get paf where validity is open ended (effect_until is null)
	 -- this means that the employee is current
	 -- filter out cancelled paf
	 select p.id_num as id_num,
	        p.salary as current_salary,
	        p.frequency_code as frequency_code
	   into #tmpPaf
	   from paf p (nolock)
	  where ISNULL(p.is_cancelled,0) = 0
		and p.effective_until is null
   group by p.id_num, p.salary, p.frequency_code
   
	-- date hired
	select p.id_num as id_num,
		   MIN(p.effective_date) as date_hired
	  into #tmpDateHired
	  from paf p (nolock)
	  join #tmpPaf tp (nolock)
	    on tp.id_num = p.id_num
	 where ISNULL(p.is_cancelled,0) = 0
  group by p.id_num
	  
	 -- VACATION LEAVE
	 insert 
	   into leavecredit
	 select 2018,
	        tp.id_num,
			'VL',
			(case when (datediff(MONTH,tdh.date_hired,GETDATE()) / 12) >= 3 then 8
			      -- when (datediff(MONTH,tdh.date_hired,GETDATE()) / 12) >= 2 then 5
				  else 5 end
			     
			)
	   from #tmpPaf tp 
	   join #tmpDateHired tdh 
	     on tdh.id_num = tp.id_num

	-- SICK LEAVE
	 insert 
	   into leavecredit
	 select 2018,
	        tp.id_num,
			'SL',
			(case when (datediff(MONTH,tdh.date_hired,GETDATE()) / 12) >= 3 then 7
			      when (datediff(MONTH,tdh.date_hired,GETDATE()) / 12) >= 2 then 5
				  else 0 end
			     
			)
	   from #tmpPaf tp 
	   join #tmpDateHired tdh 
	     on tdh.id_num = tp.id_num
	   
	 drop table #tmpPaf
	 drop table #tmpDateHired
  
  
 