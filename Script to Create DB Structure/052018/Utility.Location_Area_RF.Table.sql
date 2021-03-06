USE [DGMU]
GO
/****** Object:  Table [Utility].[Location_Area_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Location_Area_RF](
	[LAID] [int] IDENTITY(1,1) NOT NULL,
	[LACode] [nvarchar](6) NOT NULL,
	[LAName] [nvarchar](200) NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Location_Area_RF] PRIMARY KEY CLUSTERED 
(
	[LACode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
