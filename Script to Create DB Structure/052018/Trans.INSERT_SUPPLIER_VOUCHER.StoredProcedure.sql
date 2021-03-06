USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_SUPPLIER_VOUCHER]    Script Date: 5/2/2018 9:08:55 AM ******/
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
