USE [DGMU]
GO
/****** Object:  Table [Trans].[PickUp_Transfer_Branch_Source_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[PickUp_Transfer_Branch_Source_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PTBNum] [nvarchar](12) NOT NULL,
	[PartnerCode] [nvarchar](20) NOT NULL,
	[BranchItemCode] [nvarchar](6) NOT NULL,
	[TotalQty] [int] NULL CONSTRAINT [DF_PickUp_Transfer_Branch_Source_TF_TotalQty]  DEFAULT ((0)),
	[DistributedQty] [int] NULL CONSTRAINT [DF_PickUp_Transfer_Branch_Source_TF_DistributedQty]  DEFAULT ((0)),
	[IsClosed] [bit] NULL CONSTRAINT [DF_PickUp_Transfer_Branch_Source_TF_IsClosed]  DEFAULT ((0)),
	[DateTrans] [datetime] NULL CONSTRAINT [DF_PickUp_Transfer_Branch_Source_TF_DateTrans]  DEFAULT (getdate()),
	[DI] [datetime] NULL CONSTRAINT [DF_PickUp_Transfer_Branch_Source_TF_DI]  DEFAULT (getdate()),
 CONSTRAINT [PK_PickUp_Transfer_Branch_Source_TF_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
