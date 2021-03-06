USE [DGMU]
GO
/****** Object:  Table [Trans].[Direct_Receiving_Line_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Direct_Receiving_Line_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IRNum] [nvarchar](15) NOT NULL,
	[ItemCode] [nvarchar](8) NOT NULL,
	[Quantity] [int] NOT NULL CONSTRAINT [DF_Direct_Receiving_Line_TF_Quantity]  DEFAULT ((0)),
	[DI] [datetime] NOT NULL CONSTRAINT [DF_Direct_Receiving_Line_TF_DI]  DEFAULT (getdate()),
 CONSTRAINT [PK_Direct_Receiving_Line_TF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
