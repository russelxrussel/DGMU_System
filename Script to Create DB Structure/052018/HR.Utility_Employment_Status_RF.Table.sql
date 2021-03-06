USE [DGMU]
GO
/****** Object:  Table [HR].[Utility_Employment_Status_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Utility_Employment_Status_RF](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusCode] [nvarchar](3) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Utility_Employment_RF] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
