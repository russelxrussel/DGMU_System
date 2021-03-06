USE [DGMU]
GO
/****** Object:  Table [Trans].[Delivery_Reciept_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Delivery_Reciept_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DRNum] [nvarchar](10) NOT NULL,
	[PartnerCode] [nvarchar](6) NULL,
	[BranchCode] [nvarchar](6) NOT NULL,
	[ItemCodeFresh] [nvarchar](6) NULL,
	[ItemCodeFrozen] [nvarchar](6) NULL,
	[ItemCodeLiempo] [nvarchar](6) NULL,
	[ItemCodeLeeg] [nvarchar](6) NULL,
	[ItemCodeAtsara100] [nvarchar](6) NULL,
	[ItemCodeAtsara160] [nvarchar](6) NULL,
	[InvQtyFresh] [float] NULL,
	[InvQtyFrozen] [float] NULL,
	[InvQtyLiempo] [float] NULL,
	[InvQtyLeeg] [float] NULL,
	[InvQtyAtsara100] [float] NULL,
	[InvQtyAtsara160] [float] NULL,
	[FreshQty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_FreshQty]  DEFAULT ((0)),
	[FrozenQty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_FrozenQty]  DEFAULT ((0)),
	[LiempoQty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_LiempoQty]  DEFAULT ((0)),
	[LeegQty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_LeegQty]  DEFAULT ((0)),
	[Atsara100Qty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_Atsara100Qty]  DEFAULT ((0)),
	[Atsara160Qty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_Atsara160Qty]  DEFAULT ((0)),
	[ConvertedFreshQty] [float] NULL,
	[ConvertedFrozenQty] [float] NULL,
	[ConvertedLiempoQty] [float] NULL,
	[ConvertedLeegQty] [float] NULL,
	[ConvertedAtsara100Qty] [float] NULL,
	[ConvertedAtsara160Qty] [float] NULL,
	[FreshPrice] [float] NULL,
	[FrozenPrice] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_LiempoPrice]  DEFAULT ((0)),
	[LiempoPrice] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_LiempoPrice_1]  DEFAULT ((0)),
	[LeegPrice] [float] NULL,
	[Atsara100Price] [float] NULL,
	[Atsara160Price] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_Atsara160Price]  DEFAULT ((0)),
	[TotalFreshCost] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_TotalPrice]  DEFAULT ((0)),
	[TotalFrozenCost] [float] NULL,
	[TotalLiempoCost] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_TotalLiempoCost]  DEFAULT ((0)),
	[TotalLeegCost] [float] NULL,
	[TotalAtsara100Cost] [float] NULL,
	[TotalAtsara160Cost] [float] NULL,
	[OrderDate] [datetime] NOT NULL CONSTRAINT [DF_Delivery_Reciept_TF_OrderDate]  DEFAULT (getdate()),
	[Is2Trip] [bit] NULL CONSTRAINT [DF_Delivery_Reciept_TF_Is2Trip]  DEFAULT ((0)),
	[IsScheduled] [bit] NULL CONSTRAINT [DF_Delivery_Reciept_TF_IsDelivered]  DEFAULT ((1)),
	[IsAdded] [bit] NULL CONSTRAINT [DF_Delivery_Reciept_TF_IsAdded]  DEFAULT ((0)),
	[IsCancel] [bit] NULL CONSTRAINT [DF_Delivery_Reciept_TF_IsCancel]  DEFAULT ((0)),
	[Remarks] [nvarchar](250) NULL,
	[Assigned_LACode] [nvarchar](6) NULL,
	[DU] [datetime] NOT NULL CONSTRAINT [DF_Delivery_Reciept_TF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Delivery_Reciept_TF] PRIMARY KEY CLUSTERED 
(
	[DRNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
