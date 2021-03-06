USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_STOCK_ADJUSTMENT]    Script Date: 5/2/2018 9:08:55 AM ******/
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
