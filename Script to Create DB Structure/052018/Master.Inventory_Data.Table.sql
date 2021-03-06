USE [DGMU]
GO
/****** Object:  Table [Master].[Inventory_Data]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Inventory_Data](
	[InvID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](6) NULL,
	[BegStock] [float] NULL CONSTRAINT [DF_Inventory_Data_BegStock]  DEFAULT ((0)),
	[InStock] [float] NULL CONSTRAINT [DF_Inventory_Data_InStock]  DEFAULT ((0)),
	[OutStock] [float] NULL CONSTRAINT [DF_Inventory_Data_OutStock]  DEFAULT ((0)),
	[RunningStock] [float] NULL CONSTRAINT [DF_Inventory_Data_RunningStock]  DEFAULT ((0)),
	[InvUomCode] [nvarchar](3) NULL,
	[TransferIN] [float] NULL CONSTRAINT [DF_Inventory_Data_TransferIN]  DEFAULT ((0)),
	[TransferOUT] [float] NULL CONSTRAINT [DF_Inventory_Data_TransferOUT]  DEFAULT ((0)),
	[MinimumStockLevel] [float] NULL CONSTRAINT [DF_Inventory_Data_MinimumStockLevel]  DEFAULT ((0)),
	[dateUpdate] [datetime] NULL CONSTRAINT [DF_Inventory_Data_dateUpdate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Inventory_Data] PRIMARY KEY CLUSTERED 
(
	[InvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Master].[Inventory_Data]  WITH CHECK ADD  CONSTRAINT [ItemCode_FK] FOREIGN KEY([ItemCode])
REFERENCES [Master].[Item_Data] ([ItemCode])
GO
ALTER TABLE [Master].[Inventory_Data] CHECK CONSTRAINT [ItemCode_FK]
GO
