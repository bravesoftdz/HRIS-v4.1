
CREATE PROCEDURE dbo.dtr_get_leave_credits
	@id_num varchar(12),
	@year smallint
AS
BEGIN
	select *
	  from leavecredit (nolock)
	 where id_num = @id_num
	   and [year] = @year
END
GO
