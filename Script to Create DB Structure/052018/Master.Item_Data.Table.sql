USE [DGMU]
GO
/****** Object:  Table [Master].[Item_Data]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Item_Data](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](6) NOT NULL,
	[ItemName] [nvarchar](150) NULL,
	[InvUomCode] [nvarchar](6) NULL,
	[PurchasingPriceCode] [nvarchar](6) NULL CONSTRAINT [DF_Item_Data_S_Price]  DEFAULT ((0)),
	[PurchasingUomCode] [nvarchar](6) NULL,
	[SellingUomCode] [nvarchar](6) NULL,
	[ConversionQty] [float] NULL CONSTRAINT [DF_Item_Data_ConversionQty]  DEFAULT ((1)),
	[IsSubCat] [bit] NULL CONSTRAINT [DF_Item_Data_IsSubCat]  DEFAULT ((0)),
	[Branch_ItemCode] [nvarchar](6) NULL,
 CONSTRAINT [PK_Item_Data] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
