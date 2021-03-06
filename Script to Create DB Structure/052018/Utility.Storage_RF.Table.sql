USE [DGMU]
GO
/****** Object:  Table [Utility].[Storage_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Storage_RF](
	[StorageID] [int] IDENTITY(1,1) NOT NULL,
	[StorageCode] [nvarchar](6) NULL,
	[StorageName] [nvarchar](150) NULL,
	[Remarks] [nvarchar](250) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Storage_RF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Storage_RF] PRIMARY KEY CLUSTERED 
(
	[StorageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
