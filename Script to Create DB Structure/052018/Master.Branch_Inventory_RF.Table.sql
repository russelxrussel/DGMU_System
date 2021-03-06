USE [DGMU]
GO
/****** Object:  Table [Master].[Branch_Inventory_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Branch_Inventory_RF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchCode] [nvarchar](6) NULL,
	[Branch_ItemCode] [nvarchar](6) NULL,
	[Beginning_Stock] [int] NOT NULL CONSTRAINT [DF_Branch_Inventory_RF_Total_Stock]  DEFAULT ((0)),
	[Stock_IN] [int] NOT NULL CONSTRAINT [DF_Branch_Inventory_RF_Stock_IN]  DEFAULT ((0)),
	[Stock_OUT] [int] NOT NULL CONSTRAINT [DF_Branch_Inventory_RF_Stock_OUT]  DEFAULT ((0)),
	[Stock_On_Hand] [int] NOT NULL CONSTRAINT [DF_Branch_Inventory_RF_Stock_OnHand]  DEFAULT ((0)),
	[IsBegDone] [bit] NULL CONSTRAINT [DF_Branch_Inventory_RF_IsBegDone]  DEFAULT ((0)),
	[Remarks] [nvarchar](250) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Branch_Inventory_RF_DU]  DEFAULT (getdate()),
 CONSTRAINT [PK_Branch_Inventory_RF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
