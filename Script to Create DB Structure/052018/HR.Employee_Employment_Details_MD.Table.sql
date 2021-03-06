USE [DGMU]
GO
/****** Object:  Table [HR].[Employee_Employment_Details_MD]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Employee_Employment_Details_MD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](10) NOT NULL,
	[TIN] [nvarchar](20) NULL,
	[SSS] [nvarchar](20) NULL,
	[HDMF] [nvarchar](20) NULL,
	[PhilHealth] [nvarchar](20) NULL,
	[Date_Hired] [datetime] NULL,
	[DepartmentCode] [nvarchar](3) NULL,
	[PositionCode] [nvarchar](3) NULL,
	[EmploymentStatusCode] [nvarchar](5) NULL,
 CONSTRAINT [PK_Employee_Employement_MD] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
