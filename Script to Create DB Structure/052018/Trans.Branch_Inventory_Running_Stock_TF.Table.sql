USE [DGMU]
GO
/****** Object:  Table [Trans].[Branch_Inventory_Running_Stock_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Branch_Inventory_Running_Stock_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceNum] [nvarchar](15) NOT NULL,
	[BranchCode] [nvarchar](6) NOT NULL,
	[Branch_ItemCode] [nvarchar](6) NOT NULL,
	[Running_Stock] [int] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_Running_Stock]  DEFAULT ((0)),
	[Stock_IN] [int] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_Stock_IN]  DEFAULT ((0)),
	[Stock_OUT] [int] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_Stock_OUT]  DEFAULT ((0)),
	[Balance] [int] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_Balance]  DEFAULT ((0)),
	[DateTrans] [datetime] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_DateTrans]  DEFAULT (getdate()),
	[DI] [datetime] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_DI]  DEFAULT (getdate()),
	[Remarks] [nvarchar](150) NULL,
 CONSTRAINT [PK_Branch_Running_Stock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
