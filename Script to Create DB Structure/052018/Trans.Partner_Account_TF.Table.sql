USE [DGMU]
GO
/****** Object:  Table [Trans].[Partner_Account_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Partner_Account_TF](
	[id] [int] NOT NULL,
	[Trans_Id] [nvarchar](6) NULL,
	[Trans_Type_Code] [nvarchar](2) NULL,
	[Reference] [nvarchar](50) NULL,
	[Receivable] [float] NULL,
	[Payable] [float] NULL,
	[Running_Balance] [float] NULL,
	[DateUpdate] [datetime] NULL,
 CONSTRAINT [PK_Partner_Account_TF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Trans].[Partner_Account_TF] ADD  CONSTRAINT [DF_Partner_Account_TF_Credit]  DEFAULT ((0)) FOR [Receivable]
GO
ALTER TABLE [Trans].[Partner_Account_TF] ADD  CONSTRAINT [DF_Partner_Account_TF_Debit]  DEFAULT ((0)) FOR [Payable]
GO
ALTER TABLE [Trans].[Partner_Account_TF] ADD  CONSTRAINT [DF_Partner_Account_TF_Balance]  DEFAULT ((0)) FOR [Running_Balance]
GO
ALTER TABLE [Trans].[Partner_Account_TF] ADD  CONSTRAINT [DF_Partner_Account_TF_DateUpdate]  DEFAULT (getdate()) FOR [DateUpdate]
GO
