USE [DGMU]
GO
/****** Object:  Table [Trans].[Direct_Receiving_Hdr_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Direct_Receiving_Hdr_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IRNum] [nvarchar](15) NOT NULL,
	[SupplierCode] [nvarchar](10) NOT NULL,
	[DateReceived] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[DI] [datetime] NOT NULL CONSTRAINT [DF_Direct_Receiving_Hrd_TF_DI]  DEFAULT (getdate()),
	[UserCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_Direct_Receiving_Hrd_TF] PRIMARY KEY CLUSTERED 
(
	[IRNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
