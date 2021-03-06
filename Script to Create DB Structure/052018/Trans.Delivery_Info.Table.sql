USE [DGMU]
GO
/****** Object:  Table [Trans].[Delivery_Info]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Delivery_Info](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LACode] [nvarchar](6) NULL,
	[T1Driver1] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Driver1]  DEFAULT ((0)),
	[T1Driver2] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Driver2]  DEFAULT ((0)),
	[T1Helper1] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Helper1]  DEFAULT ((0)),
	[T1Helper2] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Helper2]  DEFAULT ((0)),
	[T1Vehicle] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Vehicle]  DEFAULT ((0)),
	[T1Capacity] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Capacity]  DEFAULT ((0)),
	[T1Remarks] [nvarchar](250) NULL,
	[T2Driver1] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Driver11]  DEFAULT ((0)),
	[T2Driver2] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Driver21]  DEFAULT ((0)),
	[T2Helper1] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Helper11]  DEFAULT ((0)),
	[T2Helper2] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Helper21]  DEFAULT ((0)),
	[T2Vehicle] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Vehicle1]  DEFAULT ((0)),
	[T2Capacity] [int] NULL CONSTRAINT [DF_Delivery_Info_T1Capacity1]  DEFAULT ((0)),
	[T2Remarks] [nvarchar](250) NULL,
	[Is2Trip] [bit] NULL CONSTRAINT [DF_Delivery_Info_Is2Trip]  DEFAULT ((0)),
	[DriverName] [nvarchar](50) NULL,
	[HelperName] [nvarchar](50) NULL,
	[VehiclePlateNumber] [nvarchar](10) NULL,
	[DeliveryOrder] [datetime] NULL,
	[Trip1Drivers] [nvarchar](150) NULL,
	[Trip2Drivers] [nvarchar](150) NULL,
	[Trip1Helpers] [nvarchar](150) NULL,
	[Trip2Helpers] [nvarchar](150) NULL,
	[Trip1VehicleDetails] [nvarchar](150) NULL,
	[Trip2VehicleDetails] [nvarchar](150) NULL,
 CONSTRAINT [PK_Delivery_Info] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
