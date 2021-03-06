USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_DELIVERY_RECEIPT]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Delivery Receipt Transaction Per Line Item 
11/13//2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_DELIVERY_RECEIPT]
@DRNUM nvarchar(10),
@BRANCHCODE nvarchar(6),
@ITEMCODE nvarchar(10),
@INVQTY float,
@PARTNERQTY float,
@PARTNERUOM nvarchar(10),
@UNITPRICE float,
@TOTALPRICE float,
@REMAININGQTY float,
@ORDERDATE datetime,
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO [Trans].[Delivery_TF](DRNum,BranchCode, ItemCode,InvQty,PartnerQty,PartnerUom,UnitPrice,TotalPrice,RemainingQty,OrderDate,Remarks,UserCode)
	VALUES(@DRNUM,@BRANCHCODE,@ITEMCODE,@INVQTY,@PARTNERQTY,@PARTNERUOM,@UNITPRICE,@TOTALPRICE,@REMAININGQTY,@ORDERDATE,@REMARKS,@USERCODE)
	
	--INSERT ALSO THE TRANSACTION ITEM ON INVENTORY TRANSACTION FILES
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@DRNUM,@ITEMCODE,@INVQTY,0,GETDATE(),@USERCODE)
	

	--UPDATE STOCK INVENTORY
	EXEC [Trans].[UPDATE_STOCK_INVENTORY_FROM_PARTNER] @ITEMCODE, @INVQTY

	--UPDATE DEFAULT STORAGE DGMU Storage
	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn - @INVQTY,
		CurrentStock = CurrentStock - @INVQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODE
	
	

	IF NOT EXISTS(SELECT * FROM [Trans].[Delivery_Schedule_TF] WHERE DRNum = @DRNUM)
		BEGIN
	
		INSERT INTO [Trans].[Delivery_Schedule_TF]
		(DRNum, BranchCode, M,T,W,Th,F,Sa,S) 
		SELECT @DRNUM,@BRANCHCODE, M,T,W,Th,F,Sa,S
		FROM Utility.Delivery_Schedule_RF
		WHERE BranchCode=@BRANCHCODE
		
		
		END
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
