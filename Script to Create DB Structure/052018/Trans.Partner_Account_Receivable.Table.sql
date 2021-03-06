USE [DGMU]
GO
/****** Object:  Table [Trans].[Partner_Account_Receivable]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Partner_Account_Receivable](
	[PRNUM] [int] NOT NULL,
	[PartnerCode] [nvarchar](6) NOT NULL,
	[Reference] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[Date_Receivable] [datetime] NULL,
	[IsProcessed] [bit] NULL,
	[DU] [datetime] NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Partner_Account_Credit] PRIMARY KEY CLUSTERED 
(
	[PRNUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Trans].[Partner_Account_Receivable] ADD  CONSTRAINT [DF_Partner_Account_Credit_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [Trans].[Partner_Account_Receivable] ADD  CONSTRAINT [DF_Partner_Account_Credit_Date_Credited]  DEFAULT (getdate()) FOR [Date_Receivable]
GO
ALTER TABLE [Trans].[Partner_Account_Receivable] ADD  CONSTRAINT [DF_Partner_Account_Credit_IsProcessed]  DEFAULT ((0)) FOR [IsProcessed]
GO
ALTER TABLE [Trans].[Partner_Account_Receivable] ADD  CONSTRAINT [DF_Partner_Account_Credit_DU]  DEFAULT (getdate()) FOR [DU]
GO
