USE [DGMU]
GO
/****** Object:  Table [xSystem].[StatusCode_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [xSystem].[StatusCode_RF](
	[StatusCode] [nvarchar](1) NOT NULL,
	[StatusDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_StatusCode_RF] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
