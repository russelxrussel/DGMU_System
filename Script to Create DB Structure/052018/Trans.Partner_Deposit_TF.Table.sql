USE [DGMU]
GO
/****** Object:  Table [Trans].[Partner_Deposit_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Partner_Deposit_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepositNum] [nvarchar](10) NOT NULL,
	[PartnerCode] [nvarchar](6) NULL,
	[DepositAmount] [float] NULL,
	[DepositDate] [datetime] NULL,
	[ChequeNumber] [nvarchar](50) NULL,
	[Bank] [nvarchar](50) NULL,
	[Remarks] [nvarchar](50) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Partner_Deposit_TF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Partner_Deposit_TF] PRIMARY KEY CLUSTERED 
(
	[DepositNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
