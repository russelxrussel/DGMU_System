USE [DGMU]
GO
/****** Object:  Table [Trans].[Delivery_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Delivery_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DRNum] [nvarchar](10) NOT NULL,
	[BranchCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[InvQty] [float] NULL,
	[PartnerQty] [float] NULL,
	[PartnerUom] [nvarchar](10) NULL,
	[UnitPrice] [float] NULL,
	[TotalPrice] [float] NULL,
	[RemainingQty] [float] NULL,
	[RowStatus] [nvarchar](1) NULL,
	[OrderDate] [datetime] NOT NULL,
	[IsDelivered] [bit] NULL,
	[Remarks] [nvarchar](250) NULL,
	[DU] [datetime] NOT NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DRNum_Rows] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Trans].[Delivery_TF] ADD  CONSTRAINT [DF_Delivery_TotalPrice]  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [Trans].[Delivery_TF] ADD  CONSTRAINT [DF_Delivery_RowStatus]  DEFAULT ('O') FOR [RowStatus]
GO
ALTER TABLE [Trans].[Delivery_TF] ADD  CONSTRAINT [DF_Delivery_TF_DateOrder]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [Trans].[Delivery_TF] ADD  CONSTRAINT [DF_Delivery_TF_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [Trans].[Delivery_TF] ADD  CONSTRAINT [DF_Delivery_DU]  DEFAULT (getdate()) FOR [DU]
GO
ALTER TABLE [Trans].[Delivery_TF]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_TF_Branch] FOREIGN KEY([BranchCode])
REFERENCES [Master].[Branch_Data] ([BranchCode])
GO
ALTER TABLE [Trans].[Delivery_TF] CHECK CONSTRAINT [FK_Delivery_TF_Branch]
GO
ALTER TABLE [Trans].[Delivery_TF]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_TF_Item] FOREIGN KEY([ItemCode])
REFERENCES [Master].[Item_Data] ([ItemCode])
GO
ALTER TABLE [Trans].[Delivery_TF] CHECK CONSTRAINT [FK_Delivery_TF_Item]
GO
