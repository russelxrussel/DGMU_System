USE [DGMU]
GO
/****** Object:  Table [Trans].[Pickup_Transfer_Branch_Receive_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Pickup_Transfer_Branch_Receive_TF](
	[PDID] [int] IDENTITY(1,1) NOT NULL,
	[PTBNum] [nvarchar](12) NOT NULL,
	[DPTNum] [nvarchar](12) NOT NULL,
	[BranchCode] [nvarchar](6) NOT NULL,
	[Branch_ItemCode] [nvarchar](6) NOT NULL,
	[QuantityReceived] [int] NOT NULL CONSTRAINT [DF_Pickup_Transfer_Branch_Receive_TF_QuantityReceived]  DEFAULT ((0)),
	[DateReceived] [datetime] NULL,
	[DI] [datetime] NULL CONSTRAINT [DF_Pickup_Transfer_Branch_Receive_TF_DI]  DEFAULT (getdate()),
	[Remarks] [nvarchar](150) NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Pickup_Transfer_Branch_Receive_TF] PRIMARY KEY CLUSTERED 
(
	[PDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
