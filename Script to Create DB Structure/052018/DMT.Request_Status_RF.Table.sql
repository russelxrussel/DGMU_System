USE [DGMU]
GO
/****** Object:  Table [DMT].[Request_Status_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DMT].[Request_Status_RF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RequestStatus] [nvarchar](1) NOT NULL,
	[RequestDescription] [nvarchar](50) NULL,
	[Type] [bit] NULL CONSTRAINT [DF_Request_Status_RF_Type]  DEFAULT ((1)),
 CONSTRAINT [PK_Request_Status_RF] PRIMARY KEY CLUSTERED 
(
	[RequestStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
