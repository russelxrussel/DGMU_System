USE [DGMU]
GO
/****** Object:  Table [Trans].[Inventory_Ending_Stock_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Inventory_Ending_Stock_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](6) NOT NULL CONSTRAINT [DF_Inventory_Ending_Stock_TF_ItemCode]  DEFAULT ((0)),
	[EndQuantity] [int] NOT NULL CONSTRAINT [DF_Inventory_Ending_Stock_TF_EndQuantity]  DEFAULT ((0)),
	[EndDate] [date] NOT NULL CONSTRAINT [DF_Inventory_Ending_Stock_TF_EndDate]  DEFAULT (getdate()),
	[IsMove] [bit] NULL CONSTRAINT [DF_Inventory_Ending_Stock_TF_IsMove]  DEFAULT ((0)),
 CONSTRAINT [PK_Inventory_Ending_Stock_TF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
