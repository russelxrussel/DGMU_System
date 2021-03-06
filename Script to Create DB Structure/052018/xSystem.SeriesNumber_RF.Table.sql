USE [DGMU]
GO
/****** Object:  Table [xSystem].[SeriesNumber_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [xSystem].[SeriesNumber_RF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PrefixCode] [nvarchar](5) NOT NULL,
	[PrefixAppend] [nvarchar](5) NULL,
	[Description] [nvarchar](150) NULL,
	[Series] [int] NULL,
	[IsNumberOnly] [bit] NULL CONSTRAINT [DF_SeriesNumber_RF_IsNumberOnly]  DEFAULT ((0)),
 CONSTRAINT [PK_SeriesNumber] PRIMARY KEY CLUSTERED 
(
	[PrefixCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
