USE [DGMU]
GO
/****** Object:  Schema [DMT]    Script Date: 5/2/2018 9:07:38 AM ******/
CREATE SCHEMA [DMT]
GO
/****** Object:  Schema [HR]    Script Date: 5/2/2018 9:07:38 AM ******/
CREATE SCHEMA [HR]
GO
/****** Object:  Schema [Master]    Script Date: 5/2/2018 9:07:38 AM ******/
CREATE SCHEMA [Master]
GO
/****** Object:  Schema [Trans]    Script Date: 5/2/2018 9:07:38 AM ******/
CREATE SCHEMA [Trans]
GO
/****** Object:  Schema [Utility]    Script Date: 5/2/2018 9:07:38 AM ******/
CREATE SCHEMA [Utility]
GO
/****** Object:  Schema [xSystem]    Script Date: 5/2/2018 9:07:38 AM ******/
CREATE SCHEMA [xSystem]
GO
/****** Object:  Table [DMT].[DebitMemoRequest_Header_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DMT].[DebitMemoRequest_Header_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DMRNum] [nvarchar](15) NOT NULL,
	[DateRequest] [datetime] NOT NULL CONSTRAINT [DF_DebitMemoRequest_Header_TF_DateRequest]  DEFAULT (getdate()),
	[BranchCode] [nvarchar](10) NULL,
	[Supervisor] [nvarchar](50) NULL,
	[RequestFor] [nvarchar](50) NULL,
	[ChargeTo] [nvarchar](50) NULL,
	[AssignedTo] [nvarchar](50) NULL,
	[IsCompleted] [bit] NOT NULL CONSTRAINT [DF_DebitMemoRequest_Header_TF_IsCompleted]  DEFAULT ((0)),
	[IsCancel] [bit] NOT NULL CONSTRAINT [DF_DebitMemoRequest_Header_TF_IsCancel]  DEFAULT ((0)),
	[Approver_Notes] [nvarchar](250) NULL,
	[DU] [datetime] NOT NULL CONSTRAINT [DF_DebitMemoRequest_Header_TF_DU]  DEFAULT (getdate()),
	[DI] [datetime] NULL CONSTRAINT [DF_DebitMemoRequest_Header_TF_DI]  DEFAULT (getdate()),
 CONSTRAINT [PK_DebitMemoRequest_Header_TF] PRIMARY KEY CLUSTERED 
(
	[DMRNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [DMT].[DebitMemoRequest_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DMT].[DebitMemoRequest_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DMRNum] [nvarchar](15) NULL,
	[ItemID] [int] NULL,
	[ItemDescription] [nvarchar](150) NOT NULL,
	[Quantity] [float] NULL,
	[Amount] [float] NOT NULL,
	[Purpose_Remarks] [nvarchar](250) NULL,
	[Attachment] [image] NULL,
	[DateRequest] [datetime] NULL,
	[RequestStatus] [nvarchar](2) NULL CONSTRAINT [DF_DebitMemoRequest_TF_RequestStatus]  DEFAULT (N'F'),
	[DateApproved] [datetime] NULL,
	[DI] [datetime] NULL CONSTRAINT [DF_DebitMemoRequest_TF_DI]  DEFAULT (getdate()),
	[IsAttachment] [bit] NULL CONSTRAINT [DF_DebitMemoRequest_TF_IsAttachment]  DEFAULT ((0)),
 CONSTRAINT [PK_DebitMemoRequest_TF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [DMT].[Item_MF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DMT].[Item_MF](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemDescription] [nvarchar](250) NULL,
	[UOM] [nvarchar](10) NULL,
	[ItemGroupCode] [nvarchar](2) NULL,
 CONSTRAINT [PK_Item_MF] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [DMT].[Request_Status_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
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
/****** Object:  Table [HR].[Employee_Employment_Details_MD]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Employee_Employment_Details_MD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](10) NOT NULL,
	[TIN] [nvarchar](20) NULL,
	[SSS] [nvarchar](20) NULL,
	[HDMF] [nvarchar](20) NULL,
	[PhilHealth] [nvarchar](20) NULL,
	[Date_Hired] [datetime] NULL,
	[DepartmentCode] [nvarchar](3) NULL,
	[PositionCode] [nvarchar](3) NULL,
	[EmploymentStatusCode] [nvarchar](5) NULL,
 CONSTRAINT [PK_Employee_Employement_MD] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HR].[Employee_MD]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Employee_MD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](10) NOT NULL,
	[Last_Name] [nvarchar](25) NULL,
	[First_Name] [nvarchar](25) NULL,
	[Middle_Name] [nvarchar](25) NULL,
	[Nick_Name] [nvarchar](20) NULL,
	[GenderCode] [nvarchar](1) NOT NULL,
	[Date_Of_Birth] [datetime] NULL,
	[Place_Of_Birth] [nvarchar](100) NULL,
	[Weight] [nvarchar](10) NULL,
	[Height] [nvarchar](10) NULL,
	[Landline_Number] [nvarchar](50) NULL,
	[Mobile_Number] [nvarchar](50) NULL,
	[ReligionCode] [nvarchar](3) NULL,
	[CitizenshipCode] [nvarchar](3) NULL,
	[Present_Address] [nvarchar](150) NULL,
	[Provincial_Address] [nvarchar](150) NULL,
 CONSTRAINT [PK_Employee_MD] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HR].[Employee_Picture_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [HR].[Employee_Picture_RF](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [nvarchar](10) NULL,
	[Picture_Name] [nvarchar](255) NULL,
	[Size] [int] NULL,
	[Image_Data] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [HR].[Utility_Citizenship_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Utility_Citizenship_RF](
	[CitizenshipID] [int] IDENTITY(1,1) NOT NULL,
	[CitizenshipCode] [nvarchar](3) NOT NULL,
	[Citizenship] [nvarchar](50) NULL,
	[Arr] [nvarchar](2) NULL,
 CONSTRAINT [PK_Utility_Citizenship_RF] PRIMARY KEY CLUSTERED 
(
	[CitizenshipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HR].[Utility_Department_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Utility_Department_RF](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [nvarchar](3) NULL,
	[Department] [nvarchar](50) NULL,
	[DepartmentHead] [nvarchar](10) NULL,
 CONSTRAINT [PK_Utility_Department_RF] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HR].[Utility_Employment_Status_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Utility_Employment_Status_RF](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusCode] [nvarchar](3) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Utility_Employment_RF] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HR].[Utility_Gender_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Utility_Gender_RF](
	[GenderCode] [nvarchar](1) NOT NULL,
	[GenderDescription] [nvarchar](6) NULL,
 CONSTRAINT [PK_Utility_Gender_RF] PRIMARY KEY CLUSTERED 
(
	[GenderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HR].[Utility_Position_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Utility_Position_RF](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionCode] [nvarchar](3) NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [PK_Utility_Designation_RF] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HR].[Utility_Religion_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[Utility_Religion_RF](
	[ReligionID] [int] IDENTITY(1,1) NOT NULL,
	[ReligionCode] [nvarchar](3) NOT NULL,
	[Religion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Utility_Religion_RF] PRIMARY KEY CLUSTERED 
(
	[ReligionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Master].[Branch_Data]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Branch_Data](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchCode] [nvarchar](6) NOT NULL,
	[PartnerCode] [nvarchar](6) NOT NULL,
	[LACode] [nvarchar](6) NOT NULL,
	[BranchName] [nvarchar](150) NULL,
	[B_Address] [nvarchar](250) NULL,
	[B_ContactNumbers] [nvarchar](150) NULL,
	[Supervisor] [nvarchar](100) NULL,
 CONSTRAINT [PK_Branch_Data] PRIMARY KEY CLUSTERED 
(
	[BranchCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Master].[Branch_Inventory_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Branch_Inventory_RF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchCode] [nvarchar](6) NULL,
	[Branch_ItemCode] [nvarchar](6) NULL,
	[Beginning_Stock] [int] NOT NULL CONSTRAINT [DF_Branch_Inventory_RF_Total_Stock]  DEFAULT ((0)),
	[Stock_IN] [int] NOT NULL CONSTRAINT [DF_Branch_Inventory_RF_Stock_IN]  DEFAULT ((0)),
	[Stock_OUT] [int] NOT NULL CONSTRAINT [DF_Branch_Inventory_RF_Stock_OUT]  DEFAULT ((0)),
	[Stock_On_Hand] [int] NOT NULL CONSTRAINT [DF_Branch_Inventory_RF_Stock_OnHand]  DEFAULT ((0)),
	[IsBegDone] [bit] NULL CONSTRAINT [DF_Branch_Inventory_RF_IsBegDone]  DEFAULT ((0)),
	[Remarks] [nvarchar](250) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Branch_Inventory_RF_DU]  DEFAULT (getdate()),
 CONSTRAINT [PK_Branch_Inventory_RF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Master].[Branch_Item_MF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Branch_Item_MF](
	[BranchItemCodeID] [int] IDENTITY(1,1) NOT NULL,
	[Branch_ItemCode] [nvarchar](6) NOT NULL,
	[Branch_ItemName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Item_Group_RF] PRIMARY KEY CLUSTERED 
(
	[BranchItemCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Master].[Inventory_Data]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Inventory_Data](
	[InvID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](6) NULL,
	[BegStock] [float] NULL CONSTRAINT [DF_Inventory_Data_BegStock]  DEFAULT ((0)),
	[InStock] [float] NULL CONSTRAINT [DF_Inventory_Data_InStock]  DEFAULT ((0)),
	[OutStock] [float] NULL CONSTRAINT [DF_Inventory_Data_OutStock]  DEFAULT ((0)),
	[RunningStock] [float] NULL CONSTRAINT [DF_Inventory_Data_RunningStock]  DEFAULT ((0)),
	[InvUomCode] [nvarchar](3) NULL,
	[TransferIN] [float] NULL CONSTRAINT [DF_Inventory_Data_TransferIN]  DEFAULT ((0)),
	[TransferOUT] [float] NULL CONSTRAINT [DF_Inventory_Data_TransferOUT]  DEFAULT ((0)),
	[MinimumStockLevel] [float] NULL CONSTRAINT [DF_Inventory_Data_MinimumStockLevel]  DEFAULT ((0)),
	[dateUpdate] [datetime] NULL CONSTRAINT [DF_Inventory_Data_dateUpdate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Inventory_Data] PRIMARY KEY CLUSTERED 
(
	[InvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Master].[Item_Data]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Item_Data](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](6) NOT NULL,
	[ItemName] [nvarchar](150) NULL,
	[InvUomCode] [nvarchar](6) NULL,
	[PurchasingPriceCode] [nvarchar](6) NULL CONSTRAINT [DF_Item_Data_S_Price]  DEFAULT ((0)),
	[PurchasingUomCode] [nvarchar](6) NULL,
	[SellingUomCode] [nvarchar](6) NULL,
	[ConversionQty] [float] NULL CONSTRAINT [DF_Item_Data_ConversionQty]  DEFAULT ((1)),
	[IsSubCat] [bit] NULL CONSTRAINT [DF_Item_Data_IsSubCat]  DEFAULT ((0)),
	[Branch_ItemCode] [nvarchar](6) NULL,
 CONSTRAINT [PK_Item_Data] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Master].[Partner_Account_Data]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Partner_Account_Data](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartnerCode] [nvarchar](6) NOT NULL,
	[PartnerName] [nvarchar](150) NULL,
	[Total_Credit] [float] NULL CONSTRAINT [DF_Partner_Account_Data_Credit]  DEFAULT ((0)),
	[Total_Debit] [float] NULL CONSTRAINT [DF_Partner_Account_Data_Debit]  DEFAULT ((0)),
	[Balance] [float] NULL CONSTRAINT [DF_Partner_Account_Data_Balance]  DEFAULT ((0)),
	[Last_Update] [datetime] NULL CONSTRAINT [DF_Partner_Account_Data_Last_Update]  DEFAULT (getdate()),
	[Account_Status] [bit] NULL CONSTRAINT [DF_Partner_Account_Data_Account_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Partner_Account_Data] PRIMARY KEY CLUSTERED 
(
	[PartnerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Master].[Partners_Data]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Partners_Data](
	[PartnerID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerCode] [nvarchar](6) NOT NULL,
	[PartnerName] [nvarchar](100) NULL,
	[P_Address] [nvarchar](250) NULL,
	[P_ContactNumber] [nvarchar](100) NULL,
	[P_ContactPerson] [nvarchar](50) NULL,
	[PriceCode] [nvarchar](6) NULL,
	[Liempo_PriceCode] [nvarchar](6) NULL,
	[Leeg_PriceCode] [nvarchar](6) NULL,
	[Atsara_PriceCode] [nvarchar](6) NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[PartnerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Master].[Storage_Data]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Storage_Data](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StorageCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[StockIn] [float] NULL CONSTRAINT [DF_Storage_Data_StockIn]  DEFAULT ((0)),
	[StockOut] [float] NULL CONSTRAINT [DF_Storage_Data_StockOut]  DEFAULT ((0)),
	[CurrentStock] [float] NULL CONSTRAINT [DF_Storage_Data_TotalStock]  DEFAULT ((0)),
	[DU] [datetime] NULL CONSTRAINT [DF_Storage_Data_DU]  DEFAULT (getdate()),
 CONSTRAINT [PK_Storage_Data] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Master].[Supplier_Data]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Supplier_Data](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierCode] [nvarchar](6) NOT NULL,
	[SupplierName] [nvarchar](100) NULL,
	[S_Address] [nvarchar](250) NULL,
	[S_ContactNumber] [nvarchar](50) NULL,
	[S_ContactPerson] [nvarchar](100) NULL,
 CONSTRAINT [PK_Supplier_Data] PRIMARY KEY CLUSTERED 
(
	[SupplierCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Adjustment_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Adjustment_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ASNum] [nvarchar](10) NOT NULL,
	[AdjCode] [nvarchar](10) NULL,
	[ItemCode] [nvarchar](10) NULL,
	[Quantity] [int] NULL,
	[AdjDate] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[Reference] [nvarchar](10) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Adjustment_Hdr_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Adjustment_Hdr] PRIMARY KEY CLUSTERED 
(
	[ASNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Branch_Inventory_Running_Stock_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Branch_Inventory_Running_Stock_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceNum] [nvarchar](15) NOT NULL,
	[BranchCode] [nvarchar](6) NOT NULL,
	[Branch_ItemCode] [nvarchar](6) NOT NULL,
	[Running_Stock] [int] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_Running_Stock]  DEFAULT ((0)),
	[Stock_IN] [int] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_Stock_IN]  DEFAULT ((0)),
	[Stock_OUT] [int] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_Stock_OUT]  DEFAULT ((0)),
	[Balance] [int] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_Balance]  DEFAULT ((0)),
	[DateTrans] [datetime] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_DateTrans]  DEFAULT (getdate()),
	[DI] [datetime] NOT NULL CONSTRAINT [DF_Branch_Running_Stock_DI]  DEFAULT (getdate()),
	[Remarks] [nvarchar](150) NULL,
 CONSTRAINT [PK_Branch_Running_Stock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Delivery_Info]    Script Date: 5/2/2018 9:07:38 AM ******/
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
/****** Object:  Table [Trans].[Delivery_Reciept_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Delivery_Reciept_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DRNum] [nvarchar](10) NOT NULL,
	[PartnerCode] [nvarchar](6) NULL,
	[BranchCode] [nvarchar](6) NOT NULL,
	[ItemCodeFresh] [nvarchar](6) NULL,
	[ItemCodeFrozen] [nvarchar](6) NULL,
	[ItemCodeLiempo] [nvarchar](6) NULL,
	[ItemCodeLeeg] [nvarchar](6) NULL,
	[ItemCodeAtsara100] [nvarchar](6) NULL,
	[ItemCodeAtsara160] [nvarchar](6) NULL,
	[InvQtyFresh] [float] NULL,
	[InvQtyFrozen] [float] NULL,
	[InvQtyLiempo] [float] NULL,
	[InvQtyLeeg] [float] NULL,
	[InvQtyAtsara100] [float] NULL,
	[InvQtyAtsara160] [float] NULL,
	[FreshQty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_FreshQty]  DEFAULT ((0)),
	[FrozenQty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_FrozenQty]  DEFAULT ((0)),
	[LiempoQty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_LiempoQty]  DEFAULT ((0)),
	[LeegQty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_LeegQty]  DEFAULT ((0)),
	[Atsara100Qty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_Atsara100Qty]  DEFAULT ((0)),
	[Atsara160Qty] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_Atsara160Qty]  DEFAULT ((0)),
	[ConvertedFreshQty] [float] NULL,
	[ConvertedFrozenQty] [float] NULL,
	[ConvertedLiempoQty] [float] NULL,
	[ConvertedLeegQty] [float] NULL,
	[ConvertedAtsara100Qty] [float] NULL,
	[ConvertedAtsara160Qty] [float] NULL,
	[FreshPrice] [float] NULL,
	[FrozenPrice] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_LiempoPrice]  DEFAULT ((0)),
	[LiempoPrice] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_LiempoPrice_1]  DEFAULT ((0)),
	[LeegPrice] [float] NULL,
	[Atsara100Price] [float] NULL,
	[Atsara160Price] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_Atsara160Price]  DEFAULT ((0)),
	[TotalFreshCost] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_TotalPrice]  DEFAULT ((0)),
	[TotalFrozenCost] [float] NULL,
	[TotalLiempoCost] [float] NULL CONSTRAINT [DF_Delivery_Reciept_TF_TotalLiempoCost]  DEFAULT ((0)),
	[TotalLeegCost] [float] NULL,
	[TotalAtsara100Cost] [float] NULL,
	[TotalAtsara160Cost] [float] NULL,
	[OrderDate] [datetime] NOT NULL CONSTRAINT [DF_Delivery_Reciept_TF_OrderDate]  DEFAULT (getdate()),
	[Is2Trip] [bit] NULL CONSTRAINT [DF_Delivery_Reciept_TF_Is2Trip]  DEFAULT ((0)),
	[IsScheduled] [bit] NULL CONSTRAINT [DF_Delivery_Reciept_TF_IsDelivered]  DEFAULT ((1)),
	[IsAdded] [bit] NULL CONSTRAINT [DF_Delivery_Reciept_TF_IsAdded]  DEFAULT ((0)),
	[IsCancel] [bit] NULL CONSTRAINT [DF_Delivery_Reciept_TF_IsCancel]  DEFAULT ((0)),
	[Remarks] [nvarchar](250) NULL,
	[Assigned_LACode] [nvarchar](6) NULL,
	[DU] [datetime] NOT NULL CONSTRAINT [DF_Delivery_Reciept_TF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Delivery_Reciept_TF] PRIMARY KEY CLUSTERED 
(
	[DRNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Delivery_Schedule_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Delivery_Schedule_TF](
	[schedListID] [int] IDENTITY(1,1) NOT NULL,
	[DRNum] [nvarchar](10) NULL,
	[BranchCode] [nvarchar](6) NULL,
	[M] [bit] NULL,
	[T] [bit] NULL,
	[W] [bit] NULL,
	[TH] [bit] NULL,
	[F] [bit] NULL,
	[SA] [bit] NULL,
	[S] [bit] NULL,
	[IsSched] [bit] NULL,
	[IsPostpone] [bit] NULL,
	[IsSet] [bit] NULL,
	[IsAdd] [bit] NULL,
	[DeliveryDate] [datetime] NULL,
	[Remarks] [nvarchar](150) NULL,
	[DU] [datetime] NULL,
 CONSTRAINT [PK_Delivery_Schedule_TF] PRIMARY KEY CLUSTERED 
(
	[schedListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Delivery_Status_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Delivery_Status_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DRNum] [nvarchar](10) NULL,
	[BranchCode] [nvarchar](6) NULL,
	[IsSet] [bit] NULL,
	[IsCancel] [bit] NULL,
	[IsAdd] [bit] NULL,
	[DeliveryDateToday] [datetime] NULL,
	[DU] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Delivery_Status_TF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Delivery_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Delivery_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DRNum] [nvarchar](10) NOT NULL,
	[BranchCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[InvQty] [float] NULL,
	[PartnerQty] [float] NULL,
	[PartnerUom] [nvarchar](10) NULL,
	[UnitPrice] [float] NULL,
	[TotalPrice] [float] NULL,
	[RemainingQty] [float] NULL,
	[RowStatus] [nvarchar](1) NULL,
	[OrderDate] [datetime] NOT NULL,
	[IsDelivered] [bit] NULL,
	[Remarks] [nvarchar](250) NULL,
	[DU] [datetime] NOT NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_DRNum_Rows] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Direct_Receiving_Hdr_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
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
/****** Object:  Table [Trans].[Direct_Receiving_Line_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
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
/****** Object:  Table [Trans].[Inventory]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Inventory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionNum] [nvarchar](50) NULL,
	[ItemCode] [nvarchar](10) NULL,
	[Quantity] [float] NULL,
	[DateTrans] [datetime] NULL CONSTRAINT [DF_Inventory_DateTrans]  DEFAULT (getdate()),
	[IsMoveIn] [bit] NOT NULL CONSTRAINT [DF_Inventory_IsMoveOut]  DEFAULT ((1)),
	[DU] [datetime] NULL CONSTRAINT [DF_Inventory_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Inventory_Ending_Stock_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Inventory_Ending_Stock_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](6) NOT NULL CONSTRAINT [DF_Inventory_Ending_Stock_TF_ItemCode]  DEFAULT ((0)),
	[EndQuantity] [int] NOT NULL CONSTRAINT [DF_Inventory_Ending_Stock_TF_EndQuantity]  DEFAULT ((0)),
	[EndDate] [date] NOT NULL CONSTRAINT [DF_Inventory_Ending_Stock_TF_EndDate]  DEFAULT (getdate()),
	[IsMove] [bit] NULL CONSTRAINT [DF_Inventory_Ending_Stock_TF_IsMove]  DEFAULT ((0)),
 CONSTRAINT [PK_Inventory_Ending_Stock_TF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Inventory_Opening_Ending_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Inventory_Opening_Ending_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](8) NOT NULL,
	[Opening] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Opening]  DEFAULT ((0)),
	[Stock_In] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Stock_In]  DEFAULT ((0)),
	[Stock_Out] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Stock_Out]  DEFAULT ((0)),
	[Adjustment_In] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Adjustment_In]  DEFAULT ((0)),
	[Adjustment_Out] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Adjustment_Out]  DEFAULT ((0)),
	[Ending] [int] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_Ending]  DEFAULT ((0)),
	[LastUpdate] [datetime] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_LastUpdate]  DEFAULT (getdate()),
	[DI] [datetime] NOT NULL CONSTRAINT [DF_Inventory_Opening_Ending_TF_DI]  DEFAULT (getdate()),
 CONSTRAINT [PK_Inventory_Opening_Ending_TF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Inventory_Running_Stock_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Inventory_Running_Stock_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nvarchar](6) NOT NULL,
	[Running_Stock] [int] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_Running_Stock]  DEFAULT ((0)),
	[Out_Stock] [int] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_Out_Stock]  DEFAULT ((0)),
	[In_Stock] [int] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_In_Stock]  DEFAULT ((0)),
	[Balance_Stock] [int] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_Balance_Stock]  DEFAULT ((0)),
	[Reference] [nvarchar](50) NULL,
	[IsCancel] [bit] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_IsCancel]  DEFAULT ((0)),
	[DateTrans] [datetime] NULL CONSTRAINT [DF_Inventory_Running_Stock_TF_DateTrans]  DEFAULT (getdate()),
 CONSTRAINT [PK_Inventory_Running_Stock_TF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Partner_Account_Payable]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Partner_Account_Payable](
	[PPNUM] [int] IDENTITY(1,1) NOT NULL,
	[PartnerCode] [nvarchar](6) NOT NULL,
	[Reference] [nvarchar](50) NULL,
	[Source] [nvarchar](50) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[ItemQuantity] [float] NULL CONSTRAINT [DF_Partner_Account_Payable_ItemQuantity]  DEFAULT ((0)),
	[ItemConversionQty] [float] NULL,
	[UnitPrice] [float] NULL CONSTRAINT [DF_Partner_Account_Payable_UnitPrice]  DEFAULT ((0)),
	[Amount] [float] NULL CONSTRAINT [DF_Partner_Account_Debit_Amount]  DEFAULT ((0)),
	[Date_Payable] [datetime] NULL CONSTRAINT [DF_Partner_Account_Credit_Date_Debit]  DEFAULT (getdate()),
	[IsProcessed] [bit] NULL CONSTRAINT [DF_Partner_Account_Debit_IsProcessed]  DEFAULT ((0)),
	[IsCancel] [bit] NULL CONSTRAINT [DF_Partner_Account_Payable_IsCancel]  DEFAULT ((0)),
	[IsCount] [bit] NULL CONSTRAINT [DF_Partner_Account_Payable_IsCount]  DEFAULT ((1)),
	[DU] [datetime] NULL CONSTRAINT [DF_Partner_Account_Debit_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Partner_Account_Debit] PRIMARY KEY CLUSTERED 
(
	[PPNUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Partner_Account_Receivable]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Partner_Account_Receivable](
	[PRNUM] [int] NOT NULL,
	[PartnerCode] [nvarchar](6) NOT NULL,
	[Reference] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[Date_Receivable] [datetime] NULL,
	[IsProcessed] [bit] NULL,
	[DU] [datetime] NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Partner_Account_Credit] PRIMARY KEY CLUSTERED 
(
	[PRNUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Partner_Account_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Partner_Account_TF](
	[id] [int] NOT NULL,
	[Trans_Id] [nvarchar](6) NULL,
	[Trans_Type_Code] [nvarchar](2) NULL,
	[Reference] [nvarchar](50) NULL,
	[Receivable] [float] NULL,
	[Payable] [float] NULL,
	[Running_Balance] [float] NULL,
	[DateUpdate] [datetime] NULL,
 CONSTRAINT [PK_Partner_Account_TF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Partner_Deposit_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Partner_Deposit_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepositNum] [nvarchar](10) NOT NULL,
	[PartnerCode] [nvarchar](6) NULL,
	[DepositAmount] [float] NULL,
	[DepositDate] [datetime] NULL,
	[ChequeNumber] [nvarchar](50) NULL,
	[Bank] [nvarchar](50) NULL,
	[Remarks] [nvarchar](50) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Partner_Deposit_TF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Partner_Deposit_TF] PRIMARY KEY CLUSTERED 
(
	[DepositNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Partner_PO_Hdr]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Partner_PO_Hdr](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PONum] [nvarchar](10) NOT NULL,
	[PartnerCode] [nvarchar](10) NOT NULL,
	[RequestDate] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[DocStatus] [nvarchar](1) NULL,
	[Void] [bit] NOT NULL,
	[DU] [datetime] NOT NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_PPO_Hdr] PRIMARY KEY CLUSTERED 
(
	[PONum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Partner_PO_Rows]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Partner_PO_Rows](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PONum] [nvarchar](10) NULL,
	[BranchCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](10) NULL,
	[InvQty] [float] NULL,
	[PartnerQty] [float] NULL,
	[PartnerUom] [nvarchar](10) NULL,
	[UnitPrice] [float] NULL,
	[TotalPrice] [float] NULL,
	[RemainingQty] [float] NULL,
	[RowStatus] [nvarchar](1) NULL,
	[DU] [datetime] NOT NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_PPO_Rows] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Pickup_Transfer_Branch_Receive_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Pickup_Transfer_Branch_Receive_TF](
	[PDID] [int] IDENTITY(1,1) NOT NULL,
	[PTBNum] [nvarchar](12) NOT NULL,
	[DPTNum] [nvarchar](12) NOT NULL,
	[BranchCode] [nvarchar](6) NOT NULL,
	[Branch_ItemCode] [nvarchar](6) NOT NULL,
	[QuantityReceived] [int] NOT NULL CONSTRAINT [DF_Pickup_Transfer_Branch_Receive_TF_QuantityReceived]  DEFAULT ((0)),
	[DateReceived] [datetime] NULL,
	[DI] [datetime] NULL CONSTRAINT [DF_Pickup_Transfer_Branch_Receive_TF_DI]  DEFAULT (getdate()),
	[Remarks] [nvarchar](150) NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Pickup_Transfer_Branch_Receive_TF] PRIMARY KEY CLUSTERED 
(
	[PDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[PickUp_Transfer_Branch_Source_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[PickUp_Transfer_Branch_Source_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PTBNum] [nvarchar](12) NOT NULL,
	[PartnerCode] [nvarchar](20) NOT NULL,
	[BranchItemCode] [nvarchar](6) NOT NULL,
	[TotalQty] [int] NULL CONSTRAINT [DF_PickUp_Transfer_Branch_Source_TF_TotalQty]  DEFAULT ((0)),
	[DistributedQty] [int] NULL CONSTRAINT [DF_PickUp_Transfer_Branch_Source_TF_DistributedQty]  DEFAULT ((0)),
	[IsClosed] [bit] NULL CONSTRAINT [DF_PickUp_Transfer_Branch_Source_TF_IsClosed]  DEFAULT ((0)),
	[DateTrans] [datetime] NULL CONSTRAINT [DF_PickUp_Transfer_Branch_Source_TF_DateTrans]  DEFAULT (getdate()),
	[DI] [datetime] NULL CONSTRAINT [DF_PickUp_Transfer_Branch_Source_TF_DI]  DEFAULT (getdate()),
 CONSTRAINT [PK_PickUp_Transfer_Branch_Source_TF_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Pickup_Transfer_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Pickup_Transfer_TF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PTNum] [nvarchar](12) NOT NULL,
	[PartnerCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_Pickup_Transfer_TF_Quantity]  DEFAULT ((0)),
	[Conversion] [int] NULL CONSTRAINT [DF_Pickup_Transfer_TF_Conversion]  DEFAULT ((0)),
	[ConvertedQty] [int] NULL CONSTRAINT [DF_Pickup_Transfer_TF_ConvertedQty]  DEFAULT ((0)),
	[UnitPrice] [float] NULL,
	[Remarks] [nvarchar](250) NULL,
	[DateTrans] [datetime] NULL CONSTRAINT [DF_PICK_TRANSFER_TF_DateTrans]  DEFAULT (getdate()),
	[IsClosed] [bit] NULL CONSTRAINT [DF_Pickup_Transfer_TF_IsClosed]  DEFAULT ((0)),
	[DI] [datetime] NULL CONSTRAINT [DF_PICK_TRANSFER_TF_DI]  DEFAULT (getdate()),
	[PTBNum] [nvarchar](12) NULL,
 CONSTRAINT [PK_PICK_TRANSFER_TF] PRIMARY KEY CLUSTERED 
(
	[PTNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Stock_Branch_Return_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Stock_Branch_Return_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SRNum] [nvarchar](10) NOT NULL,
	[PartnerCode] [nvarchar](6) NULL,
	[BranchCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[Quantity] [float] NULL CONSTRAINT [DF_Stock_Branch_Return_TF_Quantity]  DEFAULT ((0)),
	[CreditToAccount] [bit] NULL CONSTRAINT [DF_Stock_Branch_Return_TF_CreditToAccount]  DEFAULT ((1)),
	[DateReturn] [datetime] NULL CONSTRAINT [DF_Stock_Branch_Return_TF_DateReturn]  DEFAULT (getdate()),
	[Remarks] [nvarchar](150) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Stock_Branch_Return_TF_DU]  DEFAULT (getdate()),
 CONSTRAINT [PK_Stock_Branch_Return_TF] PRIMARY KEY CLUSTERED 
(
	[SRNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Storage_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Storage_TF](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[STNum] [nvarchar](10) NOT NULL,
	[DateTransfer] [datetime] NOT NULL,
	[StorageFrom] [nvarchar](6) NULL,
	[StorageTo] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[Quantity] [float] NULL,
	[Remarks] [nvarchar](250) NULL,
	[DU] [datetime] NULL,
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Storage_TF] PRIMARY KEY CLUSTERED 
(
	[STNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Supplier_Voucher_Hdr_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Supplier_Voucher_Hdr_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[VoucherNum] [nvarchar](8) NOT NULL CONSTRAINT [DF_Supplier_Voucher_Hdr_TF_VoucherNumber]  DEFAULT ((0)),
	[SupplierCode] [nvarchar](6) NOT NULL,
	[ReceiveDate] [datetime] NULL,
	[BankName] [nvarchar](100) NULL,
	[ChequeNumber] [nvarchar](50) NULL,
	[Remarks] [nvarchar](250) NULL,
	[Void] [bit] NOT NULL CONSTRAINT [DF_PO_Hdr_Void]  DEFAULT ((0)),
	[IsCheckProcess] [bit] NOT NULL CONSTRAINT [DF_Supplier_Voucher_Hdr_TF_IsCheckProcess]  DEFAULT ((0)),
	[DU] [datetime] NOT NULL CONSTRAINT [DF_PO_Hdr_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_PO_Hdr] PRIMARY KEY CLUSTERED 
(
	[VoucherNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Trans].[Supplier_Voucher_Rows_TF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Trans].[Supplier_Voucher_Rows_TF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[VoucherNum] [nvarchar](8) NULL,
	[ItemCode] [nvarchar](10) NULL,
	[ItemSubID] [int] NULL,
	[InvQty] [float] NULL,
	[InvUomCode] [nvarchar](6) NULL,
	[SupplierQty] [float] NULL,
	[SupplierUomCode] [nvarchar](6) NULL,
	[SupplierPrice] [float] NULL,
	[DU] [datetime] NOT NULL CONSTRAINT [DF_PO_Rows_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rows] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Utility].[Adjustment_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Adjustment_RF](
	[AdjCode] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Sign] [bit] NOT NULL CONSTRAINT [DF_Adjustment_RF_Sign]  DEFAULT ((0)),
	[Arrangement] [nvarchar](2) NULL,
 CONSTRAINT [PK_Adjustment_RF] PRIMARY KEY CLUSTERED 
(
	[AdjCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Utility].[Delivery_Schedule_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Delivery_Schedule_RF](
	[schedID] [int] IDENTITY(1,1) NOT NULL,
	[BranchCode] [nvarchar](6) NOT NULL,
	[M] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_M]  DEFAULT ((0)),
	[T] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_T]  DEFAULT ((0)),
	[W] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_W]  DEFAULT ((0)),
	[Th] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_Th]  DEFAULT ((0)),
	[F] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_F]  DEFAULT ((0)),
	[Sa] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_Sa]  DEFAULT ((0)),
	[S] [bit] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_S]  DEFAULT ((0)),
	[DU] [datetime] NOT NULL CONSTRAINT [DF_Delivery_Schedule_RF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Delivery_Schedule_RF] PRIMARY KEY CLUSTERED 
(
	[BranchCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Utility].[Driver_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Driver_RF](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[DriverName] [nvarchar](150) NOT NULL,
	[LicenseNumber] [nvarchar](50) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Driver_RF_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Driver_RF] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Utility].[Helper_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Helper_RF](
	[HelperID] [int] IDENTITY(1,1) NOT NULL,
	[HelperName] [nvarchar](150) NOT NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Helper_RF_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Helper_RF] PRIMARY KEY CLUSTERED 
(
	[HelperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Utility].[Item_SubCat_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Item_SubCat_RF](
	[ItemSubCatID] [int] NOT NULL,
	[ItemCode] [nvarchar](6) NULL,
	[ItemSubName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Item_SubCat_RF] PRIMARY KEY CLUSTERED 
(
	[ItemSubCatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Utility].[Location_Area_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
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
/****** Object:  Table [Utility].[Partner_Price_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Partner_Price_RF](
	[PPID] [int] IDENTITY(1,1) NOT NULL,
	[PartnerCode] [nvarchar](6) NULL,
	[ItemCode] [nvarchar](6) NULL,
	[PriceCode] [nvarchar](6) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Partner_Price_RF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Partner_Price_RF] PRIMARY KEY CLUSTERED 
(
	[PPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Utility].[Price_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Price_RF](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[PriceCode] [nvarchar](6) NOT NULL,
	[PriceAmount] [float] NOT NULL CONSTRAINT [DF_Price_RF_PriceAmount]  DEFAULT ((0)),
	[PriceDescription] [nvarchar](150) NULL,
	[DU] [datetime] NOT NULL CONSTRAINT [DF_Price_RF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Price_RF] PRIMARY KEY CLUSTERED 
(
	[PriceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Utility].[Storage_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Storage_RF](
	[StorageID] [int] IDENTITY(1,1) NOT NULL,
	[StorageCode] [nvarchar](6) NULL,
	[StorageName] [nvarchar](150) NULL,
	[Remarks] [nvarchar](250) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Storage_RF_DU]  DEFAULT (getdate()),
	[UserCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Storage_RF] PRIMARY KEY CLUSTERED 
(
	[StorageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Utility].[Supplier_Price_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[Supplier_Price_RF](
	[SPID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierCode] [nvarchar](6) NOT NULL,
	[ItemSubCatID] [int] NULL,
	[PriceCode] [nvarchar](6) NULL,
	[DU] [datetime] NULL CONSTRAINT [DF_Supplier_Price_RF_DU]  DEFAULT (getdate()),
 CONSTRAINT [PK_Supplier_Price_RF] PRIMARY KEY CLUSTERED 
(
	[SPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Utility].[UOM_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Utility].[UOM_RF](
	[UomID] [int] IDENTITY(1,1) NOT NULL,
	[UomCode] [nvarchar](10) NOT NULL,
	[UomName] [nvarchar](50) NULL,
 CONSTRAINT [PK_UOM_RF] PRIMARY KEY CLUSTERED 
(
	[UomCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Utility].[Vehicle_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
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
/****** Object:  Table [xSystem].[Days_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [xSystem].[Days_RF](
	[DayID] [int] NOT NULL,
	[Description] [nvarchar](10) NULL,
	[Arr] [nvarchar](2) NULL,
 CONSTRAINT [PK_Days_RF] PRIMARY KEY CLUSTERED 
(
	[DayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [xSystem].[Delivery_Date_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [xSystem].[Delivery_Date_RF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateDeliveryList] [datetime] NULL,
 CONSTRAINT [PK_Delivery_Date_Generate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [xSystem].[Menu_MF]    Script Date: 5/2/2018 9:07:38 AM ******/
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
/****** Object:  Table [xSystem].[SeriesNumber_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
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
/****** Object:  Table [xSystem].[StatusCode_RF]    Script Date: 5/2/2018 9:07:38 AM ******/
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
/****** Object:  Table [xSystem].[User_MF]    Script Date: 5/2/2018 9:07:38 AM ******/
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
/****** Object:  View [Trans].[VR_DELIVERY_RECEIPT_BATCH_FINAL]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_DELIVERY_RECEIPT_BATCH_FINAL]
AS
SELECT        Master.Branch_Data.BranchName, Master.Partners_Data.PartnerName, Utility.Location_Area_RF.LAName, Trans.Delivery_Reciept_TF.id, Trans.Delivery_Reciept_TF.DRNum, 
                         Trans.Delivery_Reciept_TF.BranchCode, Trans.Delivery_Reciept_TF.ItemCodeFresh, Trans.Delivery_Reciept_TF.ItemCodeFrozen, Trans.Delivery_Reciept_TF.InvQtyFresh, 
                         Trans.Delivery_Reciept_TF.InvQtyFrozen, Trans.Delivery_Reciept_TF.FreshQty, Trans.Delivery_Reciept_TF.FrozenQty, Trans.Delivery_Reciept_TF.ConvertedFreshQty, 
                         Trans.Delivery_Reciept_TF.ConvertedFrozenQty, Trans.Delivery_Reciept_TF.OrderDate, Trans.Delivery_Reciept_TF.IsScheduled, Trans.Delivery_Reciept_TF.IsAdded, Trans.Delivery_Reciept_TF.IsCancel, 
                         Trans.Delivery_Reciept_TF.Remarks, Trans.Delivery_Reciept_TF.DU, Trans.Delivery_Reciept_TF.UserCode, Master.Partners_Data.PartnerCode, Trans.Delivery_Reciept_TF.ItemCodeLiempo, 
                         Trans.Delivery_Reciept_TF.LiempoQty, Trans.Delivery_Reciept_TF.LiempoPrice, Trans.Delivery_Reciept_TF.TotalLiempoCost, Trans.Delivery_Info.DriverName, Trans.Delivery_Info.HelperName, 
                         Trans.Delivery_Info.VehiclePlateNumber, Trans.Delivery_Reciept_TF.ConvertedLiempoQty, Trans.Delivery_Reciept_TF.InvQtyLiempo, Trans.Delivery_Reciept_TF.LeegQty, 
                         Trans.Delivery_Reciept_TF.Atsara100Qty, Trans.Delivery_Reciept_TF.Atsara160Qty, Trans.Delivery_Reciept_TF.InvQtyLeeg, Trans.Delivery_Reciept_TF.InvQtyAtsara100, 
                         Trans.Delivery_Reciept_TF.InvQtyAtsara160, Trans.Delivery_Reciept_TF.ItemCodeLeeg, Trans.Delivery_Reciept_TF.ItemCodeAtsara100, Trans.Delivery_Reciept_TF.ItemCodeAtsara160, 
                         Trans.Delivery_Reciept_TF.ConvertedLeegQty, Trans.Delivery_Reciept_TF.ConvertedAtsara100Qty, Trans.Delivery_Reciept_TF.ConvertedAtsara160Qty, Trans.Delivery_Reciept_TF.LeegPrice, 
                         Trans.Delivery_Reciept_TF.TotalLeegCost, Trans.Delivery_Reciept_TF.TotalAtsara100Cost, Trans.Delivery_Reciept_TF.TotalAtsara160Cost, Trans.Partner_Account_Payable.Source, 
                         Trans.Partner_Account_Payable.ItemCode, Master.Item_Data.ItemName, Master.Item_Data.SellingUomCode, Trans.Partner_Account_Payable.ItemQuantity, Trans.Partner_Account_Payable.ItemConversionQty, 
                         Trans.Partner_Account_Payable.Amount, Trans.Partner_Account_Payable.UnitPrice
FROM            Trans.Delivery_Reciept_TF INNER JOIN
                         Master.Branch_Data ON Trans.Delivery_Reciept_TF.BranchCode = Master.Branch_Data.BranchCode INNER JOIN
                         Master.Partners_Data ON Master.Branch_Data.PartnerCode = Master.Partners_Data.PartnerCode INNER JOIN
                         Utility.Location_Area_RF ON Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode INNER JOIN
                         Trans.Partner_Account_Payable ON Trans.Delivery_Reciept_TF.DRNum = Trans.Partner_Account_Payable.Reference INNER JOIN
                         Master.Item_Data ON Trans.Partner_Account_Payable.ItemCode = Master.Item_Data.ItemCode LEFT OUTER JOIN
                         Trans.Delivery_Info ON Trans.Delivery_Reciept_TF.OrderDate = Trans.Delivery_Info.DeliveryOrder AND Master.Branch_Data.LACode = Trans.Delivery_Info.LACode
WHERE        (Trans.Delivery_Reciept_TF.IsCancel = 0)

GO
/****** Object:  View [Trans].[VR_PARTNER_SOA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_PARTNER_SOA]
AS
SELECT        Trans.Partner_Deposit_TF.ID, Trans.Partner_Deposit_TF.DepositNum, Trans.Partner_Deposit_TF.PartnerCode, Trans.Partner_Deposit_TF.DepositAmount, Trans.Partner_Deposit_TF.DepositDate, 
                         Trans.Partner_Deposit_TF.ChequeNumber, Trans.Partner_Deposit_TF.Bank, Trans.Partner_Deposit_TF.Remarks, Trans.Partner_Deposit_TF.DU, Trans.Partner_Deposit_TF.UserCode, 
                         Trans.VR_DELIVERY_RECEIPT_BATCH_FINAL.OrderDate AS Expr1
FROM            Trans.Partner_Deposit_TF INNER JOIN
                         Trans.VR_DELIVERY_RECEIPT_BATCH_FINAL ON Trans.Partner_Deposit_TF.PartnerCode = Trans.VR_DELIVERY_RECEIPT_BATCH_FINAL.PartnerCode

GO
/****** Object:  View [Trans].[VR_DELIVERY_RECEIPT]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_DELIVERY_RECEIPT]
AS
SELECT        Master.Branch_Data.BranchName, Master.Item_Data.ItemCode, Master.Item_Data.ItemName, Trans.Delivery_TF.InvQty, Master.Item_Data.InvUomCode, Trans.Delivery_TF.PartnerQty, 
                         Trans.Delivery_TF.PartnerUom, Trans.Delivery_TF.UnitPrice, Trans.Delivery_TF.TotalPrice, Trans.Delivery_TF.DRNum, Trans.Delivery_TF.OrderDate, Master.Branch_Data.BranchCode, 
                         Utility.Location_Area_RF.LAName, Master.Branch_Data.B_Address, Trans.Delivery_TF.Remarks, Master.Partners_Data.PartnerName, Master.Partners_Data.PartnerCode, Trans.Delivery_TF.IsDelivered
FROM            Master.Item_Data INNER JOIN
                         Trans.Delivery_TF ON Master.Item_Data.ItemCode = Trans.Delivery_TF.ItemCode INNER JOIN
                         Master.Branch_Data ON Trans.Delivery_TF.BranchCode = Master.Branch_Data.BranchCode INNER JOIN
                         Utility.Location_Area_RF ON Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode AND Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode INNER JOIN
                         Master.Partners_Data ON Master.Branch_Data.PartnerCode = Master.Partners_Data.PartnerCode AND Master.Branch_Data.PartnerCode = Master.Partners_Data.PartnerCode


GO
/****** Object:  View [Trans].[VR_DELIVERY_RECEIPT_TRANS]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_DELIVERY_RECEIPT_TRANS]
AS
SELECT        Master.Branch_Data.BranchName, Master.Item_Data.ItemCode, Master.Item_Data.ItemName, Trans.Delivery_TF.InvQty, Master.Item_Data.InvUomCode, Trans.Delivery_TF.PartnerQty, 
                         Trans.Delivery_TF.PartnerUom, Trans.Delivery_TF.UnitPrice, Trans.Delivery_TF.TotalPrice, Master.Branch_Data.B_Address, Utility.Location_Area_RF.LAName, Trans.Delivery_TF.DRNum
FROM            Master.Item_Data INNER JOIN
                         Trans.Delivery_TF ON Master.Item_Data.ItemCode = Trans.Delivery_TF.ItemCode INNER JOIN
                         Master.Branch_Data ON Trans.Delivery_TF.BranchCode = Master.Branch_Data.BranchCode INNER JOIN
                         Utility.Location_Area_RF ON Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode AND Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode


GO
/****** Object:  View [Trans].[VR_DELIVERY_SCHEDULE_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_DELIVERY_SCHEDULE_LIST]
AS
SELECT        Trans.Delivery_Schedule_TF.DeliveryDate, Master.Branch_Data.BranchName, Utility.Location_Area_RF.LAName, Master.Item_Data.ItemName, Trans.Delivery_TF.PartnerQty, Trans.Delivery_TF.PartnerUom, 
                         Trans.Delivery_TF.InvQty, Trans.Delivery_Schedule_TF.DRNum
FROM            Master.Branch_Data INNER JOIN
                         Trans.Delivery_Schedule_TF ON Master.Branch_Data.BranchCode = Trans.Delivery_Schedule_TF.BranchCode INNER JOIN
                         Utility.Location_Area_RF ON Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode AND Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode INNER JOIN
                         Trans.Delivery_TF ON Trans.Delivery_Schedule_TF.DRNum = Trans.Delivery_TF.DRNum INNER JOIN
                         Master.Item_Data ON Trans.Delivery_TF.ItemCode = Master.Item_Data.ItemCode AND Trans.Delivery_TF.ItemCode = Master.Item_Data.ItemCode


GO
/****** Object:  View [Trans].[VR_DELIVERY_SUMMARY]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_DELIVERY_SUMMARY]
AS
SELECT        Master.Branch_Data.BranchName, Master.Partners_Data.PartnerName, Utility.Location_Area_RF.LAName, Trans.Delivery_Reciept_TF.id, Trans.Delivery_Reciept_TF.DRNum, Trans.Delivery_Reciept_TF.BranchCode, 
                         Trans.Delivery_Reciept_TF.ItemCodeFresh, Trans.Delivery_Reciept_TF.ItemCodeFrozen, Trans.Delivery_Reciept_TF.InvQtyFresh, Trans.Delivery_Reciept_TF.InvQtyFrozen, Trans.Delivery_Reciept_TF.FreshQty, 
                         Trans.Delivery_Reciept_TF.FrozenQty, Trans.Delivery_Reciept_TF.ConvertedFreshQty, Trans.Delivery_Reciept_TF.ConvertedFrozenQty, Trans.Delivery_Reciept_TF.OrderDate, Trans.Delivery_Reciept_TF.IsScheduled, 
                         Trans.Delivery_Reciept_TF.IsAdded, Trans.Delivery_Reciept_TF.IsCancel, Trans.Delivery_Reciept_TF.Remarks, Trans.Delivery_Reciept_TF.DU, Trans.Delivery_Reciept_TF.UserCode, Master.Partners_Data.PartnerCode, 
                         Trans.Delivery_Reciept_TF.ItemCodeLiempo, Trans.Delivery_Reciept_TF.LiempoQty, Trans.Delivery_Reciept_TF.LiempoPrice, Trans.Delivery_Reciept_TF.TotalLiempoCost, Trans.Delivery_Info.DriverName, 
                         Trans.Delivery_Info.HelperName, Trans.Delivery_Info.VehiclePlateNumber, Trans.Delivery_Reciept_TF.ConvertedLiempoQty, Trans.Delivery_Reciept_TF.InvQtyLiempo, Trans.Delivery_Reciept_TF.LeegQty, 
                         Trans.Delivery_Reciept_TF.Atsara100Qty, Trans.Delivery_Reciept_TF.Atsara160Qty, Trans.Delivery_Reciept_TF.InvQtyLeeg, Trans.Delivery_Reciept_TF.InvQtyAtsara100, Trans.Delivery_Reciept_TF.InvQtyAtsara160, 
                         Trans.Delivery_Reciept_TF.ItemCodeLeeg, Trans.Delivery_Reciept_TF.ItemCodeAtsara100, Trans.Delivery_Reciept_TF.ItemCodeAtsara160, Trans.Delivery_Reciept_TF.ConvertedLeegQty, 
                         Trans.Delivery_Reciept_TF.ConvertedAtsara100Qty, Trans.Delivery_Reciept_TF.ConvertedAtsara160Qty, Trans.Delivery_Reciept_TF.LeegPrice, Trans.Delivery_Reciept_TF.TotalLeegCost, 
                         Trans.Delivery_Reciept_TF.TotalAtsara100Cost, Trans.Delivery_Reciept_TF.TotalAtsara160Cost, Trans.Delivery_Info.Trip1Drivers, Trans.Delivery_Info.Trip1Helpers, Trans.Delivery_Info.Trip1VehicleDetails, 
                         Trans.Delivery_Info.Is2Trip, Trans.Delivery_Reciept_TF.Is2Trip AS IsTrip2_Branch, Trans.Delivery_Info.T1Remarks, Trans.Delivery_Info.T2Remarks, Trans.Delivery_Info.Trip2Drivers, Trans.Delivery_Info.Trip2Helpers, 
                         Trans.Delivery_Info.Trip2VehicleDetails
FROM            Utility.Location_Area_RF RIGHT OUTER JOIN
                         Trans.Delivery_Reciept_TF INNER JOIN
                         Master.Branch_Data ON Trans.Delivery_Reciept_TF.BranchCode = Master.Branch_Data.BranchCode INNER JOIN
                         Master.Partners_Data ON Master.Branch_Data.PartnerCode = Master.Partners_Data.PartnerCode LEFT OUTER JOIN
                         Trans.Delivery_Info ON Trans.Delivery_Reciept_TF.Assigned_LACode = Trans.Delivery_Info.LACode AND Trans.Delivery_Reciept_TF.OrderDate = Trans.Delivery_Info.DeliveryOrder ON 
                         Utility.Location_Area_RF.LACode = Trans.Delivery_Reciept_TF.Assigned_LACode
WHERE        (Trans.Delivery_Reciept_TF.IsCancel = 0)

GO
/****** Object:  View [Trans].[VR_DIRECT_RECEIVED]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_DIRECT_RECEIVED]
AS
SELECT        Trans.Direct_Receiving_Hdr_TF.IRNum, Trans.Direct_Receiving_Hdr_TF.DateReceived, Trans.Direct_Receiving_Hdr_TF.Remarks, Trans.Direct_Receiving_Line_TF.ItemCode, Master.Item_Data.ItemName, 
                         Trans.Direct_Receiving_Line_TF.Quantity, Trans.Direct_Receiving_Hdr_TF.SupplierCode, Master.Supplier_Data.SupplierName, Master.Supplier_Data.S_Address, Master.Supplier_Data.S_ContactNumber, 
                         Master.Supplier_Data.S_ContactPerson, Trans.Direct_Receiving_Hdr_TF.DI
FROM            Master.Supplier_Data INNER JOIN
                         Trans.Direct_Receiving_Hdr_TF ON Master.Supplier_Data.SupplierCode = Trans.Direct_Receiving_Hdr_TF.SupplierCode INNER JOIN
                         Master.Item_Data INNER JOIN
                         Trans.Direct_Receiving_Line_TF ON Master.Item_Data.ItemCode = Trans.Direct_Receiving_Line_TF.ItemCode ON Trans.Direct_Receiving_Hdr_TF.IRNum = Trans.Direct_Receiving_Line_TF.IRNum

GO
/****** Object:  View [Trans].[VR_INVENTORY_BEGINNING_ENDING]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_INVENTORY_BEGINNING_ENDING]
AS
SELECT        Master.Item_Data.ItemCode, Master.Item_Data.ItemName, Trans.Inventory_Opening_Ending_TF.Opening, Trans.Inventory_Opening_Ending_TF.Stock_In, Trans.Inventory_Opening_Ending_TF.Stock_Out, 
                         Trans.Inventory_Opening_Ending_TF.Adjustment_In, Trans.Inventory_Opening_Ending_TF.Adjustment_Out, Trans.Inventory_Opening_Ending_TF.Ending, Trans.Inventory_Opening_Ending_TF.LastUpdate, 
                         Trans.Inventory_Opening_Ending_TF.DI
FROM            Master.Item_Data INNER JOIN
                         Trans.Inventory_Opening_Ending_TF ON Master.Item_Data.ItemCode = Trans.Inventory_Opening_Ending_TF.ItemCode

GO
/****** Object:  View [Trans].[VR_ITEMS_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_ITEMS_LIST]
AS
SELECT        TOP (100) PERCENT Master.Item_Data.ItemCode, Master.Item_Data.ItemName, Trans.Inventory.TransactionNum, Trans.Inventory.Quantity, Trans.Inventory.DU, Trans.Inventory.IsMoveIn, Master.Inventory_Data.RunningStock, 
                         Master.Inventory_Data.InvUomCode, Trans.Adjustment_TF.ASNum, Trans.Adjustment_TF.AdjCode, Utility.Adjustment_RF.Description, Master.Branch_Data.BranchName, Master.Supplier_Data.SupplierName
FROM            Trans.Supplier_Voucher_Hdr_TF INNER JOIN
                         Master.Supplier_Data ON Trans.Supplier_Voucher_Hdr_TF.SupplierCode = Master.Supplier_Data.SupplierCode RIGHT OUTER JOIN
                         Master.Item_Data INNER JOIN
                         Trans.Inventory ON Master.Item_Data.ItemCode = Trans.Inventory.ItemCode INNER JOIN
                         Master.Inventory_Data ON Master.Item_Data.ItemCode = Master.Inventory_Data.ItemCode ON Trans.Supplier_Voucher_Hdr_TF.VoucherNum = Trans.Inventory.TransactionNum LEFT OUTER JOIN
                         Trans.Delivery_Reciept_TF INNER JOIN
                         Master.Branch_Data ON Trans.Delivery_Reciept_TF.BranchCode = Master.Branch_Data.BranchCode ON Trans.Inventory.TransactionNum = Trans.Delivery_Reciept_TF.DRNum LEFT OUTER JOIN
                         Utility.Adjustment_RF INNER JOIN
                         Trans.Adjustment_TF ON Utility.Adjustment_RF.AdjCode = Trans.Adjustment_TF.AdjCode ON Trans.Inventory.TransactionNum = Trans.Adjustment_TF.ASNum

GO
/****** Object:  View [Trans].[VR_PARTNER_PO]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_PARTNER_PO]
AS
SELECT        Master.Partners_Data.PartnerCode, Master.Partners_Data.PartnerName, Trans.Partner_PO_Hdr.PONum, Master.Branch_Data.BranchName, Master.Item_Data.ItemName, Trans.Partner_PO_Rows.InvQty, 
                         Trans.Partner_PO_Rows.PartnerQty, Trans.Partner_PO_Rows.UnitPrice, Trans.Partner_PO_Hdr.RequestDate, Trans.Partner_PO_Hdr.Remarks, Master.Partners_Data.P_Address, 
                         Master.Partners_Data.P_ContactNumber, Master.Partners_Data.P_ContactPerson, Trans.Partner_PO_Rows.PartnerUom, Trans.Partner_PO_Rows.TotalPrice
FROM            Master.Branch_Data INNER JOIN
                         Trans.Partner_PO_Rows INNER JOIN
                         Trans.Partner_PO_Hdr ON Trans.Partner_PO_Rows.PONum = Trans.Partner_PO_Hdr.PONum AND Trans.Partner_PO_Rows.PONum = Trans.Partner_PO_Hdr.PONum INNER JOIN
                         Master.Partners_Data ON Trans.Partner_PO_Hdr.PartnerCode = Master.Partners_Data.PartnerCode ON Master.Branch_Data.BranchCode = Trans.Partner_PO_Rows.BranchCode INNER JOIN
                         Master.Item_Data ON Trans.Partner_PO_Rows.ItemCode = Master.Item_Data.ItemCode


GO
/****** Object:  View [Trans].[VR_STOCK_ADJUSTMENT]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_STOCK_ADJUSTMENT]
AS
SELECT        Trans.Adjustment_TF.ASNum, Trans.Adjustment_TF.AdjCode, Utility.Adjustment_RF.Description, Master.Item_Data.ItemName, Trans.Adjustment_TF.Quantity, Trans.Adjustment_TF.AdjDate, 
                         Trans.Adjustment_TF.Remarks, Trans.Adjustment_TF.Reference, Master.Branch_Data.BranchName, Master.Supplier_Data.SupplierCode, Master.Supplier_Data.SupplierName
FROM            Utility.Adjustment_RF INNER JOIN
                         Trans.Adjustment_TF ON Utility.Adjustment_RF.AdjCode = Trans.Adjustment_TF.AdjCode INNER JOIN
                         Master.Item_Data ON Trans.Adjustment_TF.ItemCode = Master.Item_Data.ItemCode LEFT OUTER JOIN
                         Master.Supplier_Data ON Trans.Adjustment_TF.Reference = Master.Supplier_Data.SupplierCode LEFT OUTER JOIN
                         Master.Branch_Data ON Trans.Adjustment_TF.Reference = Master.Branch_Data.BranchCode


GO
/****** Object:  View [Trans].[VR_STOCK_TRANSFER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_STOCK_TRANSFER]
AS
SELECT        Utility.Storage_RF.StorageCode AS StorageFromCode, Utility.Storage_RF.StorageName AS StorageFrom, Master.Item_Data.ItemName, Trans.Storage_TF.Quantity, Storage_RF_1.StorageName AS StorageTo, 
                         Storage_RF_1.StorageCode AS StorageToCode, Trans.Storage_TF.DateTransfer, Trans.Storage_TF.STNum, Trans.Storage_TF.Remarks, Master.Storage_Data.CurrentStock
FROM            Master.Item_Data INNER JOIN
                         Trans.Storage_TF ON Master.Item_Data.ItemCode = Trans.Storage_TF.ItemCode INNER JOIN
                         Utility.Storage_RF ON Trans.Storage_TF.StorageFrom = Utility.Storage_RF.StorageCode INNER JOIN
                         Utility.Storage_RF AS Storage_RF_1 ON Trans.Storage_TF.StorageTo = Storage_RF_1.StorageCode INNER JOIN
                         Master.Storage_Data ON Master.Item_Data.ItemCode = Master.Storage_Data.ItemCode AND Utility.Storage_RF.StorageCode = Master.Storage_Data.StorageCode


GO
/****** Object:  View [Trans].[VR_SUPPLIER_VOUCHER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Trans].[VR_SUPPLIER_VOUCHER]
AS
SELECT        Master.Supplier_Data.SupplierCode, Master.Supplier_Data.SupplierName, Master.Supplier_Data.S_Address, Trans.Supplier_Voucher_Hdr_TF.VoucherNum, Trans.Supplier_Voucher_Hdr_TF.ReceiveDate, 
                         Trans.Supplier_Voucher_Hdr_TF.BankName, Trans.Supplier_Voucher_Hdr_TF.ChequeNumber, Trans.Supplier_Voucher_Hdr_TF.Remarks, Master.Supplier_Data.S_ContactPerson, 
                         Trans.Supplier_Voucher_Rows_TF.InvQty, Trans.Supplier_Voucher_Rows_TF.SupplierQty, Trans.Supplier_Voucher_Rows_TF.SupplierPrice, Master.Item_Data.ItemName, 
                         Utility.Item_SubCat_RF.ItemSubName
FROM            Trans.Supplier_Voucher_Hdr_TF INNER JOIN
                         Master.Supplier_Data ON Trans.Supplier_Voucher_Hdr_TF.SupplierCode = Master.Supplier_Data.SupplierCode INNER JOIN
                         Trans.Supplier_Voucher_Rows_TF ON Trans.Supplier_Voucher_Hdr_TF.VoucherNum = Trans.Supplier_Voucher_Rows_TF.VoucherNum INNER JOIN
                         Master.Item_Data ON Trans.Supplier_Voucher_Rows_TF.ItemCode = Master.Item_Data.ItemCode INNER JOIN
                         Utility.Item_SubCat_RF ON Trans.Supplier_Voucher_Rows_TF.ItemSubID = Utility.Item_SubCat_RF.ItemSubCatID AND Trans.Supplier_Voucher_Rows_TF.ItemCode = Utility.Item_SubCat_RF.ItemCode


GO
/****** Object:  View [Utility].[VR_BRANCH_AREA_LOCATION_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Utility].[VR_BRANCH_AREA_LOCATION_LIST]
AS
SELECT        Utility.Location_Area_RF.LAName, Master.Partners_Data.PartnerName, Master.Branch_Data.BranchName, Master.Branch_Data.B_Address, Master.Branch_Data.B_ContactNumbers
FROM            Master.Branch_Data INNER JOIN
                         Utility.Location_Area_RF ON Master.Branch_Data.LACode = Utility.Location_Area_RF.LACode INNER JOIN
                         Master.Partners_Data ON Master.Branch_Data.PartnerCode = Master.Partners_Data.PartnerCode AND Master.Branch_Data.PartnerCode = Master.Partners_Data.PartnerCode AND 
                         Master.Branch_Data.PartnerCode = Master.Partners_Data.PartnerCode AND Master.Branch_Data.PartnerCode = Master.Partners_Data.PartnerCode


GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_M]  DEFAULT ((0)) FOR [M]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_T]  DEFAULT ((0)) FOR [T]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_W]  DEFAULT ((0)) FOR [W]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_W1]  DEFAULT ((0)) FOR [TH]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_W1_1]  DEFAULT ((0)) FOR [F]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_W1_2]  DEFAULT ((0)) FOR [SA]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_W1_3]  DEFAULT ((0)) FOR [S]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_IsSched]  DEFAULT ((0)) FOR [IsSched]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_IsCancel]  DEFAULT ((0)) FOR [IsPostpone]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_IsSet]  DEFAULT ((0)) FOR [IsSet]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_IsAdd]  DEFAULT ((0)) FOR [IsAdd]
GO
ALTER TABLE [Trans].[Delivery_Schedule_TF] ADD  CONSTRAINT [DF_Delivery_Schedule_TF_DU]  DEFAULT (getdate()) FOR [DU]
GO
ALTER TABLE [Trans].[Delivery_Status_TF] ADD  CONSTRAINT [DF_Delivery_Status_TF_IsSet]  DEFAULT ((0)) FOR [IsSet]
GO
ALTER TABLE [Trans].[Delivery_Status_TF] ADD  CONSTRAINT [DF_Delivery_Status_TF_IsCancel]  DEFAULT ((0)) FOR [IsCancel]
GO
ALTER TABLE [Trans].[Delivery_Status_TF] ADD  CONSTRAINT [DF_Delivery_Status_TF_IsAdd]  DEFAULT ((0)) FOR [IsAdd]
GO
ALTER TABLE [Trans].[Delivery_Status_TF] ADD  CONSTRAINT [DF_Delivery_Status_TF_DU]  DEFAULT (getdate()) FOR [DU]
GO
ALTER TABLE [Trans].[Delivery_TF] ADD  CONSTRAINT [DF_Delivery_TotalPrice]  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [Trans].[Delivery_TF] ADD  CONSTRAINT [DF_Delivery_RowStatus]  DEFAULT ('O') FOR [RowStatus]
GO
ALTER TABLE [Trans].[Delivery_TF] ADD  CONSTRAINT [DF_Delivery_TF_DateOrder]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [Trans].[Delivery_TF] ADD  CONSTRAINT [DF_Delivery_TF_IsDelivered]  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [Trans].[Delivery_TF] ADD  CONSTRAINT [DF_Delivery_DU]  DEFAULT (getdate()) FOR [DU]
GO
ALTER TABLE [Trans].[Partner_Account_Receivable] ADD  CONSTRAINT [DF_Partner_Account_Credit_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [Trans].[Partner_Account_Receivable] ADD  CONSTRAINT [DF_Partner_Account_Credit_Date_Credited]  DEFAULT (getdate()) FOR [Date_Receivable]
GO
ALTER TABLE [Trans].[Partner_Account_Receivable] ADD  CONSTRAINT [DF_Partner_Account_Credit_IsProcessed]  DEFAULT ((0)) FOR [IsProcessed]
GO
ALTER TABLE [Trans].[Partner_Account_Receivable] ADD  CONSTRAINT [DF_Partner_Account_Credit_DU]  DEFAULT (getdate()) FOR [DU]
GO
ALTER TABLE [Trans].[Partner_Account_TF] ADD  CONSTRAINT [DF_Partner_Account_TF_Credit]  DEFAULT ((0)) FOR [Receivable]
GO
ALTER TABLE [Trans].[Partner_Account_TF] ADD  CONSTRAINT [DF_Partner_Account_TF_Debit]  DEFAULT ((0)) FOR [Payable]
GO
ALTER TABLE [Trans].[Partner_Account_TF] ADD  CONSTRAINT [DF_Partner_Account_TF_Balance]  DEFAULT ((0)) FOR [Running_Balance]
GO
ALTER TABLE [Trans].[Partner_Account_TF] ADD  CONSTRAINT [DF_Partner_Account_TF_DateUpdate]  DEFAULT (getdate()) FOR [DateUpdate]
GO
ALTER TABLE [Trans].[Partner_PO_Hdr] ADD  CONSTRAINT [DF_PPO_Hdr_DocStatus]  DEFAULT ('O') FOR [DocStatus]
GO
ALTER TABLE [Trans].[Partner_PO_Hdr] ADD  CONSTRAINT [DF_PPO_Hdr_Void]  DEFAULT ((0)) FOR [Void]
GO
ALTER TABLE [Trans].[Partner_PO_Hdr] ADD  CONSTRAINT [DF_PPO_Hdr_DU]  DEFAULT (getdate()) FOR [DU]
GO
ALTER TABLE [Trans].[Partner_PO_Rows] ADD  CONSTRAINT [DF_Partner_PO_Rows_TotalPrice]  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [Trans].[Partner_PO_Rows] ADD  CONSTRAINT [DF_PPO_Rows_RowStatus]  DEFAULT ('O') FOR [RowStatus]
GO
ALTER TABLE [Trans].[Partner_PO_Rows] ADD  CONSTRAINT [DF_PPO_Rows_DU]  DEFAULT (getdate()) FOR [DU]
GO
ALTER TABLE [Trans].[Storage_TF] ADD  CONSTRAINT [DF_Storage_TF_DU]  DEFAULT (getdate()) FOR [DU]
GO
ALTER TABLE [xSystem].[Delivery_Date_RF] ADD  CONSTRAINT [DF_Delivery_Date_Generate_DateDeliveryListGenerate]  DEFAULT (getdate()) FOR [DateDeliveryList]
GO
ALTER TABLE [HR].[Employee_MD]  WITH CHECK ADD  CONSTRAINT [FK_Employee_MD_Employee_MD] FOREIGN KEY([EmployeeID])
REFERENCES [HR].[Employee_MD] ([EmployeeID])
GO
ALTER TABLE [HR].[Employee_MD] CHECK CONSTRAINT [FK_Employee_MD_Employee_MD]
GO
ALTER TABLE [HR].[Employee_MD]  WITH CHECK ADD  CONSTRAINT [FK_Employee_MD_Utility_Citizenship_RF] FOREIGN KEY([CitizenshipCode])
REFERENCES [HR].[Utility_Citizenship_RF] ([CitizenshipCode])
GO
ALTER TABLE [HR].[Employee_MD] CHECK CONSTRAINT [FK_Employee_MD_Utility_Citizenship_RF]
GO
ALTER TABLE [HR].[Employee_MD]  WITH CHECK ADD  CONSTRAINT [FK_Employee_MD_Utility_Gender_RF] FOREIGN KEY([GenderCode])
REFERENCES [HR].[Utility_Gender_RF] ([GenderCode])
GO
ALTER TABLE [HR].[Employee_MD] CHECK CONSTRAINT [FK_Employee_MD_Utility_Gender_RF]
GO
ALTER TABLE [HR].[Employee_MD]  WITH CHECK ADD  CONSTRAINT [FK_Employee_MD_Utility_Religion_RF] FOREIGN KEY([ReligionCode])
REFERENCES [HR].[Utility_Religion_RF] ([ReligionCode])
GO
ALTER TABLE [HR].[Employee_MD] CHECK CONSTRAINT [FK_Employee_MD_Utility_Religion_RF]
GO
ALTER TABLE [Master].[Branch_Data]  WITH CHECK ADD  CONSTRAINT [FK_LACode] FOREIGN KEY([LACode])
REFERENCES [Utility].[Location_Area_RF] ([LACode])
GO
ALTER TABLE [Master].[Branch_Data] CHECK CONSTRAINT [FK_LACode]
GO
ALTER TABLE [Master].[Branch_Data]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Branch] FOREIGN KEY([PartnerCode])
REFERENCES [Master].[Partners_Data] ([PartnerCode])
GO
ALTER TABLE [Master].[Branch_Data] CHECK CONSTRAINT [FK_Partner_Branch]
GO
ALTER TABLE [Master].[Inventory_Data]  WITH CHECK ADD  CONSTRAINT [ItemCode_FK] FOREIGN KEY([ItemCode])
REFERENCES [Master].[Item_Data] ([ItemCode])
GO
ALTER TABLE [Master].[Inventory_Data] CHECK CONSTRAINT [ItemCode_FK]
GO
ALTER TABLE [Master].[Partner_Account_Data]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Account_Data_Partners_Data] FOREIGN KEY([PartnerCode])
REFERENCES [Master].[Partners_Data] ([PartnerCode])
GO
ALTER TABLE [Master].[Partner_Account_Data] CHECK CONSTRAINT [FK_Partner_Account_Data_Partners_Data]
GO
ALTER TABLE [Trans].[Delivery_Status_TF]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Status_TF_Delivery_Status_TF] FOREIGN KEY([id])
REFERENCES [Trans].[Delivery_Status_TF] ([id])
GO
ALTER TABLE [Trans].[Delivery_Status_TF] CHECK CONSTRAINT [FK_Delivery_Status_TF_Delivery_Status_TF]
GO
ALTER TABLE [Trans].[Delivery_TF]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_TF_Branch] FOREIGN KEY([BranchCode])
REFERENCES [Master].[Branch_Data] ([BranchCode])
GO
ALTER TABLE [Trans].[Delivery_TF] CHECK CONSTRAINT [FK_Delivery_TF_Branch]
GO
ALTER TABLE [Trans].[Delivery_TF]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_TF_Item] FOREIGN KEY([ItemCode])
REFERENCES [Master].[Item_Data] ([ItemCode])
GO
ALTER TABLE [Trans].[Delivery_TF] CHECK CONSTRAINT [FK_Delivery_TF_Item]
GO
ALTER TABLE [Trans].[Partner_PO_Rows]  WITH CHECK ADD  CONSTRAINT [FK_PPO_Rows_PO_Hdr] FOREIGN KEY([PONum])
REFERENCES [Trans].[Partner_PO_Hdr] ([PONum])
GO
ALTER TABLE [Trans].[Partner_PO_Rows] CHECK CONSTRAINT [FK_PPO_Rows_PO_Hdr]
GO
ALTER TABLE [Trans].[Supplier_Voucher_Rows_TF]  WITH CHECK ADD  CONSTRAINT [FK_VoucherNum_Rows] FOREIGN KEY([VoucherNum])
REFERENCES [Trans].[Supplier_Voucher_Hdr_TF] ([VoucherNum])
GO
ALTER TABLE [Trans].[Supplier_Voucher_Rows_TF] CHECK CONSTRAINT [FK_VoucherNum_Rows]
GO
ALTER TABLE [Utility].[Partner_Price_RF]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Code] FOREIGN KEY([PartnerCode])
REFERENCES [Master].[Partners_Data] ([PartnerCode])
GO
ALTER TABLE [Utility].[Partner_Price_RF] CHECK CONSTRAINT [FK_Partner_Code]
GO
ALTER TABLE [Utility].[Partner_Price_RF]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Price_Item] FOREIGN KEY([ItemCode])
REFERENCES [Master].[Item_Data] ([ItemCode])
GO
ALTER TABLE [Utility].[Partner_Price_RF] CHECK CONSTRAINT [FK_Partner_Price_Item]
GO
ALTER TABLE [Utility].[Partner_Price_RF]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Price_Price_RF] FOREIGN KEY([PriceCode])
REFERENCES [Utility].[Price_RF] ([PriceCode])
GO
ALTER TABLE [Utility].[Partner_Price_RF] CHECK CONSTRAINT [FK_Partner_Price_Price_RF]
GO
/****** Object:  StoredProcedure [DMT].[GET_BRANCH_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/23/2018>
-- Description:	<GET LIST BRANCHES>
-- =============================================
CREATE PROCEDURE [DMT].[GET_BRANCH_LIST] 
AS
BEGIN
	SELECT *, A.BranchName + B.PartnerName as SearchText FROM
	Master.Branch_Data A
	INNER JOIN Master.Partners_Data B
	ON A.PartnerCode = b.PartnerCode
	order by a.BranchName
END


GO
/****** Object:  StoredProcedure [DMT].[spGET_ATTACHMENT]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/28/2018>
-- Description:	<GET LIST OF ATTACHMENT>
-- =============================================
CREATE PROCEDURE [DMT].[spGET_ATTACHMENT]
@DMRNUM nvarchar(15)
AS
BEGIN
	
	SELECT ItemDescription,Purpose_Remarks, Attachment
	FROM [DMT].[DebitMemoRequest_TF]
	WHERE DMRNum=@DMRNUM and IsAttachment = 1
	
END


GO
/****** Object:  StoredProcedure [DMT].[spGET_FOR_APPROVAL_REQUEST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/27/2018>
-- Description:	<GET FOR APPROVAL LIST ITEM>
-- =============================================
CREATE PROCEDURE [DMT].[spGET_FOR_APPROVAL_REQUEST]
AS
BEGIN
	
	SELECT A.DMRNum, cONVERT(date, A.DateRequest) as DateRequest, B.BranchName, A.Supervisor 
	FROM [DMT].[DebitMemoRequest_Header_TF] A
	LEFT JOIN Master.Branch_Data B
	ON A.BranchCode = B.BranchCode
	WHERE A.IsCompleted = 0
	ORDER BY A.DateRequest DESC
	
END


GO
/****** Object:  StoredProcedure [DMT].[spGET_ITEM_FOR_APPROVAL]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/27/2018>
-- Description:	<GET FOR APPROVAL LIST ITEM>
-- =============================================
CREATE PROCEDURE [DMT].[spGET_ITEM_FOR_APPROVAL]
@DMRNUM nvarchar(15)
AS
BEGIN
	
	SELECT ID,ItemDescription, Quantity, Amount, Purpose_Remarks,RequestStatus
	FROM DMT.DebitMemoRequest_TF
	WHERE RequestStatus <> 'A' and RequestStatus <> 'R' and DMRNum = @DMRNUM
	
END


GO
/****** Object:  StoredProcedure [DMT].[spGET_ITEM_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/29/2018>
-- Description:	<GET USER_VALIDATION>
-- =============================================
CREATE PROCEDURE [DMT].[spGET_ITEM_LIST]
AS
BEGIN
	
	SELECT * FROM
	[xSystem].[User_MF]
	WHERE
	[DMTAccess] = 1
	
END


GO
/****** Object:  StoredProcedure [DMT].[spGET_REQUEST_STATUS]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/27/2018>
-- Description:	<GET REQUEST STATUS>
-- =============================================
CREATE PROCEDURE [DMT].[spGET_REQUEST_STATUS]
AS
BEGIN
	
	SELECT RequestStatus, RequestDescription
	FROM DMT.Request_Status_RF
	WHERE TYPE = 1
	ORDER BY RequestStatus
	
END


GO
/****** Object:  StoredProcedure [DMT].[spINSERT_DEBIT_MEMO]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* INSERT DEBIT MEMO REQUEST
03/23/2018
Russel Vasquez
*/

CREATE PROC [DMT].[spINSERT_DEBIT_MEMO]
@DMRNUM nvarchar(15),
@BRANCHCODE nvarchar(10),
@SUPERVISOR nvarchar(50),
@REQUESTFOR nvarchar(50),
@CHARGETO nvarchar(50),
@ASSIGNEDTO nvarchar(50),
@ITEMDESCRIPTION nvarchar(150),
@QUANTITY float,
@AMOUNT float,
@PURPOSE_REMARKS nvarchar(250),
@ATTACHMENT image,
@ISATTACHMENT bit,
@DATEREQUEST datetime

AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	--INSERT TO HEADER
	--CHECK IF ALREADY EXIST
	IF NOT EXISTS(SELECT DMRNUM FROM [DMT].[DebitMemoRequest_Header_TF] WHERE DMRNum=@DMRNUM)
	BEGIN
		INSERT INTO [DMT].[DebitMemoRequest_Header_TF]
		(DMRNum,DateRequest,BranchCode,Supervisor,RequestFor,ChargeTo,AssignedTo)
		VALUES
		(@DMRNUM,@DATEREQUEST,@BRANCHCODE,@SUPERVISOR,@REQUESTFOR,@CHARGETO,@ASSIGNEDTO)
	END

	INSERT INTO [DMT].[DebitMemoRequest_TF]
	(DMRNum, ItemDescription, Quantity, Amount, Purpose_Remarks, Attachment,IsAttachment, DateRequest)
	VALUES
	(@DMRNUM, @ITEMDESCRIPTION, @QUANTITY, @AMOUNT, @PURPOSE_REMARKS, @ATTACHMENT,@ISATTACHMENT, @DATEREQUEST)
	
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [DMT].[spUPDATE_APPROVAL_DEBIT_MEMO]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE APPROVAL
03/28/2018
Rev. 04/02/2018
Russel Vasquez
*/

CREATE PROC [DMT].[spUPDATE_APPROVAL_DEBIT_MEMO]
@DMRNUM nvarchar(15),
@REQUESTSTATUS nvarchar(1),
@ID int,
@APPROVER_NOTES nvarchar(250)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	UPDATE DMT.DebitMemoRequest_TF
	SET RequestStatus = @REQUESTSTATUS, DateApproved=getdate()
	WHERE ID = @ID
	
	UPDATE DMT.DebitMemoRequest_Header_TF
	SET Approver_Notes = @APPROVER_NOTES
	WHERE DMRNum = @DMRNUM
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [DMT].[spUPDATE_DEBIT_MEMO_HEADER_COMPLETE_STATUS]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE COMPLETION OF DEBIT MEMO
03/28/2018
Russel Vasquez
*/

CREATE PROC [DMT].[spUPDATE_DEBIT_MEMO_HEADER_COMPLETE_STATUS]
@DMRNUM nvarchar(15)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	-- SETTING COMPLETED THE DEBIT MEMO

	UPDATE dmt.DebitMemoRequest_Header_TF
	SET IsCompleted = 1, DU=getdate()
	WHERE DMRNum = @DMRNUM
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [HR].[spGET_CITIZENSHIP]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/14/2018>
-- Description:	<GET CITIZENSHIP LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_CITIZENSHIP]
AS
BEGIN
	
	SELECT *
	FROM [HR].[Utility_CITIZENSHIP_RF]
	ORDER BY ARR ASC
	
	
END


GO
/****** Object:  StoredProcedure [HR].[spGET_DEPARTMENT]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/17/2018>
-- Description:	<GET DEPARTMENT LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_DEPARTMENT]
AS
BEGIN
	
	SELECT *
	FROM [HR].[Utility_Department_RF]
	ORDER BY Department desc
	
END


GO
/****** Object:  StoredProcedure [HR].[spGET_EMPLOYEE_IMAGE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/14/2018>
-- Description:	<GET EMPLOYEE IMAGE>
-- =============================================
CREATE PROCEDURE [HR].[spGET_EMPLOYEE_IMAGE]
@EMPLOYEEID nvarchar(10)
AS
BEGIN
	
	SELECT Image_Data FROM HR.Employee_Picture_RF
	WHERE EmployeeID = @EMPLOYEEID
	
END


GO
/****** Object:  StoredProcedure [HR].[spGET_EMPLOYEE_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/15/2018>
-- Description:	<GET EMPLOYEE LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_EMPLOYEE_LIST]
AS
BEGIN
	
	SELECT *, C.GenderDescription,
	(A.Last_Name + ', ' + A.First_Name + ' ' + LEFT(a.Middle_Name, 1) + '.') as EmployeeName,
	(A.Last_Name + A.First_Name + A.Middle_Name) as SearchText
	FROM [HR].[Employee_MD] A
	INNER JOIN [HR].[Employee_Picture_RF] B
	ON A.EmployeeID = B.EmployeeID
	INNER JOIN [HR].Utility_Gender_RF C
	ON A.GenderCode = C.GenderCode
	LEFT JOIN [HR].[Employee_Employment_Details_MD] D
	ON A.EmployeeID = D.EmployeeID
	LEFT JOIN [HR].Utility_Department_RF E
	ON D.DepartmentCode = E.DepartmentCode
	LEFT JOIN [HR].[Utility_Position_RF] F
	ON D.PositionCode = F.PositionCode
	LEFT JOIN [hr].[Utility_Employment_Status_RF] G
	ON D.EmploymentStatusCode = G.StatusCode
	ORDER BY a.Last_Name ASC
	
	
END


GO
/****** Object:  StoredProcedure [HR].[spGET_EMPLOYMENT_STATUS]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/17/2018>
-- Description:	<GET DESIGNATION LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_EMPLOYMENT_STATUS]
AS
BEGIN
	
	SELECT *
	FROM [HR].[Utility_Employment_Status_RF]
	ORDER BY Status  asc
	
END


GO
/****** Object:  StoredProcedure [HR].[spGET_GENDER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/13/2018>
-- Description:	<GET GENDER LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_GENDER]
AS
BEGIN
	
	SELECT *
	FROM [HR].[Utility_Gender_RF]
	ORDER BY GENDERCODE desc
	
END


GO
/****** Object:  StoredProcedure [HR].[spGET_POSITION]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/17/2018>
-- Description:	<GET DESIGNATION LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_POSITION]
AS
BEGIN
	
	SELECT *
	FROM [HR].[Utility_Position_RF]
	ORDER BY Position desc
	
END


GO
/****** Object:  StoredProcedure [HR].[spGET_RELIGION]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/13/2018>
-- Description:	<GET RELIGION LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_RELIGION]
AS
BEGIN
	
	SELECT *
	FROM [HR].[Utility_Religion_RF]
	ORDER BY Religion desc
	
END


GO
/****** Object:  StoredProcedure [HR].[spINSERT_EMPLOYEE_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* Insert New Employee Record
02/14/2018
Revised 02/20/2018
Russel Vasquez
*/

CREATE PROC [HR].[spINSERT_EMPLOYEE_DATA]
@EMPLOYEEID nvarchar(10),
@LAST_NAME nvarchar(25),
@FIRST_NAME nvarchar(25),
@MIDDLE_NAME nvarchar(25),
@NICK_NAME nvarchar(20),
@GENDERCODE nvarchar(1),
@DATE_OF_BIRTH datetime,
@PLACE_OF_BIRTH nvarchar(100),
@WEIGHT nvarchar(10),
@HEIGHT nvarchar(10),
@LANDLINE_NUMBER nvarchar(50),
@MOBILE_NUMBER nvarchar(50),
@RELIGIONCODE nvarchar(3),
@CITIZENSHIPCODE nvarchar(3),
@PRESENT_ADDRESS nvarchar(150),
@PROVINCIAL_ADDRESS nvarchar(150),
@TIN nvarchar(20),
@SSS nvarchar(20),
@HDMF nvarchar(20),
@PHILHEALTH nvarchar(20),
@DATE_HIRED datetime,
@DEPARTMENTCODE nvarchar(3),
@POSITIONCODE nvarchar(3),
@EMPLOYMENTSTATUSCODE nvarchar(5),
@SIZE int,
@IMAGE_DATA varbinary(max)

AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	--IDENTIFY ACTION 
	--INSERT TO DELIVERY INFO
	IF NOT EXISTS(SELECT * FROM [HR].Employee_MD WHERE EmployeeID=@EMPLOYEEID)
		BEGIN
		--Insert New Employee Record
		INSERT INTO [HR].[Employee_MD] 
		(EmployeeID, Last_Name, First_Name, Middle_Name, Nick_Name, GenderCode, Date_Of_Birth, Place_Of_Birth, Weight, Height, Landline_Number, Mobile_Number, ReligionCode, CitizenshipCode, Present_Address, Provincial_Address)
		VALUES
		(@EMPLOYEEID,UPPER(@LAST_NAME),UPPER(@FIRST_NAME),UPPER(@MIDDLE_NAME),@NICK_NAME,@GENDERCODE,@DATE_OF_BIRTH,@PLACE_OF_BIRTH,@WEIGHT,@HEIGHT, @LANDLINE_NUMBER,@MOBILE_NUMBER, @RELIGIONCODE, @CITIZENSHIPCODE,@PRESENT_ADDRESS,@PROVINCIAL_ADDRESS)
	
		EXEC xSystem.UPDATE_SERIES_NUMBER 'EMP'
		END

	ELSE
		
		BEGIN
		-- UPDATE BASIC INFORMATION OF EMPLOYEE
		UPDATE [HR].[Employee_MD]
		SET Last_Name=UPPER(@LAST_NAME), First_Name=UPPER(@FIRST_NAME), Middle_Name=UPPER(@MIDDLE_NAME), Nick_Name=@NICK_NAME, 
		GenderCode=@GENDERCODE, Date_Of_Birth=@DATE_OF_BIRTH, Place_Of_Birth=@PLACE_OF_BIRTH, 
		Weight=@WEIGHT, Height=@HEIGHT, Landline_Number=@LANDLINE_NUMBER, Mobile_Number=@MOBILE_NUMBER, 
		ReligionCode=@RELIGIONCODE, CitizenshipCode=@CITIZENSHIPCODE, Present_Address=@PRESENT_ADDRESS, 
		Provincial_Address=@PROVINCIAL_ADDRESS
		WHERE EmployeeID=@EMPLOYEEID
		END

	IF NOT EXISTS(SELECT * FROM [HR].[Employee_Employment_Details_MD] WHERE EmployeeID=@EMPLOYEEID)
		BEGIN
		--Insert Record in Employment Details
		INSERT INTO [HR].[Employee_Employment_Details_MD]
		(EmployeeID, TIN, SSS, HDMF, PhilHealth, Date_Hired, DepartmentCode, PositionCode, EmploymentStatusCode)
		VALUES
		(@EMPLOYEEID,@TIN, @SSS, @HDMF, @PHILHEALTH, @DATE_HIRED, @DEPARTMENTCODE, @POSITIONCODE, @EMPLOYMENTSTATUSCODE)
		END
	ELSE
		BEGIN
		-- UPDATE EMPLOYMENT DETAILS
		UPDATE [HR].[Employee_Employment_Details_MD]
		SET TIN=@TIN, SSS=@SSS, HDMF=@HDMF, PhilHealth=@PHILHEALTH, 
		Date_Hired=@DATE_HIRED, DepartmentCode=@DEPARTMENTCODE, PositionCode=@POSITIONCODE, 
		EmploymentStatusCode=@EMPLOYMENTSTATUSCODE
		WHERE EmployeeID = @EMPLOYEEID 
		END
	

	
	IF NOT EXISTS(SELECT * FROM [HR].[Employee_Picture_RF] WHERE EmployeeID=@EMPLOYEEID)
		BEGIN
		--INSERT Employee Image
		INSERT INTO [HR].[Employee_Picture_RF] (EmployeeID, Picture_Name, Size, Image_Data)
		VALUES (@EMPLOYEEID,@LAST_NAME + ', ' + @FIRST_NAME, @SIZE, @IMAGE_DATA)
		END
	ELSE
		BEGIN
		--UPDATE IMAGE
		UPDATE [HR].[Employee_Picture_RF]
		SET SIZE = @SIZE, Image_Data = @IMAGE_DATA
		WHERE
		EmployeeID = @EMPLOYEEID
		END
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [HR].[spINSERT_EMPLOYEE_PICTURE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/12/2018>
-- Description:	<STORING EMPLOYEE IMAGE>
-- =============================================
CREATE PROCEDURE [HR].[spINSERT_EMPLOYEE_PICTURE]
@EMPLOYEEID nvarchar(10),
@PICTURE_NAME nvarchar(255),
@SIZE int,
@IMAGE_DATA varbinary(max)

AS
BEGIN
	INSERT INTO [HR].[Employee_Picture_RF] (EmployeeID, Picture_Name, Size, Image_Data)
	VALUES (@EMPLOYEEID,@PICTURE_NAME, @SIZE, @IMAGE_DATA)
	
	--SELECT @NEW_ID = SCOPE_IDENTITY()
END


GO
/****** Object:  StoredProcedure [HR].[spUPDATE_EMPLOYEE_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* UPDATE Employee Record
02/17/2018
Russel Vasquez
*/

CREATE PROC [HR].[spUPDATE_EMPLOYEE_DATA]
@EMPLOYEEID nvarchar(10),
--@LAST_NAME nvarchar(25),
--@FIRST_NAME nvarchar(25),
--@MIDDLE_NAME nvarchar(25),
--@NICK_NAME nvarchar(20),
--@GENDERCODE nvarchar(1),
--@DATE_OF_BIRTH datetime,
--@PLACE_OF_BIRTH nvarchar(100),
--@WEIGHT nvarchar(10),
--@HEIGHT nvarchar(10),
--@LANDLINE_NUMBER nvarchar(50),
--@MOBILE_NUMBER nvarchar(50),
--@RELIGIONCODE nvarchar(3),
--@CITIZENSHIPCODE nvarchar(3),
--@PRESENT_ADDRESS nvarchar(150),
--@PROVINCIAL_ADDRESS nvarchar(150),
--@TIN nvarchar(20),
--@SSS nvarchar(20),
--@HDMF nvarchar(20),
--@PHILHEALTH nvarchar(20),
--@DATE_HIRED datetime,
--@DEPARTMENTCODE nvarchar(3),
--@POSITIONCODE nvarchar(3),
--@EMPLOYMENTSTATUSCODE nvarchar(5),
@SIZE int,
@IMAGE_DATA varbinary(max)

AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	----Insert New Employee Record
	--INSERT INTO [HR].[Employee_MD] 
	--(EmployeeID, Last_Name, First_Name, Middle_Name, Nick_Name, GenderCode, Date_Of_Birth, Place_Of_Birth, Weight, Height, Landline_Number, Mobile_Number, ReligionCode, CitizenshipCode, Present_Address, Provincial_Address)
	--VALUES
	--(@EMPLOYEEID,UPPER(@LAST_NAME),UPPER(@FIRST_NAME),UPPER(@MIDDLE_NAME),@NICK_NAME,@GENDERCODE,@DATE_OF_BIRTH,@PLACE_OF_BIRTH,@WEIGHT,@HEIGHT, @LANDLINE_NUMBER,@MOBILE_NUMBER, @RELIGIONCODE, @CITIZENSHIPCODE,@PRESENT_ADDRESS,@PROVINCIAL_ADDRESS)
	

	----Insert Record in Employment Details
	--INSERT INTO [HR].[Employee_Employment_Details_MD]
	--(EmployeeID, TIN, SSS, HDMF, PhilHealth, Date_Hired, DepartmentCode, PositionCode, EmploymentStatusCode)
	--VALUES
	--(@EMPLOYEEID,@TIN, @SSS, @HDMF, @PHILHEALTH, @DATE_HIRED, @DEPARTMENTCODE, @POSITIONCODE, @EMPLOYMENTSTATUSCODE)

	--INSERT Employee Image
	--INSERT INTO [HR].[Employee_Picture_RF] (EmployeeID, Picture_Name, Size, Image_Data)
	--VALUES (@EMPLOYEEID,@LAST_NAME + ', ' + @FIRST_NAME, @SIZE, @IMAGE_DATA)

	UPDATE [HR].[Employee_Picture_RF]
	SET SIZE = @SIZE, Image_Data = @IMAGE_DATA
	WHERE
	EmployeeID = @EMPLOYEEID

--	EXEC xSystem.UPDATE_SERIES_NUMBER 'EMP'
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Master].[CHECK_STORAGE_STOCK_EXIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/13/2017>
-- Description:	<CHECK BRANCH STOCK>
-- =============================================

CREATE PROCEDURE [Master].[CHECK_STORAGE_STOCK_EXIST]
@STORAGECODE nvarchar(6),
@ITEMCODE nvarchar(6)
AS
BEGIN

	SELECT CASE WHEN EXISTS(SELECT * FROM [Master].[Storage_Data]
	WHERE StorageCode=@STORAGECODE and ItemCode=@ITEMCODE)
	THEN CAST(1 AS BIT)
	ELSE CAST(0 AS BIT)
	END

END

GO
/****** Object:  StoredProcedure [Master].[GET_BRANCH_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<GET LIST BRANCHES>
-- =============================================
CREATE PROCEDURE [Master].[GET_BRANCH_DATA] 
AS
BEGIN
	SELECT *, A.BranchName + B.PartnerName as SearchText FROM
	Master.Branch_Data A
	INNER JOIN Master.Partners_Data B
	ON A.PartnerCode = b.PartnerCode
	INNER JOIN Utility.Location_Area_RF C
	ON A.LACode = C.LACode
	ORDER by C.LAName, A.BranchName
END


GO
/****** Object:  StoredProcedure [Master].[GET_ITEM_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<GET ITEM LIST>
-- =============================================
CREATE PROCEDURE [Master].[GET_ITEM_DATA] 
AS
BEGIN
	SELECT *
	FROM Master.Item_Data A
	INNER JOIN Utility.UOM_RF B
	ON A.InvUomCode = B.UomCode
	INNER JOIN [Utility].[Price_RF] C
	ON A.PurchasingPriceCode = C.PriceCode
	ORDER BY A.ItemCode
	
END


GO
/****** Object:  StoredProcedure [Master].[GET_PARTNER_PRICE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/09/2018>
-- Description:	<GET PARTNER ITEM PRICE>
-- =============================================
CREATE PROCEDURE [Master].[GET_PARTNER_PRICE] 
AS
BEGIN
	SELECT A.PartnerCode, B.ItemCode, B.PriceCode
	FROM master.Partners_Data A
	INNER JOIN Utility.Partner_Price_RF B
	ON A.PartnerCode = B.PartnerCode 
END


GO
/****** Object:  StoredProcedure [Master].[GET_PARTNERS_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/20/2017>
-- Description:	<GET LIST PARTNERS>
-- =============================================
CREATE PROCEDURE [Master].[GET_PARTNERS_DATA] 
AS
BEGIN
	--SELECT *, C.PriceCode as LiempoPriceCode, C.PriceAmount as LiempoPrice, D.PriceCode as LeegPriceCode, D.PriceAmount as LeegPriceAmount,
	--E.PriceCode as AtsaraPriceCode, E.PriceAmount as AtsaraPriceAmount
	--FROM Master.Partners_Data A
	--LEFT JOIN 
	--Utility.Price_RF B
	--ON 
	--A.PriceCode = B.PriceCode
	--LEFT JOIN Utility.Price_RF C
	--ON 
	--A.Liempo_PriceCode = C.PriceCode
	--LEFT JOIN Utility.Price_RF D
	--ON 
	--A.Leeg_PriceCode = D.PriceCode
	--LEFT JOIN Utility.Price_RF E
	--ON
	--A.Atsara_PriceCode = E.PriceCode

	SELECT *
	FROM MASTER.Partners_Data
	ORDER by PartnerName
END


GO
/****** Object:  StoredProcedure [Master].[GET_STORAGE_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/13/2017>
-- Description:	<GET STORAGE DATA>
-- =============================================
CREATE PROCEDURE [Master].[GET_STORAGE_DATA] 
AS
BEGIN
	SELECT * FROM
	Master.Storage_Data A
	INNER JOIN
	Utility.Storage_RF B
	ON A.StorageCode = B.StorageCode
	INNER JOIN
	Master.Item_Data C
	ON A.ItemCode = C.ItemCode
	ORDER BY B.StorageID,C.ItemID,  C.ItemName
END


GO
/****** Object:  StoredProcedure [Master].[GET_SUPPLIER_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<GET LIST SUPPLIERS>
-- =============================================
CREATE PROCEDURE [Master].[GET_SUPPLIER_DATA] 
AS
BEGIN
	SELECT *
	FROM Master.Supplier_Data
	ORDER by SupplierName
END


GO
/****** Object:  StoredProcedure [Master].[GET_SUPPLIER_PRICE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/04/2017>
-- Description:	<GET SUPPLIER ITEM PRICE>
-- =============================================
CREATE PROCEDURE [Master].[GET_SUPPLIER_PRICE] 
AS
BEGIN
	SELECT *
	FROM master.Supplier_Data A
	INNER JOIN
	Utility.Supplier_Price_RF B
	ON A.SupplierCode = B.SupplierCode
	INNER JOIN Utility.Price_RF D
	ON B.PriceCode = D.PriceCode
	WHERE A.SupplierCode = 'S00006' AND B.ItemSubCatID = 1
	
END


GO
/****** Object:  StoredProcedure [Master].[INSERT_BRANCH_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<INSERT BRANCH DATA>
-- =============================================
CREATE PROCEDURE [Master].[INSERT_BRANCH_DATA]
@BRANCHCODE nvarchar(6), 
@PARTNERCODE nvarchar(6),
@LACODE nvarchar(6),
@BRANCHNAME nvarchar(100),
@B_ADDRESS nvarchar(250),
@B_CONTACTNUMBERS nvarchar(100),
@SUPERVISOR nvarchar(100)

AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

INSERT INTO 
Master.Branch_Data(BranchCode,PartnerCode,LACode,BranchName,B_Address,B_ContactNumbers,Supervisor)
VALUES
(UPPER(@BRANCHCODE),@PARTNERCODE,@LACODE,UPPER(@BRANCHNAME),@B_ADDRESS,@B_CONTACTNUMBERS,UPPER(@SUPERVISOR))

INSERT INTO 
[Utility].[Delivery_Schedule_RF](BranchCode)
VALUES(@BRANCHCODE)


--INSERT INTO BRANCH_INVENTORY
DECLARE @COUNTER int = 0
DECLARE @ROWCOUNT int = (SELECT COUNT(*) FROM Master.Branch_Item_MF)
DECLARE @GROUPITEMCODE nvarchar(6)

	--WHILE @COUNTER < @ROWCOUNT
	--	BEGIN
	--	SET @COUNTER = @COUNTER + 1
	
	--	--SET @ITEMCODE = @SUB_ITEMCODE + CONVERT(NVARCHAR(2), @COUNTER)
	--	SET @GROUPITEMCODE = (Select Branch_ItemCode FROM Master.Branch_Item_MF WHERE ItemGroupID=@COUNTER)

	--	--SET @CURRENTQUANTITY = (Select EndQuantity FROM Trans.Inventory_Ending_Stock_TF where ItemCode=@ITEMCODE and endDate= dateadd(day,datediff(day,1,GETDATE()),0))
		
	--	INSERT INTO master.Branch_Inventory_RF
	--	(BranchCode, Branch_ItemCode)
	--	VALUES
	--	(@BRANCHCODE,@GROUPITEMCODE) 
	--	END

	INSERT INTO [Master].[Branch_Inventory_RF](BranchCode,Branch_ItemCode)
	SELECT UPPER(@BRANCHCODE), Branch_ItemCode
	FROM Master.Branch_Item_MF

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH
END


GO
/****** Object:  StoredProcedure [Master].[INSERT_ITEM_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<INSERT ITEM DATA>
-- =============================================
CREATE PROCEDURE [Master].[INSERT_ITEM_DATA]
@ITEMCODE nvarchar(6), 
@ITEMNAME nvarchar(100),
@INVUOMCODE nvarchar(6),
@CONVERSIONQTY float

AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

INSERT INTO 
Master.Item_Data(ItemCode,ItemName,InvUomCode,ConversionQty)
VALUES
(UPPER(@ITEMCODE),UPPER(@ITEMNAME),@INVUOMCODE,@CONVERSIONQTY)


--INSERT ON INVENTORY DATA
INSERT INTO master.Inventory_Data(ItemCode, InvUomCode)
VALUES(@ITEMCODE, @INVUOMCODE)

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END


GO
/****** Object:  StoredProcedure [Master].[INSERT_PARTNER_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/20/2017>
-- Updated date: <1/22/2018> VER 2.0 <01/30/2018>
-- VER 3.0 <02/09/2018>
-- Description:	<INSERT PARTNERS DATA>
-- =============================================
CREATE PROCEDURE [Master].[INSERT_PARTNER_DATA]
@PARTNERCODE nvarchar(10), 
@PARTNERNAME nvarchar(100),
@P_ADDRESS nvarchar(250),
@P_CONTACTNUMBERS nvarchar(100),
@P_CONTACTPERSON nvarchar(50),
@ITEMCODE nvarchar(6),
@PRICECODE nvarchar(6)

AS
BEGIN
BEGIN TRY
	BEGIN TRANSACTION
	
	--Condition to avoid multi insertion of the same record.
	IF NOT EXISTS(SELECT * FROM Master.Partners_Data WHERE PartnerCode = @PARTNERCODE)
		BEGIN
		INSERT INTO 
		Master.Partners_Data(PartnerCode,PartnerName,P_Address,P_ContactNumber,P_ContactPerson)
		VALUES
		(UPPER(@PARTNERCODE),UPPER(@PARTNERNAME),@P_ADDRESS,@P_CONTACTNUMBERS,UPPER(@P_CONTACTPERSON))
		END
	ELSE
		--UPDATE RECORD
		BEGIN
		UPDATE MASTER.Partners_Data
		SET PartnerName=UPPER(@PARTNERNAME), P_Address=@P_ADDRESS, P_ContactNumber=@P_CONTACTNUMBERS, 
		P_ContactPerson=@P_CONTACTPERSON
		WHERE
		PartnerCode=@PARTNERCODE
		END

	IF NOT EXISTS(SELECT * FROM Utility.Partner_Price_RF WHERE PartnerCode = @PARTNERCODE AND ItemCode=@ITEMCODE)
		BEGIN
		INSERT INTO Utility.Partner_Price_RF
		(PartnerCode, ItemCOde, PriceCode)	
		VALUES
		(@PARTNERCODE,@ITEMCODE,@PRICECODE)
		END
	ELSE
		BEGIN
		UPDATE Utility.Partner_Price_RF
		SET PriceCode=@PRICECODE
		WHERE PartnerCode=@PARTNERCODE AND ItemCode=@ITEMCODE	
		END

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH
END


GO
/****** Object:  StoredProcedure [Master].[INSERT_SUPPLIER_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<INSERT SUPPLIER DATA>
-- =============================================
CREATE PROCEDURE [Master].[INSERT_SUPPLIER_DATA]
@SUPPLIERCODE nvarchar(10), 
@SUPPLIERNAME nvarchar(100),
@S_ADDRESS nvarchar(250),
@S_CONTACTNUMBERS nvarchar(100),
@S_CONTACTPERSON nvarchar(100),
@ITEMSUBCATID int,
@PRICECODE nvarchar(6)

AS
BEGIN
BEGIN TRY
	BEGIN TRANSACTION

--Condition to avoid multi insertion of the same record.
IF NOT EXISTS(SELECT * FROM Master.Supplier_Data WHERE SupplierCode = @SUPPLIERCODE)
BEGIN
	INSERT INTO 
	Master.Supplier_Data([SupplierCode],[SupplierName],[S_Address],[S_ContactNumber],[S_ContactPerson])
	VALUES
	(UPPER(@SUPPLIERCODE),UPPER(@SUPPLIERNAME),@S_ADDRESS,@S_CONTACTNUMBERS,UPPER(@S_CONTACTPERSON))
END


INSERT INTO Utility.SUPPLIER_PRICE_RF
	(SupplierCode, ItemSubCatID,PriceCode)
	VALUES
	(@SUPPLIERCODE,@ITEMSUBCATID,@PRICECODE)

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END


GO
/****** Object:  StoredProcedure [Master].[UPDATE_BRANCH_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<UPDATE BRANCH DATA>
-- =============================================
CREATE PROCEDURE [Master].[UPDATE_BRANCH_DATA]
@BRANCHCODE nvarchar(6), 
@PARTNERCODE nvarchar(6),
@LACODE nvarchar(6),
@BRANCHNAME nvarchar(100),
@B_ADDRESS nvarchar(250),
@B_CONTACTNUMBERS nvarchar(100),
@SUPERVISOR nvarchar(100)

AS
BEGIN

UPDATE Master.Branch_Data
SET
PartnerCode=@PARTNERCODE,
BranchName=UPPER(@BRANCHNAME),
LACode=@LACODE,
B_Address=@B_ADDRESS,
B_ContactNumbers=@B_CONTACTNUMBERS,
Supervisor=UPPER(@SUPERVISOR)
WHERE
BranchCode=@BRANCHCODE

END


GO
/****** Object:  StoredProcedure [Master].[UPDATE_ITEM_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/3/2017>
-- Description:	<UPDATE ITEM DATA>
-- =============================================
CREATE PROCEDURE [Master].[UPDATE_ITEM_DATA]
@ITEMCODE nvarchar(6), 
@ITEMNAME nvarchar(100),
@CONVERSIONQTY float

AS
BEGIN

UPDATE Master.Item_Data
SET
ItemName=UPPER(@ITEMNAME),
ConversionQty=@CONVERSIONQTY
WHERE
ItemCode=@ITEMCODE

END


GO
/****** Object:  StoredProcedure [Master].[UPDATE_PARTNER_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Update date: <01/22/2018> ver 2 <01/30/2018>
-- Description:	<UPDATE PARTNERS DATA>
-- =============================================
CREATE PROCEDURE [Master].[UPDATE_PARTNER_DATA]
@PARTNERCODE nvarchar(6), 
@PARTNERNAME nvarchar(100),
@P_ADDRESS nvarchar(250),
@P_CONTACTNUMBERS nvarchar(100),
@P_CONTACTPERSON nvarchar(50),
@PRICECODE nvarchar(6),
@LIEMPOPRICECODE nvarchar(6),
@LEEG_PRICE_CODE NVARCHAR(6),
@ATSARA_PRICE_CODE nvarchar(6)

AS
BEGIN

UPDATE
Master.Partners_Data
SET
PartnerName = UPPER(@PARTNERNAME),
P_Address = @P_ADDRESS,
P_ContactNumber = @P_CONTACTNUMBERS,
P_ContactPerson = UPPER(@P_CONTACTPERSON),
PriceCode=@PRICECODE, Liempo_PriceCode=@LIEMPOPRICECODE,
Leeg_PriceCode=@LEEG_PRICE_CODE,
Atsara_PriceCode=@ATSARA_PRICE_CODE
WHERE
PartnerCode = @PARTNERCODE

END


GO
/****** Object:  StoredProcedure [Master].[UPDATE_SUPPLIER_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<UPDATE SUPPLIER DATA>
-- =============================================
CREATE PROCEDURE [Master].[UPDATE_SUPPLIER_DATA]
@SUPPLIERCODE nvarchar(10), 
@SUPPLIERNAME nvarchar(100),
@S_ADDRESS nvarchar(250),
@S_CONTACTNUMBERS nvarchar(100),
@S_CONTACTPERSON nvarchar(100),
@ITEMSUBCATID int,
@PRICECODE nvarchar(6)

AS
BEGIN

UPDATE Master.Supplier_Data
SET
[SupplierName] = UPPER(@SUPPLIERNAME),
[S_Address] = @S_ADDRESS,
[S_ContactNumber] =@S_CONTACTNUMBERS ,
[S_ContactPerson] =UPPER(@S_CONTACTPERSON) 
WHERE
[SupplierCode] = @SUPPLIERCODE


IF NOT EXISTS(SELECT * FROM Utility.SUPPLIER_PRICE_RF WHERE SupplierCode = @SUPPLIERCODE AND ItemSubCatID=@ITEMSUBCATID)
BEGIN
  -- INSERT NEW PRICE
  INSERT INTO Utility.SUPPLIER_PRICE_RF
	(SupplierCode, ItemSubCatID,PriceCode)
	VALUES
	(@SUPPLIERCODE,@ITEMSUBCATID,@PRICECODE)
END

--UPDATE PRICE
UPDATE Utility.SUPPLIER_PRICE_RF
SET PriceCode=@PRICECODE
WHERE SupplierCode=@SUPPLIERCODE and ItemSubCatID=@ITEMSUBCATID

END


GO
/****** Object:  StoredProcedure [Trans].[GET_BRANCH_DISTRIBUTED_ITEM]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/14/2018>
-- Description:	<GET THE QUANTITY OF RECEIVED BRANCH ITEM>
-- =============================================
CREATE PROCEDURE [Trans].[GET_BRANCH_DISTRIBUTED_ITEM]
AS
BEGIN
	
	SELECT TOP 100 *
	FROM TRANS.Pickup_Transfer_Branch_Receive_TF
	ORDER BY DI DESC
		
END


GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_INFO]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <01/26/2018>
-- Description:	<GET DELIVERY INFO>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_INFO] 
@LACODE nvarchar(10),
@DELIVERYORDER datetime 
AS
BEGIN
	SELECT * FROM
	[Trans].[Delivery_Info] A
	LEFT JOIN [Utility].Driver_RF B
	ON A.T1Driver1 = B.DriverID
	LEFT JOIN Utility.Helper_RF C
	ON A.T1Helper1 = C.HelperID
	LEFT JOIN Utility.Vehicle_RF D
	ON A.T1Vehicle = D.PlateID
	WHERE	
	CONVERT(Date, DeliveryOrder, 101) = @DELIVERYORDER
	AND LACode = @LACODE
	
END


GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_INPUT]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/6/2017>
-- Update date: <01/29/2018>
-- Description:	<GET DELIVERY INPUT>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_INPUT] 
AS
BEGIN
	
	SELECT *, (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM001') as FreshConversion, 
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM002') as FrozenConversion,
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM003') as LiempoConversion, 
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM004') as LeegConversion,
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM005') as Atsara100Conversion,
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM006') as Atsara160Conversion,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM001') as FreshCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM002') as FrozenCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM003') as LiempoCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM004') as LeegCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM005') as Atsara100Code,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM006') as Atsara160Code

	 FROM
	MASTER.Branch_Data A
	INNER JOIN MASTER.Partners_Data B
	ON A.PartnerCode = B.PartnerCode
	INNER JOIN Utility.Location_Area_RF C
	ON A.LACode = C.LACode
	INNER JOIN Utility.Price_RF D
	ON B.PriceCode = D.PriceCode
	INNER JOIN Utility.Delivery_Schedule_RF E
	ON A.BranchCode = E.BranchCode
	LEFT JOIN Utility.Price_RF F
	ON B.Liempo_PriceCode = F.PriceCode
	LEFT JOIN Utility.Price_RF G
	ON B.Leeg_PriceCode = G.PriceCode
	LEFT JOIN Utility.Price_RF H
	ON B.Atsara_PriceCode = H.PriceCode
END


GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_INPUT_FINAL]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/6/2017>
-- Update date: <01/29/2018> / <02/09/2018>
-- Description:	<GET DELIVERY INPUT>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_INPUT_FINAL] 
AS
BEGIN
	
	SELECT *, (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM001') as FreshConversion, 
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM002') as FrozenConversion,
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM003') as LiempoConversion, 
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM004') as LeegConversion,
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM005') as Atsara100Conversion,
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM006') as Atsara160Conversion,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM001') as FreshCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM002') as FrozenCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM003') as LiempoCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM004') as LeegCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM005') as Atsara100Code,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM006') as Atsara160Code,
	 F.PriceAmount as LiempoPrice, G.PriceAmount as LeegPrice, H.PriceAmount as AtsaraPrice
	 FROM
	MASTER.Branch_Data A
	INNER JOIN MASTER.Partners_Data B
	ON A.PartnerCode = B.PartnerCode
	INNER JOIN Utility.Location_Area_RF C
	ON A.LACode = C.LACode
	INNER JOIN Utility.Price_RF D
	ON B.PriceCode = D.PriceCode
	INNER JOIN Utility.Delivery_Schedule_RF E
	ON A.BranchCode = E.BranchCode
	LEFT JOIN Utility.Price_RF F
	ON B.Liempo_PriceCode = F.PriceCode
	LEFT JOIN Utility.Price_RF G
	ON B.Leeg_PriceCode = G.PriceCode
	LEFT JOIN Utility.Price_RF H
	ON B.Atsara_PriceCode = H.PriceCode
END


GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/20/2017>
-- Description:	<GET LIST PARTNERS>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_LIST] 
AS
BEGIN
	SELECT *, C.LACode + '-' + c.LAName as LocationArea FROM
	[Trans].[Delivery_Status_TF] A
	INNER JOIN
	[Master].[Branch_Data] B
	ON 
	A.BranchCode = B.BranchCode
	INNER JOIN
	[Utility].Location_Area_RF C
	ON
	B.LACode = C.LACode
	
	WHERE A.IsSet = 1 and Iscancel = 0 and CONVERT(Date,DeliveryDateToday, 101) = CONVERT(Date,getDate(), 101)
	
END


GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_SCHEDULE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/20/2017>
-- Description:	<GET LIST PARTNERS>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_SCHEDULE] 
AS
BEGIN
	SELECT *, CONVERT(date,A.DeliveryDate, 101) as dtDeliveryDate, A.DRNum + ' - ' + B.BranchName as DRBranch,  C.LACode + '-' + c.LAName as LocationArea FROM
	[Trans].[Delivery_Schedule_TF] A
	INNER JOIN
	[Master].[Branch_Data] B
	ON 
	A.BranchCode = B.BranchCode
	INNER JOIN
	[Utility].Location_Area_RF C
	ON
	B.LACode = C.LACode
	
	--WHERE A.IsSet = 1 and Iscancel = 0 and CONVERT(Date,DeliveryDateToday, 101) = CONVERT(Date,getDate(), 101)
	
END


GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_SCHEDULED_FINAL]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/11/2017>
-- Description:	<GET LIST OF SELECTED DELIVERY>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_SCHEDULED_FINAL] 
@DATEDELIVER datetime 
AS
BEGIN
	SELECT *, (A.ConvertedFreshQty + a.ConvertedFrozenQty) as TotalQty,
	(X.DriverName + '/' + X.HelperName + '---' + X.VehiclePlateNumber) as DelInfo 
	FROM Trans.Delivery_Reciept_TF A
	INNER JOIN master.Branch_Data B
	ON A.BranchCode = B.BranchCode
	INNER JOIN Utility.Location_Area_RF C
	ON B.LACode = C.LACode
	LEFT JOIN Trans.Delivery_Info X
	ON B.LACode = X.LACode AND a.OrderDate = X.DeliveryOrder
	
	WHERE A.IsScheduled=1  and A.Iscancel = 0 and CONVERT(Date,A.OrderDate, 101) = CONVERT(Date,@DATEDELIVER, 101)
	
END


GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_TEMP]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/20/2017>
-- Description:	<GET LIST OF DELIVERY TODAY>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_TEMP] 
AS
BEGIN
	SELECT *, A.DRNum + '-' + B.BranchName as DRBranch FROM
	[Trans].[Delivery_Status_TF] A
	INNER JOIN
	[Master].[Branch_Data] B
	ON 
	A.BranchCode = B.BranchCode
	INNER JOIN
	[Utility].[Delivery_Schedule_RF] C
	ON
	A.BranchCode = C.BranchCode
	
	WHERE A.IsSet = 0
	
END


GO
/****** Object:  StoredProcedure [Trans].[GET_ITEM_RUNNING_STOCK]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--IMPORTANT
--RUSSEL VASQUEZ
--DISPLAY ITEM RUNNING TRANSACTION LOGS
CREATE PROC [Trans].[GET_ITEM_RUNNING_STOCK]
@SELECTEDDATE datetime
AS
BEGIN

SELECT A.ItemCode, A.ItemName, B.In_Stock, B.Out_Stock, B.Reference,ISNULL(X.SupplierName,(ISNULL(I2.BranchName,ISNULL(d.BranchName,E.PTNUM + '-' + F.PartnerName)))) as ReferenceText FROM
Master.Item_Data A
LEFT JOIN Trans.Inventory_Running_Stock_TF B
ON A.ItemCode = B.ItemCode
LEFT JOIN Trans.Delivery_Reciept_TF C
ON B.Reference = C.DRNum
LEFT JOIN Master.Branch_Data D
ON C.BranchCode = D.BranchCode
LEFT JOIN Trans.Pickup_Transfer_TF E
ON B.Reference = E.PTNum
LEFT JOIN Master.Partners_Data F
ON E.PartnerCode = F.PartnerCode
LEFT JOIN Trans.Direct_Receiving_Hdr_TF H
ON b.Reference = H.IRNum
LEFT JOIN Master.Supplier_Data X
ON H.SupplierCode = X.SupplierCode
LEFT JOIN TRANS.Stock_Branch_Return_TF I
ON B.Reference = I.SRNum
LEFT JOIN Master.Branch_Data I2
ON I.BranchCode = I2.BranchCode
WHERE CONVERT(date,b.DateTrans, 101) = CONVERT(date,@SELECTEDDATE, 101)
ORDER BY B.DateTrans DESC

END
GO
/****** Object:  StoredProcedure [Trans].[GET_OPENING_AND_ENDING_STOCK]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--IMPORTANT
--RUSSEL VASQUEZ
--DISPLAY OPENING AGAINST CURRENT
--VERSION 2
CREATE PROC [Trans].[GET_OPENING_AND_ENDING_STOCK]
@SELECTEDDATE datetime

AS
BEGIN


SELECT A.ItemCode, A.ItemName,B.Opening, B.Stock_In, B.Stock_Out, B.Ending
FROM
Master.Item_Data A
LEFT JOIN [Trans].[Inventory_Opening_Ending_TF] B
ON A.ItemCode = B.ItemCode
WHERE CONVERT(date,DI,101)= CONVERT(date,@SELECTEDDATE,101)

END
GO
/****** Object:  StoredProcedure [Trans].[GET_OPENING_AND_RUNNING_STOCK]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--IMPORTANT
--RUSSEL VASQUEZ
--DISPLAY OPENING AGAINST CURRENT
CREATE PROC [Trans].[GET_OPENING_AND_RUNNING_STOCK]
@SELECTEDDATE datetime

AS
BEGIN


DECLARE @PREVIOUSDATE datetime
--SET @PREVIOUSDATE = (SELECT dateadd(day,datediff(day,1,@SELECTEDDATE),0))
SET @PREVIOUSDATE = (Select TOP 1 EndDate FROM Trans.Inventory_Ending_Stock_TF Where CONVERT(date,EndDate, 101) < CONVERT(date,@SELECTEDDATE, 101)   Order By EndDate Desc)

Select a.ItemCode, a.ItemName, b.endquantity as Opening_Stock, (select endQuantity from Trans.Inventory_Ending_Stock_TF where ItemCode = a.ItemCode and EndDate=CONVERT(date,@SELECTEDDATE, 101)) as Current_Stock,
ISNULL((Select SUM(Out_Stock) FROM Trans.Inventory_Running_Stock_TF Where ItemCode=a.ItemCode and CONVERT(date,DateTrans, 101) = CONVERT(date,@SELECTEDDATE, 101)), 0) as Stock_Out,
ISNULL((Select SUM(In_Stock) FROM Trans.Inventory_Running_Stock_TF Where ItemCode=a.ItemCode and CONVERT(date,DateTrans, 101) = CONVERT(date,@SELECTEDDATE, 101)), 0) as Stock_In,
ISNULL((Select TOP 1 Running_Stock FROM Trans.Inventory_Running_Stock_TF Where ItemCode=a.ItemCode and CONVERT(date,DateTrans, 101) = CONVERT(date,@SELECTEDDATE, 101) ORDER by DateTrans desc), 0) as Running_Stock
FROM
Master.Item_Data A
LEFT JOIN trans.Inventory_Ending_Stock_TF B
ON A.ItemCode = B.ItemCode
WHERE EndDate=@PREVIOUSDATE

END
GO
/****** Object:  StoredProcedure [Trans].[GET_PARTNER_DEPOSIT]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/22/2017>
-- Description:	<GET PAYMENT LIST>
-- =============================================
CREATE PROCEDURE [Trans].[GET_PARTNER_DEPOSIT] 
AS
BEGIN
	SELECT *
	FROM [Trans].[Partner_Deposit_TF]
	ORDER BY DepositDate DESC
END


GO
/****** Object:  StoredProcedure [Trans].[GET_PARTNER_ITEM_FOR_DISTRIBUTION]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/13/2018>
-- Description:	<GET THE LIST OF AVAILABLE ITEM TO BE DISTRIBUTED>
-- =============================================
CREATE PROCEDURE [Trans].[GET_PARTNER_ITEM_FOR_DISTRIBUTION] 
AS
BEGIN
	
	SELECT A.ID,A.PTBNum,A.PartnerCode,A.BranchItemCode, A.TotalQty, A.DistributedQty, A.DateTrans,
	B.PartnerName, C.Branch_ItemName, (Branch_ItemName + '---' + A.PTBNum + '---' + b.PartnerName) as DisplayText
	FROM
	[Trans].[PickUp_Transfer_Branch_Source_TF] A
	LEFT JOIN [Master].[Partners_Data] B
	ON A.PartnerCode = B.PartnerCode
	LEFT JOIN [Master].[Branch_Item_MF] C
	ON A.BranchItemCode = C.Branch_ItemCode
	WHERE A.IsClosed = 0
	ORDER BY A.DateTrans DESC	
		
END


GO
/****** Object:  StoredProcedure [Trans].[GET_PARTNER_PAYABLE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/22/2017>
-- Description:	<GET PAYABLE LIST>
-- =============================================
CREATE PROCEDURE [Trans].[GET_PARTNER_PAYABLE] 
AS
BEGIN
	SELECT A.ORDERDATE, B.PartnerCode, SUM(A.TotalPriceFresh + A.TotalPriceFrozen + A.TotalLiempoCost) as PayableAmount,
	A.TotalPriceFresh as Fresh_Cost, A.TotalPriceFrozen as Frozen_Cost, A.TotalLiempoCost as Liempo_Cost
	FROM [Trans].[Delivery_Reciept_TF] A
	INNER JOIN [Master].[Branch_Data] B
	ON A.BranchCode = B.BranchCode
	WHERE a.IsCancel = 0
	GROUP BY A.ORDERDATE, B.PartnerCode, A.TotalPriceFresh, A.TotalPriceFrozen, A.TotalLiempoCost
	ORDER BY A.OrderDate DESC
END


GO
/****** Object:  StoredProcedure [Trans].[GET_PARTNER_PRICE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* User query for Partner Price Setup 
11/5/2017
*/

CREATE PROC [Trans].[GET_PARTNER_PRICE]
AS
BEGIN

 SELECT *
 FROM Utility.Partner_Price_RF A
 INNER JOIN
 Utility.Price_RF B
 ON 
 A.PriceCode = B.PriceCode
 INNER JOIN
 Master.Item_Data C
 ON
 A.ItemCode = C.ItemCode

END

GO
/****** Object:  StoredProcedure [Trans].[GET_PREVIOUS_DELIVERY_SCHEDULED_FINAL]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/27/2017>
-- Description:	<GET LIST OF PREVIOUS>
-- =============================================
CREATE PROCEDURE [Trans].[GET_PREVIOUS_DELIVERY_SCHEDULED_FINAL] 
@BRANCHCODE nvarchar(10)
AS
BEGIN
	SELECT TOP 1 *, (A.TotalPriceFresh + a.TotalPriceFrozen) as TotalCost, (A.ConvertedFreshQty + a.ConvertedFrozenQty) as TotalQty
	FROM Trans.Delivery_Reciept_TF A
	INNER JOIN master.Branch_Data B
	ON A.BranchCode = B.BranchCode
	INNER JOIN Utility.Location_Area_RF C
	ON B.LACode = C.LACode
	
	WHERE A.IsScheduled=1  and A.Iscancel = 0 and CONVERT(Date,A.OrderDate, 101) < CONVERT(Date,GETDATE(), 101)
	and A.BranchCode = @BRANCHCODE

	ORDER BY a.OrderDate desc
	
END


GO
/****** Object:  StoredProcedure [Trans].[GET_SUPPLIER_PO_ITEMS]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* User query for PO Items
10/25/2017
*/

CREATE PROC [Trans].[GET_SUPPLIER_PO_ITEMS]
@PONum nvarchar(10)
AS
BEGIN

 SELECT *
 FROM  [Trans].[V_Supplier_PO]
 WHERE PONum=@PONum

END

GO
/****** Object:  StoredProcedure [Trans].[GET_SUPPLIER_PO_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* User query for PO List 
10/26/2017
*/

CREATE PROC [Trans].[GET_SUPPLIER_PO_LIST]
@SUPPLIERCODE nvarchar(10)
AS
BEGIN

 SELECT *
 FROM  [Trans].[V_Supplier_PO_List]
 WHERE supplierCode=@SUPPLIERCODE and StatusCode= 'O'

END

GO
/****** Object:  StoredProcedure [Trans].[GET_SUPPLIER_VOUCHER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* User query for Partner Price Setup 
11/13/2017
*/

CREATE PROC [Trans].[GET_SUPPLIER_VOUCHER]
AS
BEGIN

 SELECT *
 FROM [Trans].[Supplier_Voucher_Hdr_TF]
 order by VoucherNum desc

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_BRANCH_RUNNING_STOCK_IN]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* INSERT TO BRANCH RUNNING_STOCK
03/09/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_BRANCH_RUNNING_STOCK_IN]
@REFERENCENUM nvarchar(15),
@BRANCHCODE nvarchar(6),
@ITEMCODE nvarchar(6),
@CONVERTEDQTY int,
@DATETRANS datetime
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	
	
	--GET THE GROUP ITEMCODE
	DECLARE @BRANCH_ITEMCODE nvarchar(6) = (Select Branch_ItemCode FROM Master.Item_Data Where ItemCode=@ITEMCODE)
	

	--CHECK IF EXIST
	IF NOT EXISTS(Select * FROM Master.Branch_Inventory_RF
				  Where BranchCode=@BRANCHCODE and Branch_ItemCode=@BRANCH_ITEMCODE)
		BEGIN
			INSERT INTO Master.Branch_Inventory_RF (BranchCode,Branch_ItemCode)
			VALUES (@BRANCHCODE,@ITEMCODE)
		END



	DECLARE @RUNNING_STOCK int = (Select Stock_On_Hand From [Master].[Branch_Inventory_RF]
							  Where BranchCode=@BRANCHCODE and Branch_ItemCode=@BRANCH_ITEMCODE)
		
	DECLARE @BALANCE int = @RUNNING_STOCK + @CONVERTEDQTY
	
	INSERT INTO [Trans].[Branch_Inventory_Running_Stock_TF]
	(ReferenceNum, BranchCode, Branch_ItemCode, Running_Stock, Stock_IN, Balance, DateTrans)
	VALUES
	(@REFERENCENUM, @BRANCHCODE,@BRANCH_ITEMCODE,@RUNNING_STOCK,@CONVERTEDQTY,@BALANCE,@DATETRANS)
	
	--UPDATE BRANCH INVENTORY
	UPDATE MASTER.Branch_Inventory_RF
	SET STOCK_IN = STOCK_IN + @CONVERTEDQTY, Stock_On_Hand = Stock_On_Hand + @CONVERTEDQTY,
		DU=GETDATE()
	WHERE BranchCode=@BRANCHCODE AND Branch_ItemCode=@BRANCH_ITEMCODE
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_BRANCH_STOCK_RETURN]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Stock Return
02/07/2018
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_BRANCH_STOCK_RETURN]
@SRNUM nvarchar(10),
@BRANCHCODE nvarchar(6),
@ITEMCODE nvarchar(10),
@QUANTITY float,
@CREDITTOACCOUNT bit,
@DATERETURN datetime,
@REMARKS nvarchar(250)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	DECLARE @PARTNERCODE nvarchar(6)

	SET @PARTNERCODE = (Select PartnerCode from Master.Branch_Data where BranchCode=@BRANCHCODE)

	INSERT Trans.Stock_Branch_Return_TF(SRNum, PartnerCode, BranchCode, ItemCode, Quantity, CreditToAccount, DateReturn, Remarks)
	VALUES(@SRNUM,@PARTNERCODE, @BRANCHCODE, @ITEMCODE,@QUANTITY, @CREDITTOACCOUNT,@DATERETURN,@REMARKS)

	EXEC xSystem.UPDATE_SERIES_NUMBER 'SR'

	
	--INSERT ON INVENTORY TRANSACTION
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@SRNUM,@ITEMCODE,@QUANTITY,1,GETDATE(),'Return Stock')

	--EFFECT ON INVENTORY
	UPDATE master.Inventory_Data
	SET InStock = InStock + @QUANTITY,
	OutStock = OutStock - @QUANTITY, 
	RunningStock = RunningStock + @QUANTITY, 
	dateUpdate=GETDATE()
	WHERE ItemCode=@ITEMCODE

	
	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode,  In_Stock,  Reference)
	VALUES
	(@ITEMCODE,@QUANTITY,@SRNUM)

	--OPENING ENDING STOCK UPDATE
	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_In = Stock_In + @QUANTITY,
	    Ending = Ending + @QUANTITY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODE and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)


	
	--EFFECT ON STORAGE
	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @QUANTITY,
		StockOut = StockOut - @QUANTITY,
		CurrentStock = CurrentStock + @QUANTITY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODE

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_DELIVERY_RECEIPT]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Delivery Receipt Transaction Per Line Item 
11/13//2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_DELIVERY_RECEIPT]
@DRNUM nvarchar(10),
@BRANCHCODE nvarchar(6),
@ITEMCODE nvarchar(10),
@INVQTY float,
@PARTNERQTY float,
@PARTNERUOM nvarchar(10),
@UNITPRICE float,
@TOTALPRICE float,
@REMAININGQTY float,
@ORDERDATE datetime,
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO [Trans].[Delivery_TF](DRNum,BranchCode, ItemCode,InvQty,PartnerQty,PartnerUom,UnitPrice,TotalPrice,RemainingQty,OrderDate,Remarks,UserCode)
	VALUES(@DRNUM,@BRANCHCODE,@ITEMCODE,@INVQTY,@PARTNERQTY,@PARTNERUOM,@UNITPRICE,@TOTALPRICE,@REMAININGQTY,@ORDERDATE,@REMARKS,@USERCODE)
	
	--INSERT ALSO THE TRANSACTION ITEM ON INVENTORY TRANSACTION FILES
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@DRNUM,@ITEMCODE,@INVQTY,0,GETDATE(),@USERCODE)
	

	--UPDATE STOCK INVENTORY
	EXEC [Trans].[UPDATE_STOCK_INVENTORY_FROM_PARTNER] @ITEMCODE, @INVQTY

	--UPDATE DEFAULT STORAGE DGMU Storage
	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn - @INVQTY,
		CurrentStock = CurrentStock - @INVQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODE
	
	

	IF NOT EXISTS(SELECT * FROM [Trans].[Delivery_Schedule_TF] WHERE DRNum = @DRNUM)
		BEGIN
	
		INSERT INTO [Trans].[Delivery_Schedule_TF]
		(DRNum, BranchCode, M,T,W,Th,F,Sa,S) 
		SELECT @DRNUM,@BRANCHCODE, M,T,W,Th,F,Sa,S
		FROM Utility.Delivery_Schedule_RF
		WHERE BranchCode=@BRANCHCODE
		
		
		END
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_DELIVERY_RECEIPT_FINAL]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Delivery Receipt Transaction Per Line Item 
12/7/2017
01/31/2018
REVISED 02/09/2018
REVISED 02/23/2018
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_DELIVERY_RECEIPT_FINAL]
@DRNUM nvarchar(10),
@PARTNERCODE nvarchar(6),
@BRANCHCODE nvarchar(6),
@ITEMCODEFRESH nvarchar(10),
@ITEMCODEFROZEN nvarchar(10),
@ITEMCODELIEMPO nvarchar(10),
@ITEMCODELEEG nvarchar(10),
@ITEMCODEATSARA100 nvarchar(10),
@ITEMCODEATSARA160 nvarchar(10),
@FRESHQTY float,
@FROZENQTY float,
@LIEMPOQTY float,
@LEEGQTY float,
@ATSARA100QTY float,
@ATSARA160QTY float,
@ISCANCEL bit,
@ISADDED bit,
@ORDERDATE datetime,
@REMARKS nvarchar(250),
@USERCODE nvarchar(25),
@IS2TRIP bit,
@T1DRIVER1 int,
@T1DRIVER2 int,
@T1HELPER1 int,
@T1HELPER2 int,
@T1VEHICLE int,
@T1REMARKS nvarchar(250),
@T2DRIVER1 int,
@T2DRIVER2 int,
@T2HELPER1 int,
@T2HELPER2 int,
@T2VEHICLE int,
@T2REMARKS nvarchar(250),
@ASSIGNED_LACODE nvarchar(6)

AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	DECLARE @LACODE nvarchar(10)

	-- CONVERSION SOURCE
	DECLARE @FRESH_CON_SOURCE float
	DECLARE @FROZEN_CON_SOURCE float
	DECLARE @LIEMPO_CON_SOURCE float
	DECLARE @LEEG_CON_SOURCE float
	DECLARE @ATSARA100_CON_SOURCE float
	DECLARE @ATSARA160_CON_SOURCE float
	-- CONVERTED QUANTITY
	DECLARE @CONVERTEDFRESHQTY float
	DECLARE @CONVERTEDFROZENQTY float
	DECLARE @CONVERTEDLIEMPOQTY float
	DECLARE @CONVERTEDLEEGQTY float
	DECLARE @CONVERTEDATSARA100QTY float
	DECLARE @CONVERTEDATSARA160QTY float
	-- ITEM PRICE
	DECLARE @FRESHPRICE float
	DECLARE @FROZENPRICE float
	DECLARE @LIEMPOPRICE float
	DECLARE @LEEGPRICE float
	DECLARE @ATSARA100PRICE float
	DECLARE @ATSARA160PRICE float

	-- TOTAL COST
	DECLARE @TOTALFRESHCOST float
	DECLARE @TOTALFROZENCOST float
	DECLARE @TOTALLIEMPOCOST float
	DECLARE @TOTALLEEGCOST float
	DECLARE @TOTALATSARA100COST float
	DECLARE @TOTALATSARA160COST float

	SET @LACODE = (Select LaCode from [Master].Branch_Data Where BranchCode=@BRANCHCODE)

	--CONVERSION SET
	SET @FRESH_CON_SOURCE = (Select ConversionQty from [Master].Item_Data WHERE ItemCode = 'ITM001') 
	SET @FROZEN_CON_SOURCE = (Select ConversionQty from [Master].Item_Data WHERE ItemCode = 'ITM002') 
	SET @LIEMPO_CON_SOURCE = (Select ConversionQty from [Master].Item_Data WHERE ItemCode = 'ITM003') 
	SET @LEEG_CON_SOURCE = (Select ConversionQty from [Master].Item_Data WHERE ItemCode = 'ITM004') 
	SET @ATSARA100_CON_SOURCE = (Select ConversionQty from [Master].Item_Data WHERE ItemCode = 'ITM005') 
	SET @ATSARA160_CON_SOURCE = (Select ConversionQty from [Master].Item_Data WHERE ItemCode = 'ITM006') 
	
	-- CONVERTED SET
	SET @CONVERTEDFRESHQTY = @FRESHQTY * @FRESH_CON_SOURCE
	SET @CONVERTEDFROZENQTY = @FROZENQTY * @FROZEN_CON_SOURCE
	SET @CONVERTEDLIEMPOQTY = @LIEMPOQTY * @LIEMPO_CON_SOURCE
	SET @CONVERTEDLEEGQTY = @LEEGQTY * @LEEG_CON_SOURCE
	SET @CONVERTEDATSARA100QTY = @ATSARA100QTY * @ATSARA100_CON_SOURCE
	SET @CONVERTEDATSARA160QTY = @ATSARA160QTY * @ATSARA160_CON_SOURCE

	-- ITEM PRICE SET
	SET @FRESHPRICE = (Select TOP 1 C.PriceAmount From Master.Branch_Data A
						INNER JOIN Utility.Partner_Price_RF B
						ON A.PartnerCode = B.PartnerCode
						INNER JOIN Utility.Price_RF C
						ON B.PriceCode = C.PriceCode
						WHERE B.PartnerCode=@PARTNERCODE AND B.ItemCode='ITM001') 
	
	SET @FROZENPRICE = (Select TOP 1 C.PriceAmount From Master.Branch_Data A
						INNER JOIN Utility.Partner_Price_RF B
						ON A.PartnerCode = B.PartnerCode
						INNER JOIN Utility.Price_RF C
						ON B.PriceCode = C.PriceCode
						WHERE B.PartnerCode=@PARTNERCODE AND B.ItemCode='ITM002')
	
	SET @LIEMPOPRICE = (Select TOP 1 C.PriceAmount From Master.Branch_Data A
						INNER JOIN Utility.Partner_Price_RF B
						ON A.PartnerCode = B.PartnerCode
						INNER JOIN Utility.Price_RF C
						ON B.PriceCode = C.PriceCode
						WHERE B.PartnerCode=@PARTNERCODE AND B.ItemCode='ITM003')
	  
	SET @LEEGPRICE = (Select TOP 1 C.PriceAmount From Master.Branch_Data A
						INNER JOIN Utility.Partner_Price_RF B
						ON A.PartnerCode = B.PartnerCode
						INNER JOIN Utility.Price_RF C
						ON B.PriceCode = C.PriceCode
						WHERE B.PartnerCode=@PARTNERCODE AND B.ItemCode='ITM004')
	
	SET @ATSARA100PRICE = (Select TOP 1 C.PriceAmount From Master.Branch_Data A
						INNER JOIN Utility.Partner_Price_RF B
						ON A.PartnerCode = B.PartnerCode
						INNER JOIN Utility.Price_RF C
						ON B.PriceCode = C.PriceCode
						WHERE B.PartnerCode=@PARTNERCODE AND B.ItemCode='ITM005')
						
	SET @ATSARA160PRICE = (Select TOP 1 C.PriceAmount From Master.Branch_Data A
						INNER JOIN Utility.Partner_Price_RF B
						ON A.PartnerCode = B.PartnerCode
						INNER JOIN Utility.Price_RF C
						ON B.PriceCode = C.PriceCode
						WHERE B.PartnerCode=@PARTNERCODE AND B.ItemCode='ITM006')
	
	-- ITEM COST
	SET @TOTALFRESHCOST = @CONVERTEDFRESHQTY * @FRESHPRICE 
	SET @TOTALFROZENCOST = @CONVERTEDFROZENQTY * @FROZENPRICE
	SET @TOTALLIEMPOCOST = @CONVERTEDLIEMPOQTY * @LIEMPOPRICE
	SET @TOTALLEEGCOST = @CONVERTEDLEEGQTY * @LEEGPRICE
	SET @TOTALATSARA100COST = @CONVERTEDATSARA100QTY * @ATSARA160PRICE
	SET @TOTALATSARA160COST = @CONVERTEDATSARA160QTY * @ATSARA160PRICE


	--RUNNING STOCK 
	DECLARE @CURRENT_STOCK float
	DECLARE @BALANCE_STOCK float
	

	--ADD DELIVERY RECIEPT
	IF NOT EXISTS(SELECT * FROM [Trans].[Delivery_Reciept_TF] WHERE CONVERT(date,OrderDate, 101)=@ORDERDATE and BranchCode=@BRANCHCODE)
		BEGIN
	INSERT INTO [Trans].[Delivery_Reciept_TF](DRNum,PartnerCode,BranchCode,
	ItemCodeFresh,ItemCodeFrozen,ItemCodeLiempo,ItemCodeLeeg, ItemCodeAtsara100, ItemCodeAtsara160,
	InvQtyFresh, InvQtyFrozen, InvQtyLiempo, InvQtyLeeg, InvQtyAtsara100, InvQtyAtsara160,
	FreshQty, FrozenQty,LiempoQty, LeegQty, Atsara100Qty, Atsara160Qty,
	ConvertedFreshQty, ConvertedFrozenQty,ConvertedLiempoQty, ConvertedLeegQty, ConvertedAtsara100Qty, ConvertedAtsara160Qty,
	FreshPrice,FrozenPrice,LiempoPrice, LeegPrice, Atsara100Price, Atsara160Price,
	TotalFreshCost,TotalFrozenCost,TotalLiempoCost, TotalLeegCost, TotalAtsara100Cost, TotalAtsara160Cost,
	IsCancel, IsAdded, OrderDate, Remarks,Assigned_LACode,Is2trip, UserCode)
	VALUES(@DRNUM,@PARTNERCODE,@BRANCHCODE,
	@ITEMCODEFRESH,@ITEMCODEFROZEN,@ITEMCODELIEMPO,@ITEMCODELEEG,@ITEMCODEATSARA100, @ITEMCODEATSARA160,
	@FRESH_CON_SOURCE,@FROZEN_CON_SOURCE,@LIEMPO_CON_SOURCE,@LEEG_CON_SOURCE,@ATSARA100_CON_SOURCE,@ATSARA160_CON_SOURCE,
	@FRESHQTY,@FROZENQTY,@LIEMPOQTY,@LEEGQTY,@ATSARA100QTY,@ATSARA160QTY,
	@CONVERTEDFRESHQTY,@CONVERTEDFROZENQTY,@CONVERTEDLIEMPOQTY,@CONVERTEDLEEGQTY, @CONVERTEDATSARA100QTY,@CONVERTEDATSARA160QTY,
	@FRESHPRICE,@FROZENPRICE,@LIEMPOPRICE,@LEEGPRICE,@ATSARA100PRICE,@ATSARA160PRICE,
	@TOTALFRESHCOST,@TOTALFROZENCOST,@TOTALLIEMPOCOST,@TOTALLEEGCOST,@TOTALATSARA100COST,@TOTALATSARA160COST,
	@ISCANCEL,@ISADDED, @ORDERDATE, @REMARKS,@ASSIGNED_LACODE,@IS2TRIP, @USERCODE)
	
	EXEC xSystem.UPDATE_SERIES_NUMBER 'DR'

	
	
	--INSERT ALSO THE TRANSACTION ITEM ON INVENTORY TRANSACTION FILES
	IF @CONVERTEDFRESHQTY <> 0 
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@DRNUM,@ITEMCODEFRESH,@CONVERTEDFRESHQTY,0,GETDATE(),@USERCODE)


	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode,  Out_Stock, Reference)
	VALUES
	(@ITEMCODEFRESH,@CONVERTEDFRESHQTY, @DRNUM)

	
	
	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_Out = Stock_Out + @CONVERTEDFRESHQTY,
	    Ending = Ending - @CONVERTEDFRESHQTY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODEFRESH and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET OutStock = OutStock + @CONVERTEDFRESHQTY,
		RunningStock = RunningStock - @CONVERTEDFRESHQTY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODEFRESH
		

	UPDATE [Master].[Storage_Data]
	SET StockOut = StockOut + @CONVERTEDFRESHQTY,
		CurrentStock = CurrentStock - @CONVERTEDFRESHQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODEFRESH

	--INSERT INTO PARTNER PAYABLE
	INSERT INTO trans.Partner_Account_Payable
	(PartnerCode,Reference, Source, ItemCode, ItemQuantity,ItemConversionQty, UnitPrice,Amount, Date_Payable, UserCode)
	VALUES
	(@PARTNERCODE,@DRNUM,@BRANCHCODE,@ITEMCODEFRESH,@FRESHQTY,@CONVERTEDFRESHQTY,@FRESHPRICE,@TOTALFRESHCOST, GETDATE(),@USERCODE)
	

	--**************
	--INSERT INTO BRANCH INVENTORY
	--**************
	EXEC [TRANS].[INSERT_BRANCH_RUNNING_STOCK_IN] @DRNUM, @BRANCHCODE, @ITEMCODEFRESH, @CONVERTEDFRESHQTY, @ORDERDATE

	
	

	END


	--FROZEN
	IF @CONVERTEDFROZENQTY <> 0 
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@DRNUM,@ITEMCODEFROZEN,@CONVERTEDFROZENQTY,0,GETDATE(), @USERCODE)

	

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode,  Out_Stock, Reference)
	VALUES
	(@ITEMCODEFROZEN,@CONVERTEDFROZENQTY,@DRNUM)
	
	-- ******************************
	
	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_Out = Stock_Out + @CONVERTEDFROZENQTY,
	    Ending = Ending - @CONVERTEDFROZENQTY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODEFROZEN and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)


	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET OutStock = OutStock + @CONVERTEDFROZENQTY,
		RunningStock = RunningStock - @CONVERTEDFROZENQTY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODEFROZEN

	UPDATE [Master].[Storage_Data]
	SET StockOut = StockOut - @CONVERTEDFROZENQTY,
		CurrentStock = CurrentStock - @CONVERTEDFROZENQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODEFROZEN

	
	
	--INSERT INTO PARTNER PAYABLE
	INSERT INTO trans.Partner_Account_Payable
	(PartnerCode,Reference, Source, ItemCode, ItemQuantity,ItemConversionQty, UnitPrice,Amount, Date_Payable, UserCode)
	VALUES
	(@PARTNERCODE,@DRNUM,@BRANCHCODE ,@ITEMCODEFROZEN,@FROZENQTY,@CONVERTEDFROZENQTY,@FROZENPRICE,@TOTALFROZENCOST, GETDATE(),@USERCODE)

	--**************
	--INSERT INTO BRANCH INVENTORY
	--**************
	EXEC [TRANS].[INSERT_BRANCH_RUNNING_STOCK_IN] @DRNUM, @BRANCHCODE, @ITEMCODEFROZEN, @CONVERTEDFROZENQTY, @ORDERDATE

	END --END OF FROZEN CHICKEN

	--LIEMPO
	IF @CONVERTEDLIEMPOQTY <> 0
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@DRNUM,@ITEMCODELIEMPO,@CONVERTEDLIEMPOQTY,0,GETDATE(),@USERCODE)

	

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Out_Stock,  Reference)
	VALUES
	(@ITEMCODELIEMPO,@CONVERTEDLIEMPOQTY, @DRNUM)


	
	--IF NOT EXISTS(Select ItemCode FROM [Trans].[Inventory_Ending_Stock_TF] WHERE Itemcode=@ITEMCODELIEMPO and EndDate = CONVERT(date,getdate(), 101))
	--		BEGIN 
	--		INSERT INTO [Trans].[Inventory_Ending_Stock_TF] 
	--		(ItemCode, EndQuantity, EndDate)
	--		VALUES
	--		(@ITEMCODELIEMPO,@BALANCE_STOCK,GETDATE())
	--		END	
	--ELSE
	--		BEGIN
	--		UPDATE [Trans].[Inventory_Ending_Stock_TF]
	--		SET EndQuantity=@BALANCE_STOCK
	--		WHERE ItemCode=@ITEMCODELIEMPO and EndDate=CONVERT(date,getdate(), 101)
	--		END
	----******************

	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_Out = Stock_Out + @CONVERTEDLIEMPOQTY,
	    Ending = Ending - @CONVERTEDLIEMPOQTY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODELIEMPO and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET OutStock = OutStock + @CONVERTEDFROZENQTY,
		RunningStock = RunningStock - @CONVERTEDLIEMPOQTY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODELIEMPO

	UPDATE [Master].[Storage_Data]
	SET StockOut = StockOut - @CONVERTEDLIEMPOQTY,
		CurrentStock = CurrentStock - @CONVERTEDLIEMPOQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODELIEMPO

	

	--INSERT INTO PARTNER PAYABLE
	INSERT INTO trans.Partner_Account_Payable
	(PartnerCode,Reference, Source, ItemCode, ItemQuantity,ItemConversionQty,UnitPrice, Amount, Date_Payable, UserCode)
	VALUES
	(@PARTNERCODE,@DRNUM,@BRANCHCODE,@ITEMCODELIEMPO,@LIEMPOQTY,@CONVERTEDLIEMPOQTY,@LIEMPOPRICE,@TOTALLIEMPOCOST, GETDATE(),@USERCODE)

	--**************
	--INSERT INTO BRANCH INVENTORY
	--**************
	EXEC [TRANS].[INSERT_BRANCH_RUNNING_STOCK_IN] @DRNUM, @BRANCHCODE, @ITEMCODELIEMPO, @CONVERTEDLIEMPOQTY, @ORDERDATE

	END --END OF LIEMPO

	--LEEG
	IF @CONVERTEDLEEGQTY <> 0 AND @LEEGPRICE IS NOT NULL
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@DRNUM,@ITEMCODELEEG,@CONVERTEDLEEGQTY,0,GETDATE(),@USERCODE)

	
	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode,  Out_Stock,  Reference)
	VALUES
	(@ITEMCODELEEG,@CONVERTEDLEEGQTY,@DRNUM)

	-- ******************************
	-- FOR ENDING BALANCE
	--IF NOT EXISTS(Select ItemCode FROM [Trans].[Inventory_Ending_Stock_TF] WHERE Itemcode=@ITEMCODELEEG and EndDate = CONVERT(date,getdate(), 101))
	--		BEGIN 
	--		INSERT INTO [Trans].[Inventory_Ending_Stock_TF] 
	--		(ItemCode, EndQuantity, EndDate)
	--		VALUES
	--		(@ITEMCODELEEG,@BALANCE_STOCK,GETDATE())
	--		END	
	--ELSE
	--		BEGIN
	--		UPDATE [Trans].[Inventory_Ending_Stock_TF]
	--		SET EndQuantity=@BALANCE_STOCK
	--		WHERE ItemCode=@ITEMCODELEEG and EndDate=CONVERT(date,getdate(), 101)
	--		END
	--******************

	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_Out = Stock_Out + @CONVERTEDLEEGQTY,
	    Ending = Ending - @CONVERTEDLEEGQTY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODELEEG and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET OutStock = OutStock + @CONVERTEDLEEGQTY,
		RunningStock = RunningStock - @CONVERTEDLEEGQTY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODELEEG

	UPDATE [Master].[Storage_Data]
	SET StockOut = StockOut - @CONVERTEDLEEGQTY,
		CurrentStock = CurrentStock - @CONVERTEDLEEGQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODELEEG

	

	--INSERT INTO PARTNER PAYABLE
	INSERT INTO trans.Partner_Account_Payable
	(PartnerCode,Reference, Source, ItemCode, ItemQuantity,ItemConversionQty,UnitPrice, Amount, Date_Payable, UserCode)
	VALUES
	(@PARTNERCODE,@DRNUM,@BRANCHCODE,@ITEMCODELEEG,@LEEGQTY,@CONVERTEDLEEGQTY,@LEEGPRICE,@TOTALLEEGCOST, GETDATE(),@USERCODE)

	--**************
	--INSERT INTO BRANCH INVENTORY
	--**************
	EXEC [TRANS].[INSERT_BRANCH_RUNNING_STOCK_IN] @DRNUM, @BRANCHCODE, @ITEMCODELEEG, @CONVERTEDLEEGQTY, @ORDERDATE

	END --END OF LEEG

	--ATSARA 100
	IF @CONVERTEDATSARA100QTY <> 0
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@DRNUM,@ITEMCODEATSARA100,@CONVERTEDATSARA100QTY,0,GETDATE(),@USERCODE)
	

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Out_Stock,  Reference)
	VALUES
	(@ITEMCODEATSARA100,@CONVERTEDATSARA100QTY, @DRNUM)



	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_Out = Stock_Out + @CONVERTEDATSARA100QTY,
	    Ending = Ending - @CONVERTEDATSARA100QTY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODEATSARA100 and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET OutStock = OutStock + @CONVERTEDATSARA100QTY,
		RunningStock = RunningStock - @CONVERTEDATSARA100QTY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODEATSARA100

	UPDATE [Master].[Storage_Data]
	SET StockOut = StockOut - @CONVERTEDATSARA100QTY,
		CurrentStock = CurrentStock - @CONVERTEDATSARA100QTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODEATSARA100

	

	--INSERT INTO PARTNER PAYABLE
	INSERT INTO trans.Partner_Account_Payable
	(PartnerCode,Reference, Source, ItemCode, ItemQuantity, ItemConversionQty,UnitPrice,Amount, Date_Payable, UserCode)
	VALUES
	(@PARTNERCODE,@DRNUM,@BRANCHCODE,@ITEMCODEATSARA100,@ATSARA100QTY,@CONVERTEDATSARA100QTY,@ATSARA100PRICE,@TOTALATSARA100COST, GETDATE(),@USERCODE)

	--**************
	--INSERT INTO BRANCH INVENTORY
	--**************
	EXEC [TRANS].[INSERT_BRANCH_RUNNING_STOCK_IN] @DRNUM, @BRANCHCODE, @ITEMCODEATSARA100, @CONVERTEDATSARA100QTY, @ORDERDATE

	END --END OF ATSARA 100

	--ATSARA 160
	IF @CONVERTEDATSARA160QTY <> 0
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@DRNUM,@ITEMCODEATSARA160,@CONVERTEDATSARA160QTY,0,GETDATE(),@USERCODE)
	
	

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode,  Out_Stock,  Reference)
	VALUES
	(@ITEMCODEATSARA160,@CONVERTEDATSARA160QTY,@DRNUM)

	
	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_Out = Stock_Out + @CONVERTEDATSARA160QTY,
	    Ending = Ending - @CONVERTEDATSARA160QTY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODEATSARA160 and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET OutStock = OutStock + @CONVERTEDATSARA160QTY,
		RunningStock = RunningStock - @CONVERTEDATSARA160QTY,
		dateUpdate=GETDATE()
	WHERE ItemCode = @ITEMCODEATSARA160

	UPDATE [Master].[Storage_Data]
	SET StockOut = StockOut - @CONVERTEDATSARA160QTY,
		CurrentStock = CurrentStock - @CONVERTEDATSARA160QTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODEATSARA160


	--INSERT INTO PARTNER PAYABLE
	INSERT INTO trans.Partner_Account_Payable
	(PartnerCode,Reference, Source, ItemCode, ItemQuantity,ItemConversionQty,UnitPrice,Amount, Date_Payable, UserCode)
	VALUES
	(@PARTNERCODE,@DRNUM,@BRANCHCODE,@ITEMCODEATSARA160,@ATSARA160QTY,@CONVERTEDATSARA160QTY,@ATSARA160PRICE,@TOTALATSARA160COST, GETDATE(),@USERCODE)
	
	--**************
	--INSERT INTO BRANCH INVENTORY
	--**************
	EXEC [TRANS].[INSERT_BRANCH_RUNNING_STOCK_IN] @DRNUM, @BRANCHCODE, @ITEMCODEATSARA160, @CONVERTEDATSARA160QTY, @ORDERDATE

	END --END OF ATSARA 160

	END --CLOSING OF CONDITION
	
	ELSE
			--UPDATE AREA
			BEGIN
			UPDATE [Trans].[Delivery_Reciept_TF]
			SET Assigned_LACode = @ASSIGNED_LACODE, Remarks=@REMARKS, Is2Trip=@IS2TRIP
			WHERE CONVERT(date,OrderDate, 101)=@ORDERDATE and BranchCode=@BRANCHCODE
			END


	---******************---
	--DELIVERY PERSONNEL INFO
	---******************---
	DECLARE @TRIP1_DRIVERS nvarchar(150)
	DECLARE @TRIP2_DRIVERS nvarchar(150)
	DECLARE @TRIP1_HELPERS nvarchar(150)
	DECLARE @TRIP2_HELPERS nvarchar(150)

	DECLARE @TRIP1_DRIVER_1 nvarchar(100)
	DECLARE @TRIP1_DRIVER_2 nvarchar(100)
	DECLARE @TRIP1_HELPER_1 nvarchar(100)
	DECLARE @TRIP1_HELPER_2 nvarchar(100)

	DECLARE @TRIP2_DRIVER_1 nvarchar(100)
	DECLARE @TRIP2_DRIVER_2 nvarchar(100)
	DECLARE @TRIP2_HELPER_1 nvarchar(100)
	DECLARE @TRIP2_HELPER_2 nvarchar(100)

	DECLARE @TRIP1_VEHICLE_INFO nvarchar(150)
	DECLARE @TRIP2_VEHICLE_INFO nvarchar(150)

	DECLARE @TRIP1_PLATE_NUMBER NVARCHAR(10)
	DECLARE @TRIP1_VEHICLE_NAME nvarchar(150)

	DECLARE @TRIP2_PLATE_NUMBER NVARCHAR(10)
	DECLARE @TRIP2_VEHICLE_NAME nvarchar(150)

	DECLARE @T1LOADCAPACITY int
	DECLARE @T2LOADCAPACITY int
	
	SET @T1LOADCAPACITY = 0
	SET @T2LOADCAPACITY = 0

	--SET THE VALUE
	SET @T1LOADCAPACITY = (Select LoadCapacity from Utility.Vehicle_RF Where PlateID = @T1VEHICLE)
	SET @T2LOADCAPACITY = (Select LoadCapacity from Utility.Vehicle_RF Where PlateID = @T2VEHICLE)

	--DRIVER VALUE
	SET @TRIP1_DRIVER_1 = (Select DriverName FROM Utility.Driver_RF where DriverID = @T1DRIVER1)
	SET @TRIP1_DRIVER_2 = (Select DriverName FROM Utility.Driver_RF where DriverID = @T1DRIVER2)
	SET @TRIP2_DRIVER_1 = (Select DriverName FROM Utility.Driver_RF where DriverID = @T2DRIVER1)
	SET @TRIP2_DRIVER_2 = (Select DriverName FROM Utility.Driver_RF where DriverID = @T2DRIVER2)

	SET @TRIP1_HELPER_1 = (Select HelperName FROM Utility.Helper_RF where HelperID = @T1HELPER1)
	SET @TRIP1_HELPER_2 = (Select HelperName FROM Utility.Helper_RF where HelperID = @T1HELPER2)
	SET @TRIP2_HELPER_1 = (Select HelperName FROM Utility.Helper_RF where HelperID = @T2HELPER1)
	SET @TRIP2_HELPER_2 = (Select HelperName FROM Utility.Helper_RF where HelperID = @T2HELPER2)
	
	--VEHICLE
	SET @TRIP1_PLATE_NUMBER = (SELECT PlateNumber FROM Utility.Vehicle_RF where PlateID=@T1VEHICLE)
	SET @TRIP1_VEHICLE_NAME = (SELECT VehicleDescription FROM Utility.Vehicle_RF where PlateID=@T1VEHICLE)
	SET @TRIP2_PLATE_NUMBER = (SELECT PlateNumber FROM Utility.Vehicle_RF where PlateID=@T2VEHICLE)
	SET @TRIP2_VEHICLE_NAME = (SELECT VehicleDescription FROM Utility.Vehicle_RF where PlateID=@T2VEHICLE)


	DECLARE @ISTRIP2 bit

	--CHECK IF EXIST THE ASSIGNED AREA CODE 
	IF NOT EXISTS(SELECT * FROM [Trans].[Delivery_Info] WHERE CONVERT(date,DeliveryOrder, 101)=@ORDERDATE and LACode=@ASSIGNED_LACODE)
		BEGIN
		--**** INSERT TO DELIVERY INFO *******
		IF NOT EXISTS(SELECT * FROM [Trans].[Delivery_Info] WHERE CONVERT(date,DeliveryOrder, 101)=@ORDERDATE and LACode=@LACODE)
		BEGIN
			IF @T1DRIVER1 IS NOT NULL AND @T1DRIVER1 <> 0 
				BEGIN
				--CONCATINATION
				IF @T1DRIVER2 <> 0
					SET @TRIP1_DRIVERS = @TRIP1_DRIVER_1 + ' / ' + @TRIP1_DRIVER_2
					ELSE
					SET @TRIP1_DRIVERS = @TRIP1_DRIVER_1 
				IF @T2DRIVER2 <> 0
					SET @TRIP2_DRIVERS = @TRIP2_DRIVER_1 + ' / ' + @TRIP2_DRIVER_2
					ELSE
					SET @TRIP2_DRIVERS = @TRIP2_DRIVER_1
				IF @T1HELPER2 <> 0
					SET @TRIP1_HELPERS = @TRIP1_HELPER_1 + ' / ' + @TRIP1_HELPER_2
					ELSE
					SET @TRIP1_HELPERS = @TRIP1_HELPER_1
				IF @T2HELPER2 <> 0
					SET @TRIP2_HELPERS = @TRIP2_HELPER_1 + ' / ' + @TRIP2_HELPER_2
					ELSE
					SET @TRIP2_HELPERS = @TRIP2_HELPER_1

				SET @TRIP1_VEHICLE_INFO = @TRIP1_PLATE_NUMBER + '--' + @TRIP1_VEHICLE_NAME + '--With Capacity Load(' + CONVERT(nvarchar(10), @T1LOADCAPACITY) + ')'
				SET @TRIP2_VEHICLE_INFO = @TRIP2_PLATE_NUMBER + '--' + @TRIP2_VEHICLE_NAME + '--With Capacity Load(' + CONVERT(nvarchar(10), @T2LOADCAPACITY) + ')'
				--DRIVER 2 STATUS
				IF @T2DRIVER1 <> 0
					SET @ISTRIP2 = 1
					ELSE
					SET @ISTRIP2 = 0
				--******************	
				
				
				
				INSERT INTO [Trans].[Delivery_Info]
				(LACode, T1Driver1,T1Driver2,T1Helper1,T1Helper2,T1Vehicle,T1Capacity,T1Remarks,
				  T2Driver1,T2Driver2,T2Helper1,T2Helper2,T2Vehicle,T2Capacity,T2Remarks,DeliveryOrder, Is2Trip,
				  Trip1Drivers, Trip2Drivers, Trip1Helpers,Trip2Helpers, Trip1VehicleDetails, Trip2VehicleDetails)
				 VALUES
				 (@LACODE,@T1DRIVER1,@T1DRIVER2,@T1HELPER1,@T1HELPER2,@T1VEHICLE,@T1LOADCAPACITY,@T1REMARKS,
				 @T2DRIVER1,@T2DRIVER2,@T2HELPER1,@T2HELPER2,@T2VEHICLE,@T2LOADCAPACITY,@T2REMARKS, @ORDERDATE, @ISTRIP2,
				 @TRIP1_DRIVERS,@TRIP2_DRIVERS,@TRIP1_HELPERS,@TRIP2_HELPERS,@TRIP1_VEHICLE_INFO, @TRIP2_VEHICLE_INFO)
		
				END
		END	
	ELSE
	--UPDATE DELIVERY INFO
		BEGIN	
		IF @T1DRIVER1 IS NOT NULL AND @T1DRIVER1 <> 0 
		--CONCATINATION
				IF @T1DRIVER2 <> 0
					SET @TRIP1_DRIVERS = @TRIP1_DRIVER_1 + ' / ' + @TRIP1_DRIVER_2
					ELSE
					SET @TRIP1_DRIVERS = @TRIP1_DRIVER_1 
				IF @T2DRIVER2 <> 0
					SET @TRIP2_DRIVERS = @TRIP2_DRIVER_1 + ' / ' + @TRIP2_DRIVER_2
					ELSE
					SET @TRIP2_DRIVERS = @TRIP2_DRIVER_1
				IF @T1HELPER2 <> 0
					SET @TRIP1_HELPERS = @TRIP1_HELPER_1 + ' / ' + @TRIP1_HELPER_2
					ELSE
					SET @TRIP1_HELPERS = @TRIP1_HELPER_1
				IF @T2HELPER2 <> 0
					SET @TRIP2_HELPERS = @TRIP2_HELPER_1 + ' / ' + @TRIP2_HELPER_2
					ELSE
					SET @TRIP2_HELPERS = @TRIP2_HELPER_1

				SET @TRIP1_VEHICLE_INFO = @TRIP1_PLATE_NUMBER + '--' + @TRIP1_VEHICLE_NAME + '--With Capacity Load(' + CONVERT(nvarchar(10), @T1LOADCAPACITY) + ')'
				SET @TRIP2_VEHICLE_INFO = @TRIP2_PLATE_NUMBER + '--' + @TRIP2_VEHICLE_NAME + '--With Capacity Load(' + CONVERT(nvarchar(10), @T2LOADCAPACITY) + ')'

			--DRIVER 2 STATUS
			IF @T2DRIVER1 <> 0
				SET @ISTRIP2 = 1
				ELSE
				SET @ISTRIP2 = 0
			--******************	

			UPDATE [Trans].[Delivery_Info]
			SET T1Driver1=@T1DRIVER1,T1Driver2=@T1DRIVER2,T1Helper1=@T1HELPER1,T1Helper2=@T1HELPER2,T1Vehicle=@T1VEHICLE,T1Capacity=@T1LOADCAPACITY,T1Remarks=@T1REMARKS,
			T2Driver1=@T2DRIVER1,T2Driver2=@T2DRIVER2,T2Helper1=@T2HELPER1,T2Helper2=@T2HELPER2,T2Vehicle=@T2VEHICLE,T2Capacity=@T2LOADCAPACITY,T2Remarks=@T2REMARKS, is2trip=@ISTRIP2,
			Trip1Drivers=@TRIP1_DRIVERS, Trip2Drivers=@TRIP2_DRIVERS,Trip1Helpers=@TRIP1_HELPERS,Trip2Helpers=@TRIP2_HELPERS,
			Trip1VehicleDetails=@TRIP1_VEHICLE_INFO, Trip2VehicleDetails=@TRIP2_VEHICLE_INFO			
			WHERE LACode=@LACODE and DeliveryOrder = CONVERT(date,@ORDERDATE, 101)  
		END
	
		END
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_PARTNER_DEPOSIT]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* INSERT PARTNER DEPOSIT
11/22/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_PARTNER_DEPOSIT]
@DEPOSITNUM nvarchar(10),
@PARTNERCODE nvarchar(6),
@DEPOSITAMOUNT FLOAT,
@DEPOSITDATE datetime,
@CHEQUENUMBER nvarchar(50),
@BANK nvarchar(50),
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO [Trans].[Partner_Deposit_TF]
	(DepositNum, PartnerCode, DepositAmount, DepositDate, ChequeNumber, Bank, Remarks, UserCode)
	VALUES
	(@DEPOSITNUM,@PARTNERCODE,@DEPOSITAMOUNT,@DEPOSITDATE,@CHEQUENUMBER,@BANK,@REMARKS,@USERCODE)

	EXEC xSystem.UPDATE_SERIES_NUMBER 'PD'
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_PARTNER_PO_TRANS_HDR]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Purchaes Request
10/25/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_PARTNER_PO_TRANS_HDR]
@PONUM nvarchar(10),
@PARTNERCODE nvarchar(10),
@REQUESTDATE datetime,
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

INSERT INTO Trans.Partner_PO_Hdr(PONum,PartnerCode,  RequestDate, Remarks, UserCode)
VALUES(@PONum,@PARTNERCODE, @REQUESTDATE, @REMARKS, @USERCODE)

--AUDIT
--	EXEC xSys.SP_AUDIT_LOG @PONUM, 'CREATED NEW PO', 'PO Module', @USERCODE


	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_PARTNER_PO_TRANS_ROWS]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New PO Transaction Per Line Item 
10/25/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_PARTNER_PO_TRANS_ROWS]
@PONUM nvarchar(10),
@BRANCHCODE nvarchar(6),
@ITEMCODE nvarchar(10),
@INVQTY float,
@PARTNERQTY float,
@PARTNERUOM nvarchar(10),
@UNITPRICE float,
@TOTALPRICE float,
@REMAININGQTY float,
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO [Trans].[Partner_PO_Rows](PONum,BranchCode, ItemCode,InvQty,PartnerQty,PartnerUom,UnitPrice,TotalPrice,RemainingQty,UserCode)
	VALUES(@PONUM,@BRANCHCODE,@ITEMCODE,@INVQTY,@PARTNERQTY,@PARTNERUOM,@UNITPRICE,@TOTALPRICE,@REMAININGQTY,@USERCODE)
	
	--INSERT ALSO THE TRANSACTION ITEM ON INVENTORY TRANSACTION FILES
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@PONUM,@ITEMCODE,@INVQTY,0,GETDATE(),@USERCODE)
	

	--UPDATE STOCK INVENTORY
	EXEC [Trans].[UPDATE_STOCK_INVENTORY_FROM_PARTNER] @ITEMCODE, @INVQTY

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_PICKUP_TRANS_DISTRIBUTE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* DISTRIBUTE ITEM FROM PICK UP AND TRANSFER PROCESS
<03/13/2018>
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_PICKUP_TRANS_DISTRIBUTE]
@PTBNUM nvarchar(12),
@DPTNUM nvarchar(12),
@BRANCHCODE nvarchar(6),
@BRANCHITEMCODE nvarchar(10),
@QUANTITYRECEIVED int,
@DATETRANS datetime,
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	--[1] CHECK FIRST IF EXIST
	
	IF NOT EXISTS(SELECT * FROM Pickup_Transfer_Branch_Receive_TF WHERE PTBNum=@PTBNUM and BranchCode=@BRANCHCODE and Branch_ItemCode=@BRANCHITEMCODE)
		BEGIN
		--[1.1] INSERT RECORD
		INSERT INTO TRANS.Pickup_Transfer_Branch_Receive_TF
		(PTBNum, DPTNum, BranchCode, Branch_ItemCode, QuantityReceived, DateReceived, Remarks, UserCode)
		VALUES
		(@PTBNUM,@DPTNUM, @BRANCHCODE, @BRANCHITEMCODE, @QUANTITYRECEIVED,@DATETRANS,@REMARKS, @USERCODE)
		
		EXEC xSystem.UPDATE_SERIES_NUMBER 'DPT'

		--[1.2] UPDATE PICKUP TRANSFER BRANCH SOURCE
		UPDATE [Trans].[PickUp_Transfer_Branch_Source_TF]
		SET DistributedQty = DistributedQty + @QUANTITYRECEIVED
		WHERE PTBNum = @PTBNUM AND BranchItemCode=@BRANCHITEMCODE

		--[1.3] INSERT INTO BRANCH RUNNING STOCK
		--**************
		--INSERT INTO BRANCH INVENTORY
		--**************
		--EXEC [TRANS].[INSERT_BRANCH_RUNNING_STOCK_IN] @DPTNUM, @BRANCHCODE, @BRANCHITEMCODE, @QUANTITYRECEIVED, @DATETRANS
			DECLARE @RUNNING_STOCK int = (Select Stock_On_Hand From [Master].[Branch_Inventory_RF]
									  Where BranchCode=@BRANCHCODE and Branch_ItemCode=@BRANCHITEMCODE)
		
			DECLARE @BALANCE int = @RUNNING_STOCK + @QUANTITYRECEIVED
	
			INSERT INTO [Trans].[Branch_Inventory_Running_Stock_TF]
			(ReferenceNum, BranchCode, Branch_ItemCode, Running_Stock, Stock_IN, Balance, DateTrans)
			VALUES
			(@DPTNUM, @BRANCHCODE,@BRANCHITEMCODE,@RUNNING_STOCK,@QUANTITYRECEIVED,@BALANCE,@DATETRANS)
	
			--UPDATE BRANCH INVENTORY
			UPDATE MASTER.Branch_Inventory_RF
			SET STOCK_IN = STOCK_IN + @QUANTITYRECEIVED, Stock_On_Hand = Stock_On_Hand + @QUANTITYRECEIVED,
						DU=GETDATE()
			WHERE BranchCode=@BRANCHCODE AND Branch_ItemCode=@BRANCHITEMCODE

		END

	--[2] GET THE QUANTITY SOURCE AND MATCH TO TOTAL DISTRIBUTED ITEM
	DECLARE @INI_QUANTITY int = (SELECT TotalQty FROM [PickUp_Transfer_Branch_Source_TF] WHERE PTBNum = @PTBNUM AND BranchItemCode=@BRANCHITEMCODE)
	DECLARE @TOTAL_DISTRIBUTED int = (SELECT DistributedQty FROM [PickUp_Transfer_Branch_Source_TF] WHERE PTBNum = @PTBNUM AND BranchItemCode=@BRANCHITEMCODE)
	
	IF (@INI_QUANTITY = @TOTAL_DISTRIBUTED)
			BEGIN
			--[2.1] CLOSED THE RECORD
			UPDATE [Trans].[PickUp_Transfer_Branch_Source_TF]
			SET IsClosed = 1
			WHERE PTBNum = @PTBNUM AND BranchItemCode=@BRANCHITEMCODE
		
			--[2.2]
			UPDATE [Trans].[PickUp_Transfer_TF]
			SET IsClosed = 1
			WHERE PTBNum = @PTBNUM
			END

	 
	

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_PICKUP_TRANSFER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* INSERT PARTNER PICKUP
03/09/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_PICKUP_TRANSFER]
@PTNUM nvarchar(12),
@PTBNUM nvarchar(12),
@PARTNERCODE nvarchar(6),
@ITEMCODE nvarchar(6),
@QUANTITY int,
@DATETRANS datetime,
@REMARKS nvarchar(250)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	--RUNNING STOCK 
	DECLARE @CURRENT_STOCK float
	DECLARE @BALANCE_STOCK float

	DECLARE @CONVERSION int = (SELECT ConversionQty FROM MASTER.Item_Data Where ItemCode = @ITEMCODE)
	DECLARE @UNITPRICE float = (SELECT B.PriceAmount FROM Utility.Partner_Price_RF A
								  Inner Join Utility.Price_RF B
								  ON A.PriceCode = B.PriceCode
								  WHERE A.PartnerCode=@PARTNERCODE and A.ItemCode=@ITEMCODE)
	
	DECLARE @CONVERTEDQTY int = @QUANTITY * @CONVERSION
	DECLARE @TOTALPRICE float = @CONVERTEDQTY * @UNITPRICE

	INSERT INTO [Trans].[Pickup_Transfer_TF]
	(PTNum, PartnerCode, ItemCode, Quantity,Conversion, ConvertedQty, UnitPrice, Remarks,DateTrans, PTBNum)
	VALUES
	(@PTNUM, @PARTNERCODE, @ITEMCODE, @QUANTITY,@CONVERSION, @CONVERTEDQTY, @UNITPRICE,@REMARKS, @DATETRANS, @PTBNUM)
	EXEC xSystem.UPDATE_SERIES_NUMBER 'PTI'


	--INSERT INTO PICKUP BRANCH SOURCE
	DECLARE @BRANCHITEMCODE nvarchar(6) = (SELECT Branch_ItemCode FROM master.Item_Data where ItemCode = @ITEMCODE)
	IF NOT EXISTS(SELECT * FROM [Trans].[PickUp_Transfer_Branch_Source_TF] WHERE PartnerCode=@PARTNERCODE and BranchItemCode=@BRANCHITEMCODE and
				  CONVERT(date,DateTrans, 101) = CONVERT(date,@DATETRANS, 101))
		BEGIN
			INSERT INTO [Trans].[PickUp_Transfer_Branch_Source_TF]
			(PTBNum, PartnerCode, BranchItemCode,TotalQty,DateTrans)
			VALUES
			(@PTBNUM,@PARTNERCODE,@BRANCHITEMCODE,@CONVERTEDQTY,@DATETRANS)

			EXEC xSystem.UPDATE_SERIES_NUMBER 'PTB'
		END
	ELSE
		BEGIN
			UPDATE [Trans].[PickUp_Transfer_Branch_Source_TF]
			SET TotalQty=TotalQty + @CONVERTEDQTY
			WHERE PartnerCode=@PARTNERCODE and BranchItemCode=@BRANCHITEMCODE and
				  CONVERT(date,DateTrans, 101) = CONVERT(date,@DATETRANS, 101)
		END

	-- INSERT INTO RUNNING TRANSACTION
	-- INSERT ALSO THE TRANSACTION ITEM ON INVENTORY TRANSACTION FILES
	IF @CONVERTEDQTY <> 0 
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@PTNUM,@ITEMCODE,@CONVERTEDQTY,0,GETDATE(),'USERCODEHERE')

	SET @CURRENT_STOCK = (Select RunningStock FROM 
						[Master].[Inventory_Data]
						WHERE ItemCode=@ITEMCODE)

	SET @BALANCE_STOCK = @CURRENT_STOCK - @CONVERTEDQTY

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Running_Stock, Out_Stock, Balance_Stock, Reference)
	VALUES
	(@ITEMCODE,@CURRENT_STOCK,@CONVERTEDQTY,@BALANCE_STOCK, @PTNUM)

	-- FOR ENDING BALANCE
	IF NOT EXISTS(Select ItemCode FROM [Trans].[Inventory_Ending_Stock_TF] WHERE Itemcode=@ITEMCODE and EndDate = CONVERT(date,getdate(), 101))
			BEGIN 
			INSERT INTO [Trans].[Inventory_Ending_Stock_TF] 
			(ItemCode, EndQuantity, EndDate)
			VALUES
			(@ITEMCODE,@BALANCE_STOCK,GETDATE())
			END	
	ELSE
			BEGIN
			UPDATE [Trans].[Inventory_Ending_Stock_TF]
			SET EndQuantity=@BALANCE_STOCK
			WHERE ItemCode=@ITEMCODE and EndDate=CONVERT(date,getdate(), 101)
			END

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET InStock = InStock - @CONVERTEDQTY,
		OutStock = OutStock + @CONVERTEDQTY,
		RunningStock = RunningStock - @CONVERTEDQTY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODE
		

	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn - @CONVERTEDQTY,
		CurrentStock = CurrentStock - @CONVERTEDQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODE

	--INSERT INTO PARTNER PAYABLE
	INSERT INTO trans.Partner_Account_Payable
	(PartnerCode,Reference, Source, ItemCode, ItemQuantity,ItemConversionQty, UnitPrice,Amount, Date_Payable, UserCode)
	VALUES
	(@PARTNERCODE,@PTNUM,@PTNUM,@ITEMCODE,@QUANTITY,@CONVERTEDQTY,@UNITPRICE,@TOTALPRICE, GETDATE(),'USERCODEHERE')
	
	END
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_RECEIVING_ITEM]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Receiving Item
04/26/2018
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_RECEIVING_ITEM]
@IRNUM nvarchar(15),
@SUPPLIERCODE nvarchar(8),
@ITEMCODE nvarchar(10),
@QUANTITY int,
@DATERECEIVED datetime,
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	
	--CHECK IF EXIST
	IF NOT EXISTS(Select IRNUm FROM Trans.Direct_Receiving_Hdr_TF
				  Where IRNum=@IRNUM)
		BEGIN
			INSERT INTO Trans.Direct_Receiving_Hdr_TF
			(IRNum, SupplierCode, DateReceived,Remarks,UserCode)
			VALUES
			(@IRNUM,@SUPPLIERCODE,@DATERECEIVED,@REMARKS,@USERCODE)

			EXEC xSystem.UPDATE_SERIES_NUMBER 'IR'
		
		END

	
	-- INSERT INTO RECEIVING LINE TF
	INSERT INTO [Trans].[Direct_Receiving_Line_TF](IRNum,ItemCode,Quantity)
	VALUES(@IRNUM,@ITEMCODE,@QUANTITY)

	
	--INSERT INTO INVENTORY LOG TRANSACTION
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@IRNUM,@ITEMCODE,@QUANTITY,1,GETDATE(),'Received Stock')

	--EFFECT ON INVENTORY
	UPDATE master.Inventory_Data
	SET InStock = InStock + @QUANTITY,
	RunningStock = RunningStock + @QUANTITY, 
	dateUpdate=GETDATE()
	WHERE ItemCode=@ITEMCODE

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, In_Stock,  Reference)
	VALUES
	(@ITEMCODE,@QUANTITY, @IRNUM)
	
	----EFFECT ON STORAGE
	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @QUANTITY,
		CurrentStock = CurrentStock + @QUANTITY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODE

	--EFFECT ON OPENING AND ENDING DAILY STOCK
	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_In = Stock_In + @QUANTITY,
	    Ending = Ending + @QUANTITY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODE and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_STOCK_ADJUSTMENT]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert Stock Adjustment Transaction 
12/19/2017
ver2 03/16/2018
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_STOCK_ADJUSTMENT]
@ASNUM nvarchar(10),
@ADJCODE nvarchar(10),
@ITEMCODE nvarchar(10),
@QUANTITY int,
@ADJDATE datetime,
@REFERENCE nvarchar(10),
@REMARKS nvarchar(250)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

DECLARE @CURRENT_STOCK int
DECLARE @BALANCE_STOCK int
	
INSERT Trans.Adjustment_TF(ASNum,AdjCode,ItemCode,Quantity,AdjDate,Reference,Remarks)
VALUES(@ASNUM,@ADJCODE,@ITEMCODE,@QUANTITY,@ADJDATE,@REFERENCE,@REMARKS)
EXEC xSystem.UPDATE_SERIES_NUMBER 'SA'



IF @ADJCODE = 'ARB'  
	BEGIN
	--INVENTORY TRANSACTION
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@ASNUM,@ITEMCODE,@QUANTITY,1,GETDATE(),'----')

	

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, In_Stock, Reference)
	VALUES
	(@ITEMCODE,@QUANTITY,@ASNUM)

	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_In = Stock_In + @QUANTITY,
	    Ending = Ending + @QUANTITY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODE and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)



	UPDATE [Master].[Inventory_Data]
	SET InStock = InStock + @QUANTITY,
		OutStock = OutStock - @QUANTITY,
		RunningStock = RunningStock + @QUANTITY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODE

	
	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @QUANTITY,
		CurrentStock = CurrentStock + @QUANTITY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODE
END
ELSE IF @ADJCODE = 'AWP'
	BEGIN


	--INVENTORY TRANSACTION
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@ASNUM,@ITEMCODE,@QUANTITY,1,GETDATE(),'----')

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, In_Stock,Reference)
	VALUES
	(@ITEMCODE,@QUANTITY, @ASNUM)

	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_In = Stock_In + @QUANTITY,
	    Ending = Ending + @QUANTITY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODE and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)


	UPDATE [Master].[Inventory_Data]
	SET InStock = InStock + @QUANTITY,
		OutStock = OutStock - @QUANTITY,
		RunningStock = RunningStock + @QUANTITY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODE


	
	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @QUANTITY,
		CurrentStock = CurrentStock + @QUANTITY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODE
	END
ELSE
	BEGIN

		
	--INVENTORY TRANSACTION
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@ASNUM,@ITEMCODE,@QUANTITY,0,GETDATE(),'----')

	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Out_Stock,  Reference)
	VALUES
	(@ITEMCODE,@QUANTITY , @ASNUM)

	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_Out = Stock_Out + @QUANTITY,
	    Ending = Ending - @QUANTITY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODE and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)

	UPDATE [Master].[Inventory_Data]
	SET InStock = InStock - @QUANTITY,
		OutStock = OutStock + @QUANTITY,
		RunningStock = RunningStock - @QUANTITY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODE



	

	
	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn - @QUANTITY,
		CurrentStock = CurrentStock - @QUANTITY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODE
END



--AUDIT
--	EXEC xSys.SP_AUDIT_LOG @ASNUM, @ADJCODE, 'Adjustment Trans Module', @USERCODE

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_STOCK_TRANSFER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert Stock Transaction
11/13//2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_STOCK_TRANSFER]
@STNUM nvarchar(10),
@DATETRANSFER datetime,
@STORAGEFROM nvarchar(6),
@STORAGETO nvarchar(6),
@ITEMCODE nvarchar(6),
@QUANTITY FLOAT,
@REMARKS nvarchar(250),
@USERCODE nvarchar(50),
@EXIST bit
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	

	

	INSERT INTO [Trans].[Storage_TF]
	(STNum, DateTransfer, StorageFrom, StorageTo,ItemCode, Quantity, Remarks, UserCode)
	VALUES
	(@STNUM,@DATETRANSFER,@STORAGEFROM,@STORAGETO,@ITEMCODE,@QUANTITY,@REMARKS,@USERCODE)
	--INSERT ALSO THE TRANSACTION ITEM ON INVENTORY TRANSACTION FILES
	
	EXEC xSystem.UPDATE_SERIES_NUMBER 'ST'
	

	
	IF @EXIST = 1
	BEGIN TRY
	BEGIN TRANSACTION
	--Storage From
	UPDATE [Master].[Storage_Data]
	SET StockOut = StockOut + @QUANTITY,
	    StockIn = StockIn - @QUANTITY,
		CurrentStock = CurrentStock - @QUANTITY,
		DU=GETDATE()
	WHERE
	StorageCode=@STORAGEFROM and ItemCode=@ITEMCODE

	--Storage To
	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @QUANTITY,
		CurrentStock = StockIn + @QUANTITY,
		DU=GETDATE()
	WHERE
	StorageCode=@STORAGETO and ItemCode=@ITEMCODE
		COMMIT TRANSACTION
		END TRY

		BEGIN CATCH

		ROLLBACK TRANSACTION -- Will not commit changes on all tables

		END CATCH
	
	ELSE

	BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO [Master].[Storage_Data]
	(StorageCode,ItemCode,StockIn,CurrentStock)
	VALUES
	(@STORAGETO,@ITEMCODE,@QUANTITY,@QUANTITY)
	
	--Storage From
	UPDATE [Master].[Storage_Data]
	SET StockOut = StockOut + @QUANTITY,
	    StockIn = StockIn - @QUANTITY,
		CurrentStock = CurrentStock - @QUANTITY,
		DU=GETDATE()
	WHERE
	StorageCode=@STORAGEFROM and ItemCode=@ITEMCODE

		COMMIT TRANSACTION
		END TRY

		BEGIN CATCH

		ROLLBACK TRANSACTION -- Will not commit changes on all tables

		END CATCH

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_SUPPLIER_GRPO_TRANS_HDR]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Purchaes Request
10/25/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_SUPPLIER_GRPO_TRANS_HDR]
@GRPONUM nvarchar(10),
@PONUM nvarchar(10),
@SUPPLIERCODE nvarchar(10),
@REQUESTDATE datetime,
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

INSERT INTO Trans.GR_Supplier_PO_Hdr(GRPONum,PONum,SupplierCode,  RequestDate, Remarks, UserCode)
VALUES(@GRPONUM,@PONum,@SUPPLIERCODE, @REQUESTDATE, @REMARKS, @USERCODE)

--AUDIT
--	EXEC xSys.SP_AUDIT_LOG @PONUM, 'CREATED NEW PO', 'PO Module', @USERCODE


	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_SUPPLIER_VOUCHER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Purchaes Request
12/04/2017
update: 03/16/2018
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_SUPPLIER_VOUCHER]
@VOUCHERNUM nvarchar(8),
@SUPPLIERCODE nvarchar(10),
@RECEIVEDATE datetime,
@BANKNAME nvarchar(100),
@CHEQUENUMBER nvarchar(100),
@REMARKS nvarchar(250),
@ITEMCODE nvarchar(10),
@ITEMSUBID int,
@INVQTY float,
@INVUOMCODE nvarchar(6),
@SUPPLIERQTY float,
@SUPPLIERUOMCODE nvarchar(6),
@SUPPLIERPRICE float,
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION




	IF NOT EXISTS(SELECT * FROM [Trans].[Supplier_Voucher_Hdr_TF] WHERE VoucherNum = @VOUCHERNUM)
		BEGIN
		INSERT INTO [Trans].[Supplier_Voucher_Hdr_TF](VoucherNum,SupplierCode,ReceiveDate,BankName,ChequeNumber,Remarks,UserCode)
		VALUES(@VOUCHERNUM,@SUPPLIERCODE,@RECEIVEDATE,@BANKNAME,@CHEQUENUMBER,@REMARKS,@USERCODE)
		END

	
	--INSERT INTO [Trans].[Supplier_PO_Rows](PONum, ItemCode,InvQty,SupplierQty,SupplierUom,UnitPrice,RemainingQty,UserCode)
	--VALUES(@PONUM,@ITEMCODE,@INVQTY,@SUPPLIERQTY,@SUPPLIERUOM,@UNITPRICE,@REMAININGQTY,@USERCODE)
	INSERT INTO [Trans].[Supplier_Voucher_Rows_TF]
	(VoucherNum,ItemCode,ItemSubID,InvQty,InvUomCode,SupplierQty,SupplierUomCode,SupplierPrice,UserCode)
	VALUES
	(@VOUCHERNUM,@ITEMCODE,@ITEMSUBID,@INVQTY,@INVUOMCODE,@SUPPLIERQTY,@SUPPLIERUOMCODE,@SUPPLIERPRICE,@USERCODE)
	
	--INSERT ALSO THE TRANSACTION ITEM ON INVENTORY TRANSACTION FILES
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@VOUCHERNUM,@ITEMCODE,@INVQTY,1,GETDATE(),@USERCODE)
	
	--[1]
	--INSERT ALSO IN INVENTORY RUNNING STOCK
	DECLARE @CURRENT_STOCK int = (Select RunningStock FROM 
						[Master].[Inventory_Data]
						WHERE ItemCode=@ITEMCODE)

	DECLARE @BALANCE_STOCK int = @CURRENT_STOCK + @INVQTY

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Running_Stock, In_Stock, Balance_Stock, Reference)
	VALUES
	(@ITEMCODE,@CURRENT_STOCK,@INVQTY,@BALANCE_STOCK, @VOUCHERNUM)
	

	--[2]
	--UPDATE STOCK INVENTORY 
	--INCREASE STOCK
	EXEC [Trans].[UPDATE_STOCK_INVENTORY_FROM_SUPPLIER] @ITEMCODE, @INVQTY


	--[3]
	-- FOR ENDING BALANCE
	IF NOT EXISTS(Select ItemCode FROM [Trans].[Inventory_Ending_Stock_TF] WHERE Itemcode=@ITEMCODE and EndDate = CONVERT(date,getdate(), 101))
			BEGIN 
			INSERT INTO [Trans].[Inventory_Ending_Stock_TF] 
			(ItemCode, EndQuantity, EndDate)
			VALUES
			(@ITEMCODE,@BALANCE_STOCK,GETDATE())
			END	
	ELSE
			BEGIN
			UPDATE [Trans].[Inventory_Ending_Stock_TF]
			SET EndQuantity=@BALANCE_STOCK
			WHERE ItemCode=@ITEMCODE and EndDate=CONVERT(date,getdate(), 101)
			END

	--UPDATE DEFAULT STORAGE DGMU Storage
	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @INVQTY,
		CurrentStock = StockIn + @INVQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODE



	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_SUPPLIER_VOUCHER_HDR]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Purchaes Request
10/25/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_SUPPLIER_VOUCHER_HDR]
@VOUCHERNUM nvarchar(8),
@SUPPLIERCODE nvarchar(10),
@RECEIVEDATE datetime,
@BANKNAME nvarchar(100),
@CHEQUENUMBER nvarchar(100),
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION



INSERT INTO [Trans].[Supplier_Voucher_Hdr_TF](VoucherNum,SupplierCode,ReceiveDate,BankName,ChequeNumber,Remarks,UserCode)
VALUES(@VOUCHERNUM,@SUPPLIERCODE,@RECEIVEDATE,@BANKNAME,@CHEQUENUMBER,@REMARKS,@USERCODE)
--AUDIT
--	EXEC xSys.SP_AUDIT_LOG @PONUM, 'CREATED NEW PO', 'PO Module', @USERCODE


	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[INSERT_SUPPLIER_VOUCHER_ROWS]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert Item Transaction Per Line Item 
11/3/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_SUPPLIER_VOUCHER_ROWS]
@VOUCHERNUM nvarchar(8),
@ITEMCODE nvarchar(10),
@ITEMSUBID int,
@INVQTY float,
@INVUOMCODE nvarchar(6),
@SUPPLIERQTY float,
@SUPPLIERUOMCODE nvarchar(6),
@SUPPLIERPRICE float,
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	--INSERT INTO [Trans].[Supplier_PO_Rows](PONum, ItemCode,InvQty,SupplierQty,SupplierUom,UnitPrice,RemainingQty,UserCode)
	--VALUES(@PONUM,@ITEMCODE,@INVQTY,@SUPPLIERQTY,@SUPPLIERUOM,@UNITPRICE,@REMAININGQTY,@USERCODE)
	INSERT INTO [Trans].[Supplier_Voucher_Rows_TF]
	(VoucherNum,ItemCode,ItemSubID,InvQty,InvUomCode,SupplierQty,SupplierUomCode,SupplierPrice,UserCode)
	VALUES
	(@VOUCHERNUM,@ITEMCODE,@ITEMSUBID,@INVQTY,@INVUOMCODE,@SUPPLIERQTY,@SUPPLIERUOMCODE,@SUPPLIERPRICE,@USERCODE)
	
	--INSERT ALSO THE TRANSACTION ITEM ON INVENTORY TRANSACTION FILES
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@VOUCHERNUM,@ITEMCODE,@INVQTY,1,GETDATE(),@USERCODE)
	
	--INSERT ALSO IN INVENTORY RUNNING STOCK
	DECLARE @CURRENT_STOCK int = (Select RunningStock FROM 
						[Master].[Inventory_Data]
						WHERE ItemCode=@ITEMCODE)

	DECLARE @BALANCE_STOCK int = @CURRENT_STOCK + @INVQTY

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Running_Stock, Out_Stock, Balance_Stock, Reference)
	VALUES
	(@ITEMCODE,@CURRENT_STOCK,@INVQTY,@BALANCE_STOCK, @VOUCHERNUM)

	--UPDATE STOCK INVENTORY 
	--INCREASE STOCK
	EXEC [Trans].[UPDATE_STOCK_INVENTORY_FROM_SUPPLIER] @ITEMCODE, @INVQTY

	

	--UPDATE DEFAULT STORAGE DGMU Storage
	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @INVQTY,
		CurrentStock = StockIn + @INVQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODE

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[STOCK_OPENING_ENDING_DAILY]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--THIS IS FOR SYSTEM GENERATED RECORDING OF DAILY OPENING AND ENDING STOCK IN INVENTORY
--RUSSEL VASQUEZ
--04/26/2018

CREATE PROC [Trans].[STOCK_OPENING_ENDING_DAILY]
AS
BEGIN

IF NOT EXISTS (SELECT DI from [Trans].[Inventory_Opening_Ending_TF] where CONVERT(date,DI,101)=CONVERT(date,getdate(), 101))
	
	BEGIN

	INSERT INTO [Trans].[Inventory_Opening_Ending_TF](ItemCode,Opening,Ending)
	SELECT ItemCode,RunningStock,RunningStock
	FROM [Master].[Inventory_Data]
	
	END

END
GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_ADD]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE DELIVERY RESCHED
11/20/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_ADD]
@DRNUM nvarchar(10),
@REMARKS nvarchar(250),
@DELIVERYDATE datetime
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	UPDATE [Trans].[Delivery_Schedule_TF]
	SET IsSched = 0, IsPostPone = 0, IsAdd = 1, DeliveryDate = @DELIVERYDATE, Remarks=@REMARKS
	WHERE DRNum = @DRNUM

		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_POSTPONE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE Delivery Cancel Status
11/22/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_POSTPONE] 
@DRNUM nvarchar(10),
@REMARKS nvarchar(150)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	UPDATE [Trans].[Delivery_Schedule_TF]
	SET IsSched = 0, IsPostPone = 1, DeliveryDate = NULL, Remarks=@REMARKS
	WHERE DRNum = @DRNUM

		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_RECEIPT_FINAL]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Delivery Receipt Transaction Per Line Item 
12/15/2017
DATE UPDATE: 01/24/2018, 01/31/2018
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_RECEIPT_FINAL]
@BRANCHCODE nvarchar(6),
@ORDERDATE datetime,
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	DECLARE @CONVERTEDFRESHQTY float
	DECLARE @CONVERTEDFROZENQTY float
	DECLARE @CONVERTEDLIEMPO float
	DECLARE @CONVERTEDLEEG float
	DECLARE @CONVERTEDATSARA100 float
	DECLARE @CONVERTEDATSARA160 float
	DECLARE @DRNUM nvarchar(10)
	
	SET @CONVERTEDFRESHQTY = (Select ConvertedFreshQty from [Trans].Delivery_Reciept_TF Where BranchCode=@BRANCHCODE and CONVERT(date,OrderDate, 101) = @ORDERDATE)
	SET @CONVERTEDFROZENQTY = (Select ConvertedFrozenQty from [Trans].Delivery_Reciept_TF Where BranchCode=@BRANCHCODE and CONVERT(date,OrderDate, 101) = @ORDERDATE)
	SET @CONVERTEDLIEMPO = (Select ConvertedLiempoQty from [Trans].Delivery_Reciept_TF Where BranchCode=@BRANCHCODE and CONVERT(date,OrderDate, 101) = @ORDERDATE)
	SET @CONVERTEDLEEG = (Select ConvertedLeegQty from [Trans].Delivery_Reciept_TF Where BranchCode=@BRANCHCODE and CONVERT(date,OrderDate, 101) = @ORDERDATE)
	SET @CONVERTEDATSARA100 = (Select ConvertedAtsara100Qty from [Trans].Delivery_Reciept_TF Where BranchCode=@BRANCHCODE and CONVERT(date,OrderDate, 101) = @ORDERDATE)
	SET @CONVERTEDATSARA160= (Select ConvertedAtsara160Qty from [Trans].Delivery_Reciept_TF Where BranchCode=@BRANCHCODE and CONVERT(date,OrderDate, 101) = @ORDERDATE)

	SET @DRNUM = (Select DRNum from [Trans].Delivery_Reciept_TF Where BranchCode=@BRANCHCODE and CONVERT(date,OrderDate, 101) = @ORDERDATE)

	-- ITEM CODE
	DECLARE @ITEMCODEFRESH nvarchar(6) = 'ITM001'
	DECLARE @ITEMCODEFROZEN nvarchar(6) = 'ITM002'
	DECLARE @ITEMCODELIEMPO nvarchar(6) = 'ITM003'
	DECLARE @ITEMCODELEEG nvarchar(6) = 'ITM004'
	DECLARE @ITEMCODEATSARA100 nvarchar(6) = 'ITM005'
	DECLARE @ITEMCODEATSARA160 nvarchar(6) = 'ITM006'


	--RUNNING STOCK 
	DECLARE @CURRENT_STOCK float
	DECLARE @BALANCE_STOCK float


	UPDATE [Trans].[Delivery_Reciept_TF]
	SET ISCANCEL=1, OrderDate = cONVERT(DATE, '01-01-2000', 101), remarks=@REMARKS + 'Cancelled--XXX', DU=GETDATE(), UserCode=@USERCODE
	WHERE
	BranchCode=@BRANCHCODE and CONVERT(date,OrderDate, 101) = @ORDERDATE


--INSERT ALSO THE TRANSACTION ITEM ON INVENTORY TRANSACTION FILES
	IF @CONVERTEDFRESHQTY <> 0 
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES('Cancelled-' + @DRNUM,'ITM001',@CONVERTEDFRESHQTY,1,GETDATE(),@USERCODE)

	SET @CURRENT_STOCK = (Select RunningStock FROM 
						[Master].[Inventory_Data]
						WHERE ItemCode='ITM001')

	SET @BALANCE_STOCK = @CURRENT_STOCK + @CONVERTEDFRESHQTY

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Running_Stock, In_Stock, Balance_Stock, Reference, IsCancel)
	VALUES
	('ITM001',@CURRENT_STOCK,@CONVERTEDFRESHQTY,@BALANCE_STOCK, @DRNUM, 1)

	-- FOR ENDING BALANCE
	IF NOT EXISTS(Select ItemCode FROM [Trans].[Inventory_Ending_Stock_TF] WHERE Itemcode=@ITEMCODEFRESH and EndDate = CONVERT(date,getdate(), 101))
			BEGIN 
			INSERT INTO [Trans].[Inventory_Ending_Stock_TF] 
			(ItemCode, EndQuantity, EndDate)
			VALUES
			(@ITEMCODEFRESH,@BALANCE_STOCK,GETDATE())
			END	
	ELSE
			BEGIN
			UPDATE [Trans].[Inventory_Ending_Stock_TF]
			SET EndQuantity=@BALANCE_STOCK
			WHERE ItemCode=@ITEMCODEFRESH and EndDate=CONVERT(date,getdate(), 101)
			END

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET InStock = InStock + @CONVERTEDFRESHQTY,
		RunningStock = RunningStock + @CONVERTEDFRESHQTY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODEFRESH

	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @CONVERTEDFRESHQTY,
		CurrentStock = CurrentStock + @CONVERTEDFRESHQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODEFRESH
	END

	IF @CONVERTEDFROZENQTY <> 0 
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES('Cancelled-' + @DRNUM,@ITEMCODEFROZEN,@CONVERTEDFROZENQTY,1,GETDATE(),@USERCODE)
	
	SET @CURRENT_STOCK = (Select RunningStock FROM 
						[Master].[Inventory_Data]
						WHERE ItemCode=@ITEMCODEFROZEN)

	SET @BALANCE_STOCK = @CURRENT_STOCK + @CONVERTEDFROZENQTY

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Running_Stock, In_Stock, Balance_Stock, Reference, IsCancel)
	VALUES
	(@ITEMCODEFROZEN,@CURRENT_STOCK,@CONVERTEDFROZENQTY,@BALANCE_STOCK, @DRNUM, 1)
	
	-- ******************************
	-- FOR ENDING BALANCE
	IF NOT EXISTS(Select ItemCode FROM [Trans].[Inventory_Ending_Stock_TF] WHERE Itemcode=@ITEMCODEFROZEN and EndDate = CONVERT(date,getdate(), 101))
			BEGIN 
			INSERT INTO [Trans].[Inventory_Ending_Stock_TF] 
			(ItemCode, EndQuantity, EndDate)
			VALUES
			(@ITEMCODEFROZEN,@BALANCE_STOCK,GETDATE())
			END	
	ELSE
			BEGIN
			UPDATE [Trans].[Inventory_Ending_Stock_TF]
			SET EndQuantity=@BALANCE_STOCK
			WHERE ItemCode=@ITEMCODEFROZEN and EndDate=CONVERT(date,getdate(), 101)
			END
	--******************

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET InStock = InStock + @CONVERTEDFROZENQTY,
		RunningStock = RunningStock + @CONVERTEDFROZENQTY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODEFROZEN

	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @CONVERTEDFROZENQTY,
		CurrentStock = CurrentStock + @CONVERTEDFROZENQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODEFROZEN
	END


	--LIEMPO
	IF @CONVERTEDLIEMPO <> 0 
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES('Cancelled-' + @DRNUM,@ITEMCODELIEMPO,@CONVERTEDLIEMPO,1,GETDATE(),@USERCODE)

	SET @CURRENT_STOCK = (Select RunningStock FROM 
						[Master].[Inventory_Data]
						WHERE ItemCode=@ITEMCODELIEMPO)

	SET @BALANCE_STOCK = @CURRENT_STOCK + @CONVERTEDLIEMPO

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Running_Stock, In_Stock, Balance_Stock, Reference, IsCancel)
	VALUES
	(@ITEMCODELIEMPO,@CURRENT_STOCK,@CONVERTEDLIEMPO,@BALANCE_STOCK, @DRNUM, 1)

	-- ******************************
	-- FOR ENDING BALANCE
	IF NOT EXISTS(Select ItemCode FROM [Trans].[Inventory_Ending_Stock_TF] WHERE Itemcode=@ITEMCODELIEMPO and EndDate = CONVERT(date,getdate(), 101))
			BEGIN 
			INSERT INTO [Trans].[Inventory_Ending_Stock_TF] 
			(ItemCode, EndQuantity, EndDate)
			VALUES
			(@ITEMCODELIEMPO,@BALANCE_STOCK,GETDATE())
			END	
	ELSE
			BEGIN
			UPDATE [Trans].[Inventory_Ending_Stock_TF]
			SET EndQuantity=@BALANCE_STOCK
			WHERE ItemCode=@ITEMCODELIEMPO and EndDate=CONVERT(date,getdate(), 101)
			END
	--******************

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET InStock = InStock + @CONVERTEDLIEMPO,
		RunningStock = RunningStock + @CONVERTEDLIEMPO,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODELIEMPO

	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @CONVERTEDLIEMPO,
		CurrentStock = CurrentStock + @CONVERTEDLIEMPO,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODELIEMPO
	END
	
	--LEEG
	IF @CONVERTEDLEEG <> 0 
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES('Cancelled-' + @DRNUM,@ITEMCODELEEG,@CONVERTEDLEEG,1,GETDATE(),@USERCODE)

	SET @CURRENT_STOCK = (Select RunningStock FROM 
						[Master].[Inventory_Data]
						WHERE ItemCode=@ITEMCODELEEG)

	SET @BALANCE_STOCK = @CURRENT_STOCK + @CONVERTEDLEEG

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Running_Stock, In_Stock, Balance_Stock, Reference, IsCancel)
	VALUES
	(@ITEMCODELEEG,@CURRENT_STOCK,@CONVERTEDLEEG,@BALANCE_STOCK, @DRNUM, 1)

	-- ******************************
	-- FOR ENDING BALANCE
	IF NOT EXISTS(Select ItemCode FROM [Trans].[Inventory_Ending_Stock_TF] WHERE Itemcode=@ITEMCODELEEG and EndDate = CONVERT(date,getdate(), 101))
			BEGIN 
			INSERT INTO [Trans].[Inventory_Ending_Stock_TF] 
			(ItemCode, EndQuantity, EndDate)
			VALUES
			(@ITEMCODELEEG,@BALANCE_STOCK,GETDATE())
			END	
	ELSE
			BEGIN
			UPDATE [Trans].[Inventory_Ending_Stock_TF]
			SET EndQuantity=@BALANCE_STOCK
			WHERE ItemCode=@ITEMCODELEEG and EndDate=CONVERT(date,getdate(), 101)
			END
	--******************

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET InStock = InStock + @CONVERTEDLEEG,
		RunningStock = RunningStock + @CONVERTEDLEEG,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODELEEG

	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @CONVERTEDLEEG,
		CurrentStock = CurrentStock + @CONVERTEDLEEG,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODELEEG
	END

	--ATSARA 100
	IF @CONVERTEDATSARA100 <> 0 
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES('Cancelled-' + @DRNUM, @ITEMCODEATSARA100,@CONVERTEDATSARA100,1,GETDATE(),@USERCODE)

	SET @CURRENT_STOCK = (Select RunningStock FROM 
						[Master].[Inventory_Data]
						WHERE ItemCode=@ITEMCODEATSARA100)

	SET @BALANCE_STOCK = @CURRENT_STOCK + @CONVERTEDATSARA100

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Running_Stock, In_Stock, Balance_Stock, Reference, IsCancel)
	VALUES
	(@ITEMCODEATSARA100,@CURRENT_STOCK,@CONVERTEDATSARA100,@BALANCE_STOCK, @DRNUM, 1)

	-- ******************************
	-- FOR ENDING BALANCE
	IF NOT EXISTS(Select ItemCode FROM [Trans].[Inventory_Ending_Stock_TF] WHERE Itemcode=@ITEMCODEATSARA100 and EndDate = CONVERT(date,getdate(), 101))
			BEGIN 
			INSERT INTO [Trans].[Inventory_Ending_Stock_TF] 
			(ItemCode, EndQuantity, EndDate)
			VALUES
			(@ITEMCODEATSARA100,@BALANCE_STOCK,GETDATE())
			END	
	ELSE
			BEGIN
			UPDATE [Trans].[Inventory_Ending_Stock_TF]
			SET EndQuantity=@BALANCE_STOCK
			WHERE ItemCode=@ITEMCODEATSARA100 and EndDate=CONVERT(date,getdate(), 101)
			END
	--******************

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET InStock = InStock + @CONVERTEDATSARA100,
		RunningStock = RunningStock + @CONVERTEDATSARA100,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODEATSARA100

	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @CONVERTEDATSARA100,
		CurrentStock = CurrentStock + @CONVERTEDATSARA100,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODEATSARA100
	END	

	--ATSARA 160
	IF @CONVERTEDATSARA160 <> 0 
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES('Cancelled-' + @DRNUM,@ITEMCODEATSARA160,@CONVERTEDATSARA160,1,GETDATE(),@USERCODE)

	SET @CURRENT_STOCK = (Select RunningStock FROM 
						[Master].[Inventory_Data]
						WHERE ItemCode=@ITEMCODEATSARA160)

	SET @BALANCE_STOCK = @CURRENT_STOCK + @CONVERTEDATSARA160

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Running_Stock, In_Stock, Balance_Stock, Reference, IsCancel)
	VALUES
	(@ITEMCODEATSARA160,@CURRENT_STOCK,@CONVERTEDATSARA160,@BALANCE_STOCK, @DRNUM, 1)

	-- ******************************
	-- FOR ENDING BALANCE
	IF NOT EXISTS(Select ItemCode FROM [Trans].[Inventory_Ending_Stock_TF] WHERE Itemcode=@ITEMCODEATSARA160 and EndDate = CONVERT(date,getdate(), 101))
			BEGIN 
			INSERT INTO [Trans].[Inventory_Ending_Stock_TF] 
			(ItemCode, EndQuantity, EndDate)
			VALUES
			(@ITEMCODEATSARA160,@BALANCE_STOCK,GETDATE())
			END	
	ELSE
			BEGIN
			UPDATE [Trans].[Inventory_Ending_Stock_TF]
			SET EndQuantity=@BALANCE_STOCK
			WHERE ItemCode=@ITEMCODEATSARA160 and EndDate=CONVERT(date,getdate(), 101)
			END
	--******************

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET InStock = InStock + @CONVERTEDATSARA160,
		RunningStock = RunningStock + @CONVERTEDATSARA160,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODEATSARA160

	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @CONVERTEDATSARA160,
		CurrentStock = CurrentStock + @CONVERTEDATSARA160,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODEATSARA160
	END	
	
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END


GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_SCHEDULE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Delivery Schedule
11/20//2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_SCHEDULE]
@DRNUM nvarchar(10),
@DELIVERYDATE datetime
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	
	UPDATE [Trans].[Delivery_Schedule_TF]
	SET DeliveryDate = @DELIVERYDATE, IsSet = 1,DU=GETDATE()
	WHERE DRNum = @DRNUM


	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_SCHEDULE_CLOSE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Update Delivery Schedule Batch to close
11/21/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_SCHEDULE_CLOSE]
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	UPDATE [Trans].[Delivery_Schedule_TF]
	SET IsSched = 1
	WHERE Convert(date,DeliveryDate, 101) < Convert(date, getdate(), 101)
	AND IsPostpone = 0

	UPDATE  A
	SET A.IsDelivered = 1
	FROM [Trans].[Delivery_TF] A
	INNER JOIN [Trans].[Delivery_Schedule_TF] B
	ON A.DRNUM = B.DRNUM
	WHERE B.ISSCHED = 1

	
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_SCHEDULE_TODAY]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Delivery Schedule
11/20//2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_SCHEDULE_TODAY]
@DRNUM nvarchar(10),
@DELIVERYDATE datetime
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	IF EXISTS (SELECT * FROM [Trans].[Delivery_Schedule_TF]
			   WHERE DRNum=@DRNUM AND DeliveryDate IS NULL)
	UPDATE [Trans].[Delivery_Schedule_TF]
	SET DeliveryDate = @DELIVERYDATE, IsSet=1
	WHERE DRNum = @DRNUM

	UPDATE [Trans].[Delivery_TF]
	SET IsDelivered = 1
	WHERE DRNum = @DRNUM

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_STATUS]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Delivery Receipt Transaction Per Line Item 
11/19//2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_STATUS]
@ID int
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	--IF DATE GENERATION EXIST DONT RUN BATCH UPDATE
	IF NOT EXISTS(SELECT * FROM [xSystem].[Delivery_Date_Generate] 
	WHERE CONVERT(Date,DateDeliveryListGenerate, 101) = CONVERT(Date,getDate(), 101))
	BEGIN
	UPDATE [Trans].[Delivery_Status_TF]
	SET ISSET = 1, ISCANCEL = 0, DeliveryDateToday = getdate()
	WHERE id=@ID
	
	    --SAVE SINGLE DATE GENERATED
		IF NOT EXISTS 
		(SELECT * FROM [xSystem].[Delivery_Date_Generate] 
		WHERE CONVERT(Date,DateDeliveryListGenerate, 101) = CONVERT(Date,getDate(), 101))
		BEGIN
			INSERT INTO  [xSystem].[Delivery_Date_Generate]
				(DateDeliveryListGenerate)
				VALUES
				(getdate())
		END
	
	END

	
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_STATUS_ADD]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE DELIVERY RESCHED
11/20/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_STATUS_ADD]
@DRNUM nvarchar(10),
@REMARKS nvarchar(250),
@DELIVERYDATE datetime
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	UPDATE [Trans].[Delivery_Schedule_TF]
	SET IsSched = 0, IsPostPone = 0, IsAdd = 1, DeliveryDate = @DELIVERYDATE, Remarks=@REMARKS,
	DU=GETDATE()
	WHERE DRNum = @DRNUM

		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_STATUS_CANCEL]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE Delivery Cancel Status
11/22/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_STATUS_CANCEL] 
@DRNUM nvarchar(10),
@REMARKS nvarchar(150)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	UPDATE [Trans].[Delivery_Schedule_TF]
	SET IsSched = 0, IsPostPone = 1, IsAdd = 0, DeliveryDate = NULL, Remarks=@REMARKS, DU=GETDATE()
	WHERE DRNum = @DRNUM

		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
/****** Object:  StoredProcedure [Trans].[UPDATE_STOCK_INVENTORY_FROM_PARTNER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* UPDATE STOCK ITEM IN INVENTORY FROM SUPPLIER 
10/26/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_STOCK_INVENTORY_FROM_PARTNER]
@ITEMCODE nvarchar(10),
@QTY float
AS
BEGIN

UPDATE master.Inventory_Data
SET OutStock = OutStock + @QTY, RunningStock = RunningStock - @QTY, dateUpdate=GETDATE()
WHERE ItemCode=@ITEMCODE

END

GO
/****** Object:  StoredProcedure [Trans].[UPDATE_STOCK_INVENTORY_FROM_SUPPLIER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE STOCK ITEM IN INVENTORY FROM SUPPLIER 
10/26/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_STOCK_INVENTORY_FROM_SUPPLIER]
@ITEMCODE nvarchar(10),
@QTY float
AS
BEGIN

UPDATE MASTER.Inventory_Data
SET InStock = InStock + @QTY, 
RunningStock = RunningStock + @QTY, dateUpdate=GETDATE()
WHERE ItemCode=@ITEMCODE

END

GO
/****** Object:  StoredProcedure [Trans].[UPDATE_SUPPLIER_PO_HDR_STATUS]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* UPDATE PO STATUS 
10/26/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_SUPPLIER_PO_HDR_STATUS]
@PONUM NVARCHAR(10),
@DOCSTATUS nvarchar(1)
AS
BEGIN

UPDATE [Trans].[Supplier_PO_Hdr]
SET DocStatus = @DOCSTATUS
WHERE PONum=@PONUM

END

GO
/****** Object:  StoredProcedure [Utility].[GET_ADJUSTMENT_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/19/2017>
-- Description:	<GET LIST OF ADJUSTMENT>
-- =============================================
CREATE PROCEDURE [Utility].[GET_ADJUSTMENT_LIST]
AS
BEGIN
	SELECT *
	FROM Utility.Adjustment_RF
	ORDER BY Arrangement
	
END


GO
/****** Object:  StoredProcedure [Utility].[GET_BRANCH_SCHEDULE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/13/2017>
-- Description:	<GET LIST OF BRANCH SCHEDULE>
-- =============================================
CREATE PROCEDURE [Utility].[GET_BRANCH_SCHEDULE] 
AS
BEGIN
	SELECT *
	FROM 
	[Master].[Branch_Data] A
	INNER JOIN
	[Utility].[Delivery_Schedule_RF] B
	ON
	A.BranchCode = B.BranchCode
	ORDER BY A.BranchName ASC
END


GO
/****** Object:  StoredProcedure [Utility].[GET_ITEM_SUBCAT_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/03/2017>
-- Description:	<GET LIST OF SUB ITEM>
-- =============================================
CREATE PROCEDURE [Utility].[GET_ITEM_SUBCAT_LIST] 
AS
BEGIN
	
	SELECT *
	FROM [Utility].[Item_SubCat_RF]
	
END


GO
/****** Object:  StoredProcedure [Utility].[GET_LOCATION_AREA_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/03/2017>
-- Description:	<GET LIST OF LOCATION AREA>
-- =============================================
CREATE PROCEDURE [Utility].[GET_LOCATION_AREA_LIST] 
AS
BEGIN
	SELECT *
	FROM [Utility].[Location_Area_RF]
	ORDER by LAName ASC
	
END


GO
/****** Object:  StoredProcedure [Utility].[GET_PARTNER_PRICE_FINAL]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Update date: <01/23/2018>
-- Description:	<GET PARTNER PRICE LIST>
-- =============================================
CREATE PROCEDURE [Utility].[GET_PARTNER_PRICE_FINAL] 
AS
BEGIN
	SELECT *, D.PriceAmount as LiempoPrice, E.PriceAmount as LeegPrice, F.PriceAmount as AtsaraPrice
	FROM [Master].[Partners_Data] A
	INNER JOIN [Utility].[Price_RF] B 
	ON A.PriceCode = B.PriceCode
	INNER JOIN [master].[Branch_Data] C 
	ON A.PartnerCode = C.PartnerCode
	LEFT JOIN [Utility].[Price_RF] D
	ON A.Liempo_PriceCode = D.PriceCode
	LEFT JOIN [Utility].[Price_RF] E
	ON A.Leeg_PriceCode = E.PriceCode
	LEFT JOIN [Utility].[Price_RF] F
	ON A.Atsara_PriceCode = F.PriceCode
	
END


GO
/****** Object:  StoredProcedure [Utility].[GET_PARTNER_PRICE_SETUP]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Description:	<GET PARTNER PRICE LIST>
-- =============================================
CREATE PROCEDURE [Utility].[GET_PARTNER_PRICE_SETUP] 
AS
BEGIN
	SELECT *
	FROM [Utility].[Partner_Price_RF] A
	INNER JOIN [Master].[Partners_Data] B
	ON A.PartnerCode = B.PartnerCode
	INNER JOIN [Master].[Item_Data] C
	ON A.ItemCode = C.ItemCode
	INNER JOIN [Utility].[Price_RF] D
	ON A.PriceCode = D.PriceCode
	
END


GO
/****** Object:  StoredProcedure [Utility].[GET_PRICE_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/03/2017>
-- Description:	<GET LIST OF SELLING PRICE>
-- =============================================
CREATE PROCEDURE [Utility].[GET_PRICE_LIST] 
AS
BEGIN
	SELECT *
	FROM Utility.PRICE_RF
	ORDER by PriceAmount DESC
	
END


GO
/****** Object:  StoredProcedure [Utility].[GET_STORAGE_AREA_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/13/2017>
-- Description:	<GET LIST OF STORAGE AREA>
-- =============================================
CREATE PROCEDURE [Utility].[GET_STORAGE_AREA_LIST] 
AS
BEGIN
	
	SELECT *
	FROM [Utility].[Storage_RF]
	ORDER by StorageName ASC
	
END


GO
/****** Object:  StoredProcedure [Utility].[GET_SUPPLIER_PRICE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/04/2017>
-- Description:	<GET SUPPLIER ITEM PRICE>
-- =============================================
CREATE PROCEDURE [Utility].[GET_SUPPLIER_PRICE] 
AS
BEGIN
	SELECT *, (X.ItemName + ' - ' + C.ItemSubName) as Chicken_Desc
	FROM master.Supplier_Data A
	INNER JOIN
	Utility.Supplier_Price_RF B
	ON A.SupplierCode = B.SupplierCode
	INNER JOIN Utility.Item_SubCat_RF C
	ON B.ItemSubCatID = C.ItemSubCatID
	INNER JOIN master.Item_Data X
	ON C.ItemCode = X.ItemCode
	INNER JOIN Utility.Price_RF D
	ON B.PriceCode = D.PriceCode

	
END


GO
/****** Object:  StoredProcedure [Utility].[GET_SUPPLIER_PRICE_SETUP]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/30/2017>
-- Description:	<GET SUPPLIER PRICE>
-- =============================================
CREATE PROCEDURE [Utility].[GET_SUPPLIER_PRICE_SETUP] 
AS
BEGIN
	
	SELECT * 
	FROM [Utility].[Supplier_Price_RF] A
	INNER JOIN [Master].[Supplier_Data] B
	ON A.SupplierCode = B.SupplierCode
	INNER JOIN [Utility].Price_RF C
	ON A.PriceCode = C.PriceCode

END


GO
/****** Object:  StoredProcedure [Utility].[GET_UOM_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<GET LIST OF UOM>
-- =============================================
CREATE PROCEDURE [Utility].[GET_UOM_LIST] 
AS
BEGIN
	SELECT *
	FROM Utility.UOM_RF
	ORDER by UOMID ASC
	
END


GO
/****** Object:  StoredProcedure [Utility].[INSERT_LOCATION_AREA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/05/2017>
-- Description:	<INSERT LOCATION AREA>
-- =============================================
CREATE PROCEDURE [Utility].[INSERT_LOCATION_AREA] 
@LACODE nvarchar(6),
@LANAME nvarchar(150),
@USERCODE nvarchar(50)
AS
BEGIN
	INSERT INTO Utility.Location_Area_RF
	(LACode,LAName,UserCode)
	VALUES
	(@LACODE,@LANAME,@USERCODE)
END


GO
/****** Object:  StoredProcedure [Utility].[INSERT_PARTNER_PRICE_SETUP]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Description:	<INSERT PARTNER PRICE LIST>
-- =============================================
CREATE PROCEDURE [Utility].[INSERT_PARTNER_PRICE_SETUP] 
@PARTNERCODE nvarchar(6),
@ITEMCODE nvarchar(6),
@PRICECODE nvarchar(6),
@DESCRIPTION nvarchar(150),
@USERCODE nvarchar(50)

AS
BEGIN
	INSERT INTO [Utility].[Partner_Price_RF]
	(PartnerCode,ItemCode,PriceCode,Description,UserCode)
	VALUES
	(@PARTNERCODE,@ITEMCODE,@PRICECODE,@DESCRIPTION,@USERCODE)
END


GO
/****** Object:  StoredProcedure [Utility].[INSERT_PRICE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Description:	<INSERT SELLING PRICE>
-- =============================================
CREATE PROCEDURE [Utility].[INSERT_PRICE] 
@PRICECODE nvarchar(6),
@PRICEAMOUNT float,
@PRICEDESCRIPTION nvarchar(150),
@USERCODE nvarchar(50)
AS
BEGIN
	INSERT INTO Utility.PRICE_RF
	(PriceCode,PriceAmount,PriceDescription,UserCode)
	VALUES
	(@PRICECODE,@PRICEAMOUNT,@PRICEDESCRIPTION,@USERCODE)
END


GO
/****** Object:  StoredProcedure [Utility].[INSERT_STORAGE_AREA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/07/2017>
-- Description:	<INSERT STORAGE AREA>
-- =============================================
CREATE PROCEDURE [Utility].[INSERT_STORAGE_AREA] 
@STORAGECODE nvarchar(6),
@STORAGENAME nvarchar(150),
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN
	INSERT INTO Utility.Storage_RF
	(StorageCode, StorageName, Remarks,UserCode)
	VALUES
	(@STORAGECODE,@STORAGENAME,@REMARKS,@USERCODE)
END


GO
/****** Object:  StoredProcedure [Utility].[INSERT_SUPPLIER_PRICE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/30/2017>
-- Description:	<INSERT PURCHASING PRICE>
-- =============================================
CREATE PROCEDURE [Utility].[INSERT_SUPPLIER_PRICE] 
@SUPPLIERCODE nvarchar(6),
@ITEMSUBCATID int,
@PRICECODE nvarchar(6)
AS
BEGIN
	INSERT INTO Utility.INSERT_SUPPLIER_PRICE
	(SupplieCode, ItemSubCatID,PriceCode)
	VALUES
	(@SUPPLIERCODE,@ITEMSUBCATID,@PRICECODE)
END


GO
/****** Object:  StoredProcedure [Utility].[spGET_DRIVER_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/21/2018>
-- Description:	<GET LIST OF DRIVER>
-- =============================================
CREATE PROCEDURE [Utility].[spGET_DRIVER_LIST] 
AS
BEGIN
	SELECT *
	FROM Utility.Driver_RF
	ORDER by DriverName DESC
	
END


GO
/****** Object:  StoredProcedure [Utility].[spGET_HELPER_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/21/2018>
-- Description:	<GET LIST OF HELPER>
-- =============================================
CREATE PROCEDURE [Utility].[spGET_HELPER_LIST] 
AS
BEGIN
	SELECT *
	FROM Utility.Helper_RF
	ORDER by HelperName DESC
	
END


GO
/****** Object:  StoredProcedure [Utility].[spGET_VEHICLE_LIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/21/2018>
-- Revised <02/23/2018>
-- Description:	<GET LIST OF VEHICLE>
-- =============================================
CREATE PROCEDURE [Utility].[spGET_VEHICLE_LIST] 
AS
BEGIN

	SELECT *, (PlateNumber + ' **LoadCap(' + Convert(nvarchar(25),LoadCapacity)  + ')') as Plate_CapLoad
	FROM [Utility].[Vehicle_RF]
	ORDER by PlateNumber ASC
	
END


GO
/****** Object:  StoredProcedure [Utility].[spUPDATE_DRIVER_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/21/2018>
-- Description:	<UPDATE DRIVER DATA>
-- =============================================
CREATE PROCEDURE [Utility].[spUPDATE_DRIVER_DATA]
@DRIVERID int, 
@DRIVERNAME nvarchar(100),
@LICENSENUMBER nvarchar(50),
@STATUS bit
AS
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
	--IDENTIFY ACTION 
	--INSERT TO DELIVERY INFO
	IF NOT EXISTS(SELECT * FROM Utility.Driver_RF WHERE DriverID=@DRIVERID)
		BEGIN
			INSERT INTO Utility.Driver_RF(DriverName, LicenseNumber, Status)
			VALUES (UPPER(@DRIVERNAME), UPPER(@LICENSENUMBER), @STATUS)
		END
	ELSE
	--UPDATE DELIVERY
		BEGIN
			UPDATE Utility.Driver_RF
			SET DriverName=UPPER(@DRIVERNAME), LicenseNumber=UPPER(@LICENSENUMBER), Status=@STATUS
			WHERE DriverID=@DRIVERID
		END

	COMMIT TRANSACTION
	END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH
END


GO
/****** Object:  StoredProcedure [Utility].[spUPDATE_HELPER_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/21/2018>
-- Description:	<UPDATE HELPER DATA>
-- =============================================
CREATE PROCEDURE [Utility].[spUPDATE_HELPER_DATA]
@HELPERID int, 
@HELPERNAME nvarchar(100),
@STATUS bit
AS
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
	--IDENTIFY ACTION 
	--INSERT TO DELIVERY INFO
	IF NOT EXISTS(SELECT * FROM Utility.Helper_RF WHERE HelperID=@HELPERID)
		BEGIN
			INSERT INTO Utility.Helper_RF(HelperName, Status)
			VALUES (UPPER(@HELPERNAME), @STATUS)
		END
	ELSE
	--UPDATE DELIVERY
		BEGIN
			UPDATE Utility.Helper_RF
			SET HelperName=UPPER(@HELPERNAME), Status=@STATUS
			WHERE HelperID=@HELPERID
		END

	COMMIT TRANSACTION
	END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH
END


GO
/****** Object:  StoredProcedure [Utility].[spUPDATE_VEHICLE_DATA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/21/2018>
-- Description:	<UPDATE VEHICLE DATA>
-- =============================================
CREATE PROCEDURE [Utility].[spUPDATE_VEHICLE_DATA]
@PLATEID int, 
@PLATENUMBER nvarchar(20),
@VEHICLEDESCRIPTION nvarchar(100),
@LOADCAPACITY int
AS
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
	--IDENTIFY ACTION 
	--INSERT TO DELIVERY INFO
	IF NOT EXISTS(SELECT * FROM [Utility].[Vehicle_RF] WHERE PlateID = @PLATEID)
		BEGIN
			INSERT INTO [Utility].[Vehicle_RF](PlateNumber, VehicleDescription, LoadCapacity)
			VALUES (UPPER(@PLATENUMBER), UPPER(@VEHICLEDESCRIPTION), @LOADCAPACITY)
		END
	ELSE
	--UPDATE DELIVERY
		BEGIN
			UPDATE [Utility].[Vehicle_RF]
			SET PlateNumber=UPPER(@PLATENUMBER), VehicleDescription=UPPER(@VEHICLEDESCRIPTION), LoadCapacity=@LOADCAPACITY
			WHERE PlateID=@PLATEID
		END

	COMMIT TRANSACTION
	END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH
END


GO
/****** Object:  StoredProcedure [Utility].[UPDATE_BRANCH_SCHEDULE_SETUP]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/13/2017>
-- Description:	<UPDATE SCHEDULE>
-- =============================================
CREATE PROCEDURE [Utility].[UPDATE_BRANCH_SCHEDULE_SETUP] 
@SCHEDID int,
@M bit,
@T bit,
@W bit,
@TH bit,
@F bit,
@SA bit,
@S bit,
@USERCODE nvarchar(50)
AS
BEGIN
	 UPDATE [Utility].[Delivery_Schedule_RF]
	 SET
	 M=@M,
	 T=@T,
	 W=@W,
	 Th=@TH,
	 F=@F,
	 Sa=@SA,
	 S=@S,
	 DU= getdate(),
	 UserCode = @USERCODE
	WHERE
	SchedID = @SCHEDID
END


GO
/****** Object:  StoredProcedure [Utility].[UPDATE_LOCATION_AREA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Description:	<UPDATE LOCATION AREA>
-- =============================================
CREATE PROCEDURE [Utility].[UPDATE_LOCATION_AREA] 
@LACODE nvarchar(6),
@LANAME nvarchar(150),
@USERCODE nvarchar(50)
AS
BEGIN
	 UPDATE Utility.Location_Area_RF
	 SET
	 LAName=@LANAME, UserCode=@USERCODE
	WHERE
	LACode=@LACODE
END


GO
/****** Object:  StoredProcedure [Utility].[UPDATE_PARTNER_PRICE_SETUP]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Description:	<UPDATE PARTNER PRICE LIST>
-- =============================================
CREATE PROCEDURE [Utility].[UPDATE_PARTNER_PRICE_SETUP] 
@ID int,
@PRICECODE nvarchar(6),
@DESCRIPTION nvarchar(150),
@USERCODE nvarchar(50)

AS
BEGIN
	UPDATE 
	[Utility].[Partner_Price_RF]
	SET
	PriceCode=@PRICECODE,
	Description=@DESCRIPTION,
	UserCode=@USERCODE
	
	WHERE
	PPID=@ID
END


GO
/****** Object:  StoredProcedure [Utility].[UPDATE_PRICE]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Description:	<INSERT SELLING PRICE>
-- =============================================
CREATE PROCEDURE [Utility].[UPDATE_PRICE] 
@PRICECODE nvarchar(6),
@PRICEAMOUNT float,
@PRICEDESCRIPTION nvarchar(150),
@USERCODE nvarchar(50)
AS
BEGIN
	 UPDATE Utility.PRICE_RF
	 SET
	 PriceAmount=@PRICEAMOUNT,PriceDescription=@PRICEDESCRIPTION, UserCode=@USERCODE
	WHERE
	PriceCode= @PRICECODE
END


GO
/****** Object:  StoredProcedure [Utility].[UPDATE_STORAGE_AREA]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/13/2017>
-- Description:	<UPDATE STORAGE AREA>
-- =============================================
CREATE PROCEDURE [Utility].[UPDATE_STORAGE_AREA] 
@STORAGECODE nvarchar(6),
@STORAGENAME nvarchar(150),
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN
	UPDATE Utility.Storage_RF
	SET 
	StorageName = @STORAGENAME,
	Remarks = @REMARKS,
	DU = getdate(),
	UserCode = @USERCODE
	WHERE
	StorageCode = @STORAGECODE
END


GO
/****** Object:  StoredProcedure [xSystem].[CHECK_DELIVERY_DATE_EXIST]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/21/2017>
-- Description:	<CHECK DELIVERY DATE EXIST ON THE LIST>
-- =============================================
CREATE PROCEDURE [xSystem].[CHECK_DELIVERY_DATE_EXIST]
@DATE datetime 
AS
BEGIN
	SELECT *
	FROM [xSystem].[Delivery_Date_RF]
	WHERE CONVERT(date,datedeliverylist) = Convert(date,@DATE)
END


GO
/****** Object:  StoredProcedure [xSystem].[GET_MENU]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <08/31/2017>
-- Description:	<GET LIST OF MENU ITEM>
-- =============================================
CREATE PROCEDURE [xSystem].[GET_MENU] 
AS
BEGIN
	SELECT * FROM
	xSystem.Menu_MF
END


GO
/****** Object:  StoredProcedure [xSystem].[GET_SERIES_NUMBER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* GET SERIES NUMBER 
10/25/2017
Russel Vasquez
*/

CREATE PROC [xSystem].[GET_SERIES_NUMBER]
@PREFIXCODE nvarchar(5)
AS
BEGIN

SELECT *
FROM [xSystem].[SeriesNumber_RF]
WHERE PrefixCode = @PREFIXCODE

END

GO
/****** Object:  StoredProcedure [xSystem].[GET_SERVER_DATE_TIME]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/3/2017>
-- Description:	<GET SERVER DATE AND TIME>
-- =============================================
CREATE PROCEDURE [xSystem].[GET_SERVER_DATE_TIME] 
AS
BEGIN
	SELECT GETDATE() as SERVER_DATE_TIME

END



GO
/****** Object:  StoredProcedure [xSystem].[PRE_INSERT_ENDING_STOCK]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--System Execution
--Russel Vasquez
--This function will insert all item ending stock from previous date


CREATE PROC [xSystem].[PRE_INSERT_ENDING_STOCK]
AS

BEGIN

DECLARE @COUNTER int = 0
DECLARE @ROWCOUNT int = (SELECT COUNT(*) FROM Master.Item_Data)
DECLARE @SUB_ITEMCODE nvarchar(6) = 'ITM00'
DECLARE @ITEMCODE NVARCHAR(6)
DECLARE @CURRENTQUANTITY int

IF NOT EXISTS (SELECT EndDate from Trans.Inventory_Ending_Stock_TF where endDate=CONVERT(date,getdate(), 101))
	BEGIN
	WHILE @COUNTER < @ROWCOUNT
		BEGIN
		SET @COUNTER = @COUNTER + 1
	
		SET @ITEMCODE = @SUB_ITEMCODE + CONVERT(NVARCHAR(2), @COUNTER)
		
		--[1] GET THE CURRENT PREVIOUS DATE IN INVENTORY ENDING TABLE
		DECLARE @LASTDATE DateTime = (Select TOP 1 EndDate FROM Trans.Inventory_Ending_Stock_TF WHERE ItemCode=@ITEMCODE Order By EndDate Desc)

--		SET @CURRENTQUANTITY = (Select EndQuantity FROM Trans.Inventory_Ending_Stock_TF where ItemCode=@ITEMCODE and endDate= dateadd(day,datediff(day,1,@LASTDATE),0))
		
		--[2] GET THE QUANTIY OF @LASTDATE QUERY
		SET @CURRENTQUANTITY = (Select EndQuantity FROM Trans.Inventory_Ending_Stock_TF where ItemCode=@ITEMCODE and endDate= @LASTDATE)

		--[3] INSERT THE QUANTITY AND DATE IT AS CURRENT, WHICH WILL SERVE AS OPENING STOCK
		INSERT INTO Trans.Inventory_Ending_Stock_TF
		(ItemCode,EndQuantity, EndDate)
		VALUES 
		(@ITEMCODE, @CURRENTQUANTITY,GETDATE())
		END
	END
	
END	 
GO
/****** Object:  StoredProcedure [xSystem].[spVALIDATE_USER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/15/2018>
-- Description:	<VALIDATE USER>
-- =============================================
CREATE PROCEDURE [xSystem].[spVALIDATE_USER]
@USERCODE nvarchar(25),
@PASSWORD nvarchar(25) 
AS
BEGIN
	SELECT * FROM
	xSystem.User_MF
	WHERE UserCode=@USERCODE and Password=@PASSWORD
END


GO
/****** Object:  StoredProcedure [xSystem].[UPDATE_SERIES_NUMBER]    Script Date: 5/2/2018 9:07:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE SERIES NUMBER 
10/25/2017
Russel Vasquez
*/

CREATE PROC [xSystem].[UPDATE_SERIES_NUMBER]
@PREFIXCODE nvarchar(5)
AS
BEGIN

UPDATE [xSystem].SeriesNumber_RF
SET Series = Series + 1
WHERE PrefixCode=@PREFIXCODE

END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Auto Generated by the System' , @level0type=N'SCHEMA',@level0name=N'HR', @level1type=N'TABLE',@level1name=N'Employee_MD', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location Area Code' , @level0type=N'SCHEMA',@level0name=N'Master', @level1type=N'TABLE',@level1name=N'Branch_Data', @level2type=N'CONSTRAINT',@level2name=N'FK_LACode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Partners_Account' , @level0type=N'SCHEMA',@level0name=N'Master', @level1type=N'TABLE',@level1name=N'Partner_Account_Data', @level2type=N'CONSTRAINT',@level2name=N'FK_Partner_Account_Data_Partners_Data'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Location_Area_RF (Utility)"
            Begin Extent = 
               Top = 114
               Left = 781
               Bottom = 244
               Right = 951
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partners_Data (Master)"
            Begin Extent = 
               Top = 33
               Left = 7
               Bottom = 163
               Right = 194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 9
               Left = 213
               Bottom = 184
               Right = 405
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 1
               Left = 611
               Bottom = 200
               Right = 820
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Delivery_TF (Trans)"
            Begin Extent = 
               Top = 10
               Left = 426
               Bottom = 213
               Right = 596
            End
            DisplayFlags = 280
            TopColumn = 8
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1710
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width ' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[7] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Delivery_Reciept_TF (Trans)"
            Begin Extent = 
               Top = 16
               Left = 29
               Bottom = 289
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 25
         End
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 287
               Bottom = 147
               Right = 479
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Partners_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 582
               Bottom = 130
               Right = 769
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location_Area_RF (Utility)"
            Begin Extent = 
               Top = 141
               Left = 729
               Bottom = 271
               Right = 899
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partner_Account_Payable (Trans)"
            Begin Extent = 
               Top = 349
               Left = 358
               Bottom = 516
               Right = 583
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 30
               Left = 16
               Bottom = 242
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Delivery_Info (Trans)"
            Begin Extent = 
               Top = 194
               Lef' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_BATCH_FINAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N't = 493
               Bottom = 377
               Right = 690
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 55
         Width = 284
         Width = 2295
         Width = 2415
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1980
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1980
         Width = 1590
         Width = 1500
         Width = 1500
         Width = 1590
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1545
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3180
         Alias = 2355
         Table = 3195
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_BATCH_FINAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_BATCH_FINAL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 14
               Left = 183
               Bottom = 208
               Right = 375
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 5
               Left = 574
               Bottom = 204
               Right = 783
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Delivery_TF (Trans)"
            Begin Extent = 
               Top = 16
               Left = 369
               Bottom = 219
               Right = 539
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location_Area_RF (Utility)"
            Begin Extent = 
               Top = 69
               Left = 0
               Bottom = 301
               Right = 170
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1710
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
  ' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_TRANS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_TRANS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_RECEIPT_TRANS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[4] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 259
               Bottom = 191
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Delivery_TF (Trans)"
            Begin Extent = 
               Top = 197
               Left = 271
               Bottom = 361
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Location_Area_RF (Utility)"
            Begin Extent = 
               Top = 4
               Left = 729
               Bottom = 173
               Right = 910
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 101
               Left = 592
               Bottom = 262
               Right = 794
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Delivery_Schedule_TF (Trans)"
            Begin Extent = 
               Top = 12
               Left = 18
               Bottom = 253
               Right = 188
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2055
         Width = 1500
         Width = 1500
         Width = 2355
         Width = 1125
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begi' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SCHEDULE_LIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'n ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SCHEDULE_LIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SCHEDULE_LIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[19] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -160
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Delivery_Info (Trans)"
            Begin Extent = 
               Top = 235
               Left = 425
               Bottom = 650
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Delivery_Reciept_TF (Trans)"
            Begin Extent = 
               Top = 82
               Left = 90
               Bottom = 312
               Right = 304
            End
            DisplayFlags = 280
            TopColumn = 39
         End
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 506
               Bottom = 212
               Right = 698
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partners_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 633
               Bottom = 130
               Right = 821
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location_Area_RF (Utility)"
            Begin Extent = 
               Top = 209
               Left = 621
               Bottom = 339
               Right = 791
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 58
         Width = 284
         Width = 2205
         Width = 2415
         Width = 2055
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1530
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1365
         Table = 2925
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DELIVERY_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Direct_Receiving_Hdr_TF (Trans)"
            Begin Extent = 
               Top = 7
               Left = 222
               Bottom = 234
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Direct_Receiving_Line_TF (Trans)"
            Begin Extent = 
               Top = 13
               Left = 439
               Bottom = 225
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 87
               Left = 721
               Bottom = 217
               Right = 923
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Supplier_Data (Master)"
            Begin Extent = 
               Top = 119
               Left = 0
               Bottom = 435
               Right = 186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 2430
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3225
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
        ' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DIRECT_RECEIVED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DIRECT_RECEIVED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_DIRECT_RECEIVED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[13] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 2
               Left = 18
               Bottom = 238
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inventory_Opening_Ending_TF (Trans)"
            Begin Extent = 
               Top = 47
               Left = 343
               Bottom = 266
               Right = 519
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1035
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 3090
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_INVENTORY_BEGINNING_ENDING'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_INVENTORY_BEGINNING_ENDING'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[11] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Supplier_Voucher_Hdr_TF (Trans)"
            Begin Extent = 
               Top = 285
               Left = 59
               Bottom = 449
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Supplier_Data (Master)"
            Begin Extent = 
               Top = 347
               Left = 296
               Bottom = 477
               Right = 482
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 38
               Left = 25
               Bottom = 257
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inventory (Trans)"
            Begin Extent = 
               Top = 0
               Left = 273
               Bottom = 228
               Right = 505
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inventory_Data (Master)"
            Begin Extent = 
               Top = 284
               Left = 573
               Bottom = 454
               Right = 817
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Delivery_Reciept_TF (Trans)"
            Begin Extent = 
               Top = 26
               Left = 520
               Bottom = 191
               Right = 718
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 308
               Left ' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_ITEMS_LIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 862
               Bottom = 438
               Right = 1054
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Adjustment_RF (Utility)"
            Begin Extent = 
               Top = 115
               Left = 1022
               Bottom = 287
               Right = 1206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Adjustment_TF (Trans)"
            Begin Extent = 
               Top = 17
               Left = 780
               Bottom = 203
               Right = 960
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 2220
         Width = 2355
         Width = 1785
         Width = 1980
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1605
         Alias = 900
         Table = 2325
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1020
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_ITEMS_LIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_ITEMS_LIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[12] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -150
      End
      Begin Tables = 
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 271
               Left = 742
               Bottom = 441
               Right = 995
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 0
               Left = 787
               Bottom = 225
               Right = 989
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partners_Data (Master)"
            Begin Extent = 
               Top = 12
               Left = 4
               Bottom = 208
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partner_PO_Hdr (Trans)"
            Begin Extent = 
               Top = 7
               Left = 220
               Bottom = 222
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partner_PO_Rows (Trans)"
            Begin Extent = 
               Top = 18
               Left = 510
               Bottom = 281
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1650
         Width = 1800
         Width = 1815
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Wid' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_PARTNER_PO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'th = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_PARTNER_PO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_PARTNER_PO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[13] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Partner_Deposit_TF (Trans)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 201
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_DELIVERY_RECEIPT_BATCH_FINAL (Trans)"
            Begin Extent = 
               Top = 25
               Left = 362
               Bottom = 201
               Right = 635
            End
            DisplayFlags = 280
            TopColumn = 20
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 29
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3000
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 3780
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_PARTNER_SOA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_PARTNER_SOA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_PARTNER_SOA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[18] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Adjustment_RF (Utility)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 160
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 11
               Left = 530
               Bottom = 141
               Right = 732
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Adjustment_TF (Trans)"
            Begin Extent = 
               Top = 24
               Left = 270
               Bottom = 221
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 149
               Left = 596
               Bottom = 337
               Right = 788
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Supplier_Data (Master)"
            Begin Extent = 
               Top = 234
               Left = 586
               Bottom = 364
               Right = 772
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1830
         Width = 1500
         Width = 2430
         Width = 1950
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1605
         Width = 1500
         Width = 1500
         W' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_ADJUSTMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'idth = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_ADJUSTMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_ADJUSTMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 49
               Left = 0
               Bottom = 209
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Storage_RF (Utility)"
            Begin Extent = 
               Top = 0
               Left = 471
               Bottom = 158
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Storage_TF (Trans)"
            Begin Extent = 
               Top = 3
               Left = 276
               Bottom = 203
               Right = 446
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Storage_RF_1"
            Begin Extent = 
               Top = 149
               Left = 507
               Bottom = 279
               Right = 677
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Storage_Data (Master)"
            Begin Extent = 
               Top = 7
               Left = 245
               Bottom = 227
               Right = 415
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1980
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         ' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_TRANSFER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_TRANSFER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_STOCK_TRANSFER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[9] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Supplier_Voucher_Hdr_TF (Trans)"
            Begin Extent = 
               Top = 0
               Left = 207
               Bottom = 240
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Supplier_Data (Master)"
            Begin Extent = 
               Top = 54
               Left = 0
               Bottom = 279
               Right = 186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Supplier_Voucher_Rows_TF (Trans)"
            Begin Extent = 
               Top = 5
               Left = 618
               Bottom = 230
               Right = 849
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_Data (Master)"
            Begin Extent = 
               Top = 349
               Left = 582
               Bottom = 489
               Right = 784
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item_SubCat_RF (Utility)"
            Begin Extent = 
               Top = 140
               Left = 377
               Bottom = 282
               Right = 547
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = ' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_SUPPLIER_VOUCHER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1500
         Width = 1500
         Width = 1500
         Width = 1575
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_SUPPLIER_VOUCHER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'Trans', @level1type=N'VIEW',@level1name=N'VR_SUPPLIER_VOUCHER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Branch_Data (Master)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 211
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Location_Area_RF (Utility)"
            Begin Extent = 
               Top = 154
               Left = 333
               Bottom = 284
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partners_Data (Master)"
            Begin Extent = 
               Top = 6
               Left = 476
               Bottom = 181
               Right = 663
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1605
         Width = 2610
         Width = 2175
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'Utility', @level1type=N'VIEW',@level1name=N'VR_BRANCH_AREA_LOCATION_LIST'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'Utility', @level1type=N'VIEW',@level1name=N'VR_BRANCH_AREA_LOCATION_LIST'
GO
