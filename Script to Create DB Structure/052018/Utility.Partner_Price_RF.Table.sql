USE [DGMU]
GO
/****** Object:  Table [Utility].[Partner_Price_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Partner_Price_RF](
	[PPID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[PriceCode] [nvarchar](6) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Partner_Price_RF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Partner_Price_RF] PRIMARY KEY CLUSTERED 
(
	[PPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Utility].[Partner_Price_RF]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Code] FOREIGN KEY([PartnerCode])
REFERENCES [Master].[Partners_Data] ([PartnerCode])
GO
ALTER TABLE [Utility].[Partner_Price_RF] CHECK CONSTRAINT [FK_Partner_Code]
GO
ALTER TABLE [Utility].[Partner_Price_RF]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Price_Item] FOREIGN KEY([ItemCode])
REFERENCES [Master].[Item_Data] ([ItemCode])
GO
ALTER TABLE [Utility].[Partner_Price_RF] CHECK CONSTRAINT [FK_Partner_Price_Item]
GO
ALTER TABLE [Utility].[Partner_Price_RF]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Price_Price_RF] FOREIGN KEY([PriceCode])
REFERENCES [Utility].[Price_RF] ([PriceCode])
GO
ALTER TABLE [Utility].[Partner_Price_RF] CHECK CONSTRAINT [FK_Partner_Price_Price_RF]
GO
