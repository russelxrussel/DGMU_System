USE [DGMU]
GO
/****** Object:  Table [xSystem].[Menu_MF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [xSystem].[Menu_MF](
	[menuID] [int] NOT NULL,
	[menuText] [nvarchar](100) NULL,
	[url] [nvarchar](100) NULL,
	[parentMenuID] [int] NULL,
	[position] [nvarchar](6) NULL,
	[arr] [nvarchar](2) NULL,
	[flgChild] [bit] NOT NULL CONSTRAINT [DF_Menu_MF_isChild]  DEFAULT ((0)),
 CONSTRAINT [PK_Menu_MF_1] PRIMARY KEY CLUSTERED 
(
	[menuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
