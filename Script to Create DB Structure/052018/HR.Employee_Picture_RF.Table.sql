USE [DGMU]
GO
/****** Object:  Table [HR].[Employee_Picture_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [HR].[Employee_Picture_RF](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](10) NULL,
	[Picture_Name] [nvarchar](255) NULL,
	[Size] [int] NULL,
	[Image_Data] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
