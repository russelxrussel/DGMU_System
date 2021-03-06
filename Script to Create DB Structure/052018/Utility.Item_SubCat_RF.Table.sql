USE [DGMU]
GO
/****** Object:  Table [Utility].[Item_SubCat_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Item_SubCat_RF](
	[ItemSubCatID] [int] NOT NULL,
	[ItemCode] [nvarchar](6) NULL,
	[ItemSubName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Item_SubCat_RF] PRIMARY KEY CLUSTERED 
(
	[ItemSubCatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
