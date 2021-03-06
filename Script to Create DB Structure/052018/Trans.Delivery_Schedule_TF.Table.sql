USE [DGMU]
GO
/****** Object:  Table [Trans].[Delivery_Schedule_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Delivery_Schedule_TF](
	[schedListID] [int] IDENTITY(1,1) NOT NULL,
	[DRNum] [nvarchar](10) NULL,
	[BranchCode] [nvarchar](6) NULL,
	[M] [bit] NULL,
	[T] [bit] NULL,
	[W] [bit] NULL,
	[TH] [bit] NULL,
	[F] [bit] NULL,
	[SA] [bit] NULL,
	[S] [bit] NULL,
	[IsSched] [bit] NULL,
	[IsPostpone] [bit] NULL,
	[IsSet] [bit] NULL,
	[IsAdd] [bit] NULL,
	[DeliveryDate] [datetime] NULL,
	[Remarks] [nvarchar](150) NULL,
	[DU] [datetime] NULL,
 CONSTRAINT [PK_Delivery_Schedule_TF] PRIMARY KEY CLUSTERED 
(
	[schedListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_M]  DEFAULT ((0)) FOR [M]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_T]  DEFAULT ((0)) FOR [T]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_W]  DEFAULT ((0)) FOR [W]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_W1]  DEFAULT ((0)) FOR [TH]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_W1_1]  DEFAULT ((0)) FOR [F]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_W1_2]  DEFAULT ((0)) FOR [SA]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_W1_3]  DEFAULT ((0)) FOR [S]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_IsSched]  DEFAULT ((0)) FOR [IsSched]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_IsCancel]  DEFAULT ((0)) FOR [IsPostpone]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_IsSet]  DEFAULT ((0)) FOR [IsSet]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_IsAdd]  DEFAULT ((0)) FOR [IsAdd]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_DU]  DEFAULT (getdate()) FOR [DU]
GO
