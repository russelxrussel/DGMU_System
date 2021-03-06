USE [DGMU]
GO
/****** Object:  Table [xSystem].[Days_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [xSystem].[Days_RF](
	[DayID] [int] NOT NULL,
	[Description] [nvarchar](10) NULL,
	[Arr] [nvarchar](2) NULL,
 CONSTRAINT [PK_Days_RF] PRIMARY KEY CLUSTERED 
(
	[DayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
