USE [DGMU]
GO
/****** Object:  Table [Utility].[Delivery_Schedule_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Delivery_Schedule_RF](
	[schedID] [int] IDENTITY(1,1) NOT NULL,
	[BranchCode] [nvarchar](6) NOT NULL,
	[M] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_M]  DEFAULT ((0)),
	[T] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_T]  DEFAULT ((0)),
	[W] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_W]  DEFAULT ((0)),
	[Th] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_Th]  DEFAULT ((0)),
	[F] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_F]  DEFAULT ((0)),
	[Sa] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_Sa]  DEFAULT ((0)),
	[S] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_S]  DEFAULT ((0)),
	[DU] [datetime] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Delivery_Schedule_RF] PRIMARY KEY CLUSTERED 
(
	[BranchCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
