USE [DGMU]
GO
/****** Object:  Table [Master].[Supplier_Data]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Supplier_Data](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierCode] [nvarchar](6) NOT NULL,
	[SupplierName] [nvarchar](100) NULL,
	[S_Address] [nvarchar](250) NULL,
	[S_ContactNumber] [nvarchar](50) NULL,
	[S_ContactPerson] [nvarchar](100) NULL,
 CONSTRAINT [PK_Supplier_Data] PRIMARY KEY CLUSTERED 
(
	[SupplierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
