USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_RECEIVING_ITEM]    Script Date: 5/2/2018 9:08:55 AM ******/
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
