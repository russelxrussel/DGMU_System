USE [DGMU]
GO
/****** Object:  Table [Master].[Partners_Data]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Partners_Data](
	[PartnerID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerCode] [nvarchar](6) NOT NULL,
	[PartnerName] [nvarchar](100) NULL,
	[P_Address] [nvarchar](250) NULL,
	[P_ContactNumber] [nvarchar](100) NULL,
	[P_ContactPerson] [nvarchar](50) NULL,
	[PriceCode] [nvarchar](6) NULL,
	[Liempo_PriceCode] [nvarchar](6) NULL,
	[Leeg_PriceCode] [nvarchar](6) NULL,
	[Atsara_PriceCode] [nvarchar](6) NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[PartnerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
