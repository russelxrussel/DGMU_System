USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_SUPPLIER_VOUCHER_ROWS]    Script Date: 5/2/2018 9:08:55 AM ******/
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
