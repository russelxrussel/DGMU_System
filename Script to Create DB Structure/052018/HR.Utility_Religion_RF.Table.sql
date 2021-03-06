USE [DGMU]
GO
/****** Object:  Table [HR].[Utility_Religion_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Utility_Religion_RF](
	[ReligionID] [int] IDENTITY(1,1) NOT NULL,
	[ReligionCode] [nvarchar](3) NOT NULL,
	[Religion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Utility_Religion_RF] PRIMARY KEY CLUSTERED 
(
	[ReligionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
