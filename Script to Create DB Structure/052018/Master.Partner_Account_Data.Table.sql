USE [DGMU]
GO
/****** Object:  Table [Master].[Partner_Account_Data]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Partner_Account_Data](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartnerCode] [nvarchar](6) NOT NULL,
	[PartnerName] [nvarchar](150) NULL,
	[Total_Credit] [float] NULL CONSTRAINT [DF_Partner_Account_Data_Credit]  DEFAULT ((0)),
	[Total_Debit] [float] NULL CONSTRAINT [DF_Partner_Account_Data_Debit]  DEFAULT ((0)),
	[Balance] [float] NULL CONSTRAINT [DF_Partner_Account_Data_Balance]  DEFAULT ((0)),
	[Last_Update] [datetime] NULL CONSTRAINT [DF_Partner_Account_Data_Last_Update]  DEFAULT (getdate()),
	[Account_Status] [bit] NULL CONSTRAINT [DF_Partner_Account_Data_Account_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Partner_Account_Data] PRIMARY KEY CLUSTERED 
(
	[PartnerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Master].[Partner_Account_Data]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Account_Data_Partners_Data] FOREIGN KEY([PartnerCode])
REFERENCES [Master].[Partners_Data] ([PartnerCode])
GO
ALTER TABLE [Master].[Partner_Account_Data] CHECK CONSTRAINT [FK_Partner_Account_Data_Partners_Data]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Partners_Account' , @level0type=N'SCHEMA',@level0name=N'Master', @level1type=N'TABLE',@level1name=N'Partner_Account_Data', @level2type=N'CONSTRAINT',@level2name=N'FK_Partner_Account_Data_Partners_Data'
GO
