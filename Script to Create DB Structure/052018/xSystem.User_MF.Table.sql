USE [DGMU]
GO
/****** Object:  Table [xSystem].[User_MF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [xSystem].[User_MF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserCode] [nvarchar](15) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
	[Account_Type_Code] [nvarchar](2) NOT NULL CONSTRAINT [DF_User_MF_Account_Type_Code]  DEFAULT (N'U'),
	[FlgStatus] [bit] NOT NULL CONSTRAINT [DF_User_MF_FlgStatus]  DEFAULT ((1)),
	[LastLog] [datetime] NULL CONSTRAINT [DF_User_MF_LastLog]  DEFAULT (getdate()),
	[DMTAccess] [bit] NULL CONSTRAINT [DF_User_MF_DMTAccess]  DEFAULT ((0)),
	[DI] [datetime] NULL CONSTRAINT [DF_User_MF_DI]  DEFAULT (getdate()),
 CONSTRAINT [PK_User_MF] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
