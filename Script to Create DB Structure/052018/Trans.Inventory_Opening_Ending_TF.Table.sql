USE [DGMU]
GO
/****** Object:  Table [Trans].[Inventory_Opening_Ending_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Inventory_Opening_Ending_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](8) NOT NULL,
	[Opening] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Opening]  DEFAULT ((0)),
	[Stock_In] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Stock_In]  DEFAULT ((0)),
	[Stock_Out] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Stock_Out]  DEFAULT ((0)),
	[Adjustment_In] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Adjustment_In]  DEFAULT ((0)),
	[Adjustment_Out] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Adjustment_Out]  DEFAULT ((0)),
	[Ending] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Ending]  DEFAULT ((0)),
	[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_LastUpdate]  DEFAULT (getdate()),
	[DI] [datetime] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_DI]  DEFAULT (getdate()),
 CONSTRAINT [PK_Inventory_Opening_Ending_TF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
