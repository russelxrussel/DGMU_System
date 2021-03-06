USE [DGMU]
GO
/****** Object:  Table [DMT].[DebitMemoRequest_Header_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DMT].[DebitMemoRequest_Header_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DMRNum] [nvarchar](15) NOT NULL,
	[DateRequest] [datetime] NOT NULL CONSTRAINT [DF_DebitMemoRequest_Header_TF_DateRequest]  DEFAULT (getdate()),
	[BranchCode] [nvarchar](10) NULL,
	[Supervisor] [nvarchar](50) NULL,
	[RequestFor] [nvarchar](50) NULL,
	[ChargeTo] [nvarchar](50) NULL,
	[AssignedTo] [nvarchar](50) NULL,
	[IsCompleted] [bit] NOT NULL CONSTRAINT [DF_DebitMemoRequest_Header_TF_IsCompleted]  DEFAULT ((0)),
	[IsCancel] [bit] NOT NULL CONSTRAINT [DF_DebitMemoRequest_Header_TF_IsCancel]  DEFAULT ((0)),
	[Approver_Notes] [nvarchar](250) NULL,
	[DU] [datetime] NOT NULL CONSTRAINT [DF_DebitMemoRequest_Header_TF_DU]  DEFAULT (getdate()),
	[DI] [datetime] NULL CONSTRAINT [DF_DebitMemoRequest_Header_TF_DI]  DEFAULT (getdate()),
 CONSTRAINT [PK_DebitMemoRequest_Header_TF] PRIMARY KEY CLUSTERED 
(
	[DMRNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
