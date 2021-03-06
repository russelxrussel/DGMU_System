USE [DGMU]
GO
/****** Object:  Table [Utility].[Adjustment_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Adjustment_RF](
	[AdjCode] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Sign] [bit] NOT NULL CONSTRAINT [DF_Adjustment_RF_Sign]  DEFAULT ((0)),
	[Arrangement] [nvarchar](2) NULL,
 CONSTRAINT [PK_Adjustment_RF] PRIMARY KEY CLUSTERED 
(
	[AdjCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
