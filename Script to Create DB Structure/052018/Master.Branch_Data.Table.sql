USE [DGMU]
GO
/****** Object:  Table [Master].[Branch_Data]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Branch_Data](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchCode] [nvarchar](6) NOT NULL,
	[PartnerCode] [nvarchar](6) NOT NULL,
	[LACode] [nvarchar](6) NOT NULL,
	[BranchName] [nvarchar](150) NULL,
	[B_Address] [nvarchar](250) NULL,
	[B_ContactNumbers] [nvarchar](150) NULL,
	[Supervisor] [nvarchar](100) NULL,
 CONSTRAINT [PK_Branch_Data] PRIMARY KEY CLUSTERED 
(
	[BranchCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Master].[Branch_Data]  WITH CHECK ADD  CONSTRAINT [FK_LACode] FOREIGN KEY([LACode])
REFERENCES [Utility].[Location_Area_RF] ([LACode])
GO
ALTER TABLE [Master].[Branch_Data] CHECK CONSTRAINT [FK_LACode]
GO
ALTER TABLE [Master].[Branch_Data]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Branch] FOREIGN KEY([PartnerCode])
REFERENCES [Master].[Partners_Data] ([PartnerCode])
GO
ALTER TABLE [Master].[Branch_Data] CHECK CONSTRAINT [FK_Partner_Branch]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location Area Code' , @level0type=N'SCHEMA',@level0name=N'Master', @level1type=N'TABLE',@level1name=N'Branch_Data', @level2type=N'CONSTRAINT',@level2name=N'FK_LACode'
GO
