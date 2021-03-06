USE [DGMU]
GO
/****** Object:  Table [Trans].[Delivery_Status_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Delivery_Status_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DRNum] [nvarchar](10) NULL,
	[BranchCode] [nvarchar](6) NULL,
	[IsSet] [bit] NULL,
	[IsCancel] [bit] NULL,
	[IsAdd] [bit] NULL,
	[DeliveryDateToday] [datetime] NULL,
	[DU] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Delivery_Status_TF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Trans].[Delivery_Status_TF] ADD  CONSTRAINT [DF_Delivery_Status_TF_IsSet]  DEFAULT ((0)) FOR [IsSet]
GO
ALTER TABLE [Trans].[Delivery_Status_TF] ADD  CONSTRAINT [DF_Delivery_Status_TF_IsCancel]  DEFAULT ((0)) FOR [IsCancel]
GO
ALTER TABLE [Trans].[Delivery_Status_TF] ADD  CONSTRAINT [DF_Delivery_Status_TF_IsAdd]  DEFAULT ((0)) FOR [IsAdd]
GO
ALTER TABLE [Trans].[Delivery_Status_TF] ADD  CONSTRAINT [DF_Delivery_Status_TF_DU]  DEFAULT (getdate()) FOR [DU]
GO
ALTER TABLE [Trans].[Delivery_Status_TF]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Status_TF_Delivery_Status_TF] FOREIGN KEY([id])
REFERENCES [Trans].[Delivery_Status_TF] ([id])
GO
ALTER TABLE [Trans].[Delivery_Status_TF] CHECK CONSTRAINT [FK_Delivery_Status_TF_Delivery_Status_TF]
GO
