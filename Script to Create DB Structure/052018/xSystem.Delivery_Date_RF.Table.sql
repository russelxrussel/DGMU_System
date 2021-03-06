USE [DGMU]
GO
/****** Object:  Table [xSystem].[Delivery_Date_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [xSystem].[Delivery_Date_RF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateDeliveryList] [datetime] NULL,
 CONSTRAINT [PK_Delivery_Date_Generate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [xSystem].[Delivery_Date_RF] ADD  CONSTRAINT [DF_Delivery_Date_Generate_DateDeliveryListGenerate]  DEFAULT (getdate()) FOR [DateDeliveryList]
GO
