USE [DGMU]
GO
/****** Object:  Table [Utility].[Driver_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Driver_RF](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[DriverName] [nvarchar](150) NOT NULL,
	[LicenseNumber] [nvarchar](50) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Driver_RF_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Driver_RF] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
