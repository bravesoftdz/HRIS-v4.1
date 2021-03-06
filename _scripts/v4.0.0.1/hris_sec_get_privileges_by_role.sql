
/****** Object:  StoredProcedure [dbo].[sec_get_privileges_by_role]    Script Date: 31/05/2018 12:21:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sec_get_privileges_by_role]
	@role_code varchar(25),
	@app_code smallint = 0
AS
BEGIN
	select srp.*,
	       p.privilege_code privilege_code_master,
	       p.privilege_name,
		   (case when isnull(srp.role_code,'') = '' then 0 else 1 end) assigned
	  from sysprivilege p (nolock)
 left join sysroleprivilege srp (nolock)
	    on p.privilege_code = srp.privilege_code
	   and srp.role_code = @role_code
	 where p.app_code = isnull(@app_code,0)

END
