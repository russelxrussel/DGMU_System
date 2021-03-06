USE [DGMU]
GO
/****** Object:  Table [Trans].[Pickup_Transfer_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Pickup_Transfer_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PTNum] [nvarchar](12) NOT NULL,
	[PartnerCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_Pickup_Transfer_TF_Quantity]  DEFAULT ((0)),
	[Conversion] [int] NULL CONSTRAINT [DF_Pickup_Transfer_TF_Conversion]  DEFAULT ((0)),
	[ConvertedQty] [int] NULL CONSTRAINT [DF_Pickup_Transfer_TF_ConvertedQty]  DEFAULT ((0)),
	[UnitPrice] [float] NULL,
	[Remarks] [nvarchar](250) NULL,
	[DateTrans] [datetime] NULL CONSTRAINT [DF_PICK_TRANSFER_TF_DateTrans]  DEFAULT (getdate()),
	[IsClosed] [bit] NULL CONSTRAINT [DF_Pickup_Transfer_TF_IsClosed]  DEFAULT ((0)),
	[DI] [datetime] NULL CONSTRAINT [DF_PICK_TRANSFER_TF_DI]  DEFAULT (getdate()),
	[PTBNum] [nvarchar](12) NULL,
 CONSTRAINT [PK_PICK_TRANSFER_TF] PRIMARY KEY CLUSTERED 
(
	[PTNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
