USE [HRIS]
GO
/****** Object:  StoredProcedure [dbo].[sec_get_user_roles]    Script Date: 7/06/2018 2:14:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sec_get_user_roles]
	@id_num varchar(12)
AS
BEGIN
     -- assigned roles
	 select ur.*,
	        r.role_code as role_code_master,
			r.role_name,
			r.role_description
	   from sysrole r (nolock)
  left join sysuserrole ur (nolock)
         on ur.role_code = r.role_code
	    and ur.id_num = @id_num
END
