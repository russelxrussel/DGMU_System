USE [DGMU]
GO
/****** Object:  Table [DMT].[DebitMemoRequest_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DMT].[DebitMemoRequest_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DMRNum] [nvarchar](15) NULL,
	[ItemID] [int] NULL,
	[ItemDescription] [nvarchar](150) NOT NULL,
	[Quantity] [float] NULL,
	[Amount] [float] NOT NULL,
	[Purpose_Remarks] [nvarchar](250) NULL,
	[Attachment] [image] NULL,
	[DateRequest] [datetime] NULL,
	[RequestStatus] [nvarchar](2) NULL CONSTRAINT [DF_DebitMemoRequest_TF_RequestStatus]  DEFAULT (N'F'),
	[DateApproved] [datetime] NULL,
	[DI] [datetime] NULL CONSTRAINT [DF_DebitMemoRequest_TF_DI]  DEFAULT (getdate()),
	[IsAttachment] [bit] NULL CONSTRAINT [DF_DebitMemoRequest_TF_IsAttachment]  DEFAULT ((0)),
 CONSTRAINT [PK_DebitMemoRequest_TF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
