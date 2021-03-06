USE [DGMU]
GO
/****** Object:  Table [Utility].[Supplier_Price_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Supplier_Price_RF](
	[SPID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierCode] [nvarchar](6) NOT NULL,
	[ItemSubCatID] [int] NULL,
	[PriceCode] [nvarchar](6) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Supplier_Price_RF_DU]  DEFAULT (getdate()),
 CONSTRAINT [PK_Supplier_Price_RF] PRIMARY KEY CLUSTERED 
(
	[SPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
