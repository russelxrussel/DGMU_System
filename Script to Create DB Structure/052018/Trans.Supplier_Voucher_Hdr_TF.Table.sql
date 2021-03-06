USE [DGMU]
GO
/****** Object:  Table [Trans].[Supplier_Voucher_Hdr_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
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
