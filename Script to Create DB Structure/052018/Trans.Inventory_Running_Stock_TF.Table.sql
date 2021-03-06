USE [DGMU]
GO
/****** Object:  Table [Trans].[Inventory_Running_Stock_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Inventory_Running_Stock_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](6) NOT NULL,
	[Running_Stock] [int] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_Running_Stock]  DEFAULT ((0)),
	[Out_Stock] [int] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_Out_Stock]  DEFAULT ((0)),
	[In_Stock] [int] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_In_Stock]  DEFAULT ((0)),
	[Balance_Stock] [int] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_Balance_Stock]  DEFAULT ((0)),
	[Reference] [nvarchar](50) NULL,
	[IsCancel] [bit] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_IsCancel]  DEFAULT ((0)),
	[DateTrans] [datetime] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_DateTrans]  DEFAULT (getdate()),
 CONSTRAINT [PK_Inventory_Running_Stock_TF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
