USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_BRANCH_STOCK_RETURN]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Stock Return
02/07/2018
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_BRANCH_STOCK_RETURN]
@SRNUM nvarchar(10),
@BRANCHCODE nvarchar(6),
@ITEMCODE nvarchar(10),
@QUANTITY float,
@CREDITTOACCOUNT bit,
@DATERETURN datetime,
@REMARKS nvarchar(250)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	DECLARE @PARTNERCODE nvarchar(6)

	SET @PARTNERCODE = (Select PartnerCode from Master.Branch_Data where BranchCode=@BRANCHCODE)

	INSERT Trans.Stock_Branch_Return_TF(SRNum, PartnerCode, BranchCode, ItemCode, Quantity, CreditToAccount, DateReturn, Remarks)
	VALUES(@SRNUM,@PARTNERCODE, @BRANCHCODE, @ITEMCODE,@QUANTITY, @CREDITTOACCOUNT,@DATERETURN,@REMARKS)

	EXEC xSystem.UPDATE_SERIES_NUMBER 'SR'

	
	--INSERT ON INVENTORY TRANSACTION
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@SRNUM,@ITEMCODE,@QUANTITY,1,GETDATE(),'Return Stock')

	--EFFECT ON INVENTORY
	UPDATE master.Inventory_Data
	SET InStock = InStock + @QUANTITY,
	OutStock = OutStock - @QUANTITY, 
	RunningStock = RunningStock + @QUANTITY, 
	dateUpdate=GETDATE()
	WHERE ItemCode=@ITEMCODE

	
	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode,  In_Stock,  Reference)
	VALUES
	(@ITEMCODE,@QUANTITY,@SRNUM)

	--OPENING ENDING STOCK UPDATE
	UPDATE [Trans].[Inventory_Opening_Ending_TF]
	SET Stock_In = Stock_In + @QUANTITY,
	    Ending = Ending + @QUANTITY,
		LastUpdate = getdate()
	WHERE ItemCode = @ITEMCODE and CONVERT(date,DI,101)=CONVERT(date,getdate(), 101)


	
	--EFFECT ON STORAGE
	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn + @QUANTITY,
		StockOut = StockOut - @QUANTITY,
		CurrentStock = CurrentStock + @QUANTITY,
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
