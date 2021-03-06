USE [DGMU]
GO
/****** Object:  Table [Trans].[Inventory]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Inventory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionNum] [nvarchar](50) NULL,
	[ItemCode] [nvarchar](10) NULL,
	[Quantity] [float] NULL,
	[DateTrans] [datetime] NULL CONSTRAINT [DF_Inventory_DateTrans]  DEFAULT (getdate()),
	[IsMoveIn] [bit] NOT NULL CONSTRAINT [DF_Inventory_IsMoveOut]  DEFAULT ((1)),
	[DU] [datetime] NULL CONSTRAINT [DF_Inventory_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
