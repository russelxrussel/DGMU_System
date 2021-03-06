USE [DGMU]
GO
/****** Object:  Table [Utility].[Vehicle_RF]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Vehicle_RF](
	[PlateID] [int] IDENTITY(1,1) NOT NULL,
	[PlateNumber] [nvarchar](20) NOT NULL,
	[VehicleDescription] [nvarchar](100) NULL,
	[LoadCapacity] [int] NULL CONSTRAINT [DF_Plate_RF_LoadCapacity]  DEFAULT ((0)),
 CONSTRAINT [PK_Plate_RF] PRIMARY KEY CLUSTERED 
(
	[PlateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
