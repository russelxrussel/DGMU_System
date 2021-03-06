USE [DGMU]
GO
/****** Object:  Table [Trans].[Partner_Account_Payable]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Partner_Account_Payable](
	[PPNUM] [int] IDENTITY(1,1) NOT NULL,
	[PartnerCode] [nvarchar](6) NOT NULL,
	[Reference] [nvarchar](50) NULL,
	[Source] [nvarchar](50) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[ItemQuantity] [float] NULL CONSTRAINT [DF_Partner_Account_Payable_ItemQuantity]  DEFAULT ((0)),
	[ItemConversionQty] [float] NULL,
	[UnitPrice] [float] NULL CONSTRAINT [DF_Partner_Account_Payable_UnitPrice]  DEFAULT ((0)),
	[Amount] [float] NULL CONSTRAINT [DF_Partner_Account_Debit_Amount]  DEFAULT ((0)),
	[Date_Payable] [datetime] NULL CONSTRAINT [DF_Partner_Account_Credit_Date_Debit]  DEFAULT (getdate()),
	[IsProcessed] [bit] NULL CONSTRAINT [DF_Partner_Account_Debit_IsProcessed]  DEFAULT ((0)),
	[IsCancel] [bit] NULL CONSTRAINT [DF_Partner_Account_Payable_IsCancel]  DEFAULT ((0)),
	[IsCount] [bit] NULL CONSTRAINT [DF_Partner_Account_Payable_IsCount]  DEFAULT ((1)),
	[DU] [datetime] NULL CONSTRAINT [DF_Partner_Account_Debit_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Partner_Account_Debit] PRIMARY KEY CLUSTERED 
(
	[PPNUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
