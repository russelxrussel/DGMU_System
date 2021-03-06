USE [DGMU]
GO
/****** Object:  Table [Utility].[Price_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Price_RF](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[PriceCode] [nvarchar](6) NOT NULL,
	[PriceAmount] [float] NOT NULL CONSTRAINT [DF_Price_RF_PriceAmount]  DEFAULT ((0)),
	[PriceDescription] [nvarchar](150) NULL,
	[DU] [datetime] NOT NULL CONSTRAINT [DF_Price_RF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Price_RF] PRIMARY KEY CLUSTERED 
(
	[PriceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
