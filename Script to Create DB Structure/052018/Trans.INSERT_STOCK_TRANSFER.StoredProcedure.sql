USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_STOCK_TRANSFER]    Script Date: 5/2/2018 9:08:55 AM ******/
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
