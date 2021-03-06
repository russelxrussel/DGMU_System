USE [DGMU]
GO
/****** Object:  Table [HR].[Utility_Citizenship_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Utility_Citizenship_RF](
	[CitizenshipID] [int] IDENTITY(1,1) NOT NULL,
	[CitizenshipCode] [nvarchar](3) NOT NULL,
	[Citizenship] [nvarchar](50) NULL,
	[Arr] [nvarchar](2) NULL,
 CONSTRAINT [PK_Utility_Citizenship_RF] PRIMARY KEY CLUSTERED 
(
	[CitizenshipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
