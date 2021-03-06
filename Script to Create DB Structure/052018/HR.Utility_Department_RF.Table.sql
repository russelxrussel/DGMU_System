USE [DGMU]
GO
/****** Object:  Table [HR].[Utility_Department_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Utility_Department_RF](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [nvarchar](3) NULL,
	[Department] [nvarchar](50) NULL,
	[DepartmentHead] [nvarchar](10) NULL,
 CONSTRAINT [PK_Utility_Department_RF] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
