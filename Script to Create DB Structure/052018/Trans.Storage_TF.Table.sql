USE [DGMU]
GO
/****** Object:  Table [Trans].[Storage_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Storage_TF](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[STNum] [nvarchar](10) NOT NULL,
	[DateTransfer] [datetime] NOT NULL,
	[StorageFrom] [nvarchar](6) NULL,
	[StorageTo] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[Quantity] [float] NULL,
	[Remarks] [nvarchar](250) NULL,
	[DU] [datetime] NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Storage_TF] PRIMARY KEY CLUSTERED 
(
	[STNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Trans].[Storage_TF] ADD  CONSTRAINT [DF_Storage_TF_DU]  DEFAULT (getdate()) FOR [DU]
GO
