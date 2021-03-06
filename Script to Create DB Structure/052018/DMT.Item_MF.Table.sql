USE [DGMU]
GO
/****** Object:  Table [DMT].[Item_MF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DMT].[Item_MF](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemDescription] [nvarchar](250) NULL,
	[UOM] [nvarchar](10) NULL,
	[ItemGroupCode] [nvarchar](2) NULL,
 CONSTRAINT [PK_Item_MF] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
