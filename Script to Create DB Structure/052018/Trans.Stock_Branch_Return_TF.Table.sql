USE [DGMU]
GO
/****** Object:  Table [Trans].[Stock_Branch_Return_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Stock_Branch_Return_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SRNum] [nvarchar](10) NOT NULL,
	[PartnerCode] [nvarchar](6) NULL,
	[BranchCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[Quantity] [float] NULL CONSTRAINT [DF_Stock_Branch_Return_TF_Quantity]  DEFAULT ((0)),
	[CreditToAccount] [bit] NULL CONSTRAINT [DF_Stock_Branch_Return_TF_CreditToAccount]  DEFAULT ((1)),
	[DateReturn] [datetime] NULL CONSTRAINT [DF_Stock_Branch_Return_TF_DateReturn]  DEFAULT (getdate()),
	[Remarks] [nvarchar](150) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Stock_Branch_Return_TF_DU]  DEFAULT (getdate()),
 CONSTRAINT [PK_Stock_Branch_Return_TF] PRIMARY KEY CLUSTERED 
(
	[SRNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
