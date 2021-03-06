USE [DGMU]
GO
/****** Object:  Table [Trans].[Supplier_Voucher_Rows_TF]    Script Date: 5/2/2018 9:08:55 AM ******/
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
ALTER TABLE [Trans].[Supplier_Voucher_Rows_TF]  WITH CHECK ADD  CONSTRAINT [FK_VoucherNum_Rows] FOREIGN KEY([VoucherNum])
REFERENCES [Trans].[Supplier_Voucher_Hdr_TF] ([VoucherNum])
GO
ALTER TABLE [Trans].[Supplier_Voucher_Rows_TF] CHECK CONSTRAINT [FK_VoucherNum_Rows]
GO
