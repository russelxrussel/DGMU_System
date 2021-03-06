USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_RECEIPT_FINAL]    Script Date: 5/2/2018 9:08:55 AM ******/
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
