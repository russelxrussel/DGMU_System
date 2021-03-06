USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_SUPPLIER_VOUCHER_HDR]    Script Date: 5/2/2018 9:08:55 AM ******/
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
