USE [DGMU]
GO
/****** Object:  Table [Trans].[Adjustment_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Adjustment_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ASNum] [nvarchar](10) NOT NULL,
	[AdjCode] [nvarchar](10) NULL,
	[ItemCode] [nvarchar](10) NULL,
	[Quantity] [int] NULL,
	[AdjDate] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[Reference] [nvarchar](10) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Adjustment_Hdr_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Adjustment_Hdr] PRIMARY KEY CLUSTERED 
(
	[ASNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
