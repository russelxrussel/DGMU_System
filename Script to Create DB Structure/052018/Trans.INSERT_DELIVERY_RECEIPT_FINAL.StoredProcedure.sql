USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_DELIVERY_RECEIPT_FINAL]    Script Date: 5/2/2018 9:08:55 AM ******/
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
