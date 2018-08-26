

/****** Object:  Table [dbo].[leavecredit]    Script Date: 20/06/2018 9:26:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[leavecredit](
	[year] [int] NOT NULL,
	[id_num] [varchar](12) NOT NULL,
	[leavetype_code] [char](3) NOT NULL,
	[leave_credits] [int] NOT NULL,
 CONSTRAINT [PK_leavecredit_1] PRIMARY KEY CLUSTERED 
(
	[year] ASC,
	[id_num] ASC,
	[leavetype_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[leavecredit]  WITH CHECK ADD  CONSTRAINT [FK_leavecredit_employee] FOREIGN KEY([id_num])
REFERENCES [dbo].[employee] ([id_num])
GO

ALTER TABLE [dbo].[leavecredit] CHECK CONSTRAINT [FK_leavecredit_employee]
GO

ALTER TABLE [dbo].[leavecredit]  WITH CHECK ADD  CONSTRAINT [FK_leavecredit_t_leavetype] FOREIGN KEY([leavetype_code])
REFERENCES [dbo].[t_leavetype] ([leavetype_code])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[leavecredit] CHECK CONSTRAINT [FK_leavecredit_t_leavetype]
GO


