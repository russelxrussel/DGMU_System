USE [DGMU]
GO
/****** Object:  Table [Master].[Storage_Data]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Storage_Data](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StorageCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[StockIn] [float] NULL CONSTRAINT [DF_Storage_Data_StockIn]  DEFAULT ((0)),
	[StockOut] [float] NULL CONSTRAINT [DF_Storage_Data_StockOut]  DEFAULT ((0)),
	[CurrentStock] [float] NULL CONSTRAINT [DF_Storage_Data_TotalStock]  DEFAULT ((0)),
	[DU] [datetime] NULL CONSTRAINT [DF_Storage_Data_DU]  DEFAULT (getdate()),
 CONSTRAINT [PK_Storage_Data] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
