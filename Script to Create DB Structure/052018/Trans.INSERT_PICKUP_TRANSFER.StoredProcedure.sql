USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_PICKUP_TRANSFER]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* INSERT PARTNER PICKUP
03/09/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_PICKUP_TRANSFER]
@PTNUM nvarchar(12),
@PTBNUM nvarchar(12),
@PARTNERCODE nvarchar(6),
@ITEMCODE nvarchar(6),
@QUANTITY int,
@DATETRANS datetime,
@REMARKS nvarchar(250)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	--RUNNING STOCK 
	DECLARE @CURRENT_STOCK float
	DECLARE @BALANCE_STOCK float

	DECLARE @CONVERSION int = (SELECT ConversionQty FROM MASTER.Item_Data Where ItemCode = @ITEMCODE)
	DECLARE @UNITPRICE float = (SELECT B.PriceAmount FROM Utility.Partner_Price_RF A
								  Inner Join Utility.Price_RF B
								  ON A.PriceCode = B.PriceCode
								  WHERE A.PartnerCode=@PARTNERCODE and A.ItemCode=@ITEMCODE)
	
	DECLARE @CONVERTEDQTY int = @QUANTITY * @CONVERSION
	DECLARE @TOTALPRICE float = @CONVERTEDQTY * @UNITPRICE

	INSERT INTO [Trans].[Pickup_Transfer_TF]
	(PTNum, PartnerCode, ItemCode, Quantity,Conversion, ConvertedQty, UnitPrice, Remarks,DateTrans, PTBNum)
	VALUES
	(@PTNUM, @PARTNERCODE, @ITEMCODE, @QUANTITY,@CONVERSION, @CONVERTEDQTY, @UNITPRICE,@REMARKS, @DATETRANS, @PTBNUM)
	EXEC xSystem.UPDATE_SERIES_NUMBER 'PTI'


	--INSERT INTO PICKUP BRANCH SOURCE
	DECLARE @BRANCHITEMCODE nvarchar(6) = (SELECT Branch_ItemCode FROM master.Item_Data where ItemCode = @ITEMCODE)
	IF NOT EXISTS(SELECT * FROM [Trans].[PickUp_Transfer_Branch_Source_TF] WHERE PartnerCode=@PARTNERCODE and BranchItemCode=@BRANCHITEMCODE and
				  CONVERT(date,DateTrans, 101) = CONVERT(date,@DATETRANS, 101))
		BEGIN
			INSERT INTO [Trans].[PickUp_Transfer_Branch_Source_TF]
			(PTBNum, PartnerCode, BranchItemCode,TotalQty,DateTrans)
			VALUES
			(@PTBNUM,@PARTNERCODE,@BRANCHITEMCODE,@CONVERTEDQTY,@DATETRANS)

			EXEC xSystem.UPDATE_SERIES_NUMBER 'PTB'
		END
	ELSE
		BEGIN
			UPDATE [Trans].[PickUp_Transfer_Branch_Source_TF]
			SET TotalQty=TotalQty + @CONVERTEDQTY
			WHERE PartnerCode=@PARTNERCODE and BranchItemCode=@BRANCHITEMCODE and
				  CONVERT(date,DateTrans, 101) = CONVERT(date,@DATETRANS, 101)
		END

	-- INSERT INTO RUNNING TRANSACTION
	-- INSERT ALSO THE TRANSACTION ITEM ON INVENTORY TRANSACTION FILES
	IF @CONVERTEDQTY <> 0 
	BEGIN
	INSERT INTO [Trans].[Inventory](TransactionNum,ItemCode, Quantity,IsMoveIn,DateTrans,UserCode)
	VALUES(@PTNUM,@ITEMCODE,@CONVERTEDQTY,0,GETDATE(),'USERCODEHERE')

	SET @CURRENT_STOCK = (Select RunningStock FROM 
						[Master].[Inventory_Data]
						WHERE ItemCode=@ITEMCODE)

	SET @BALANCE_STOCK = @CURRENT_STOCK - @CONVERTEDQTY

	--INSERT INTO RUNNING STOCK TABLE
	INSERT INTO [Trans].[Inventory_Running_Stock_TF]
	(ItemCode, Running_Stock, Out_Stock, Balance_Stock, Reference)
	VALUES
	(@ITEMCODE,@CURRENT_STOCK,@CONVERTEDQTY,@BALANCE_STOCK, @PTNUM)

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

	--INVENTORY
	UPDATE [Master].[Inventory_Data]
	SET InStock = InStock - @CONVERTEDQTY,
		OutStock = OutStock + @CONVERTEDQTY,
		RunningStock = RunningStock - @CONVERTEDQTY,
		dateUpdate=GETDATE()
	WHERE 
	    ItemCode = @ITEMCODE
		

	UPDATE [Master].[Storage_Data]
	SET StockIn = StockIn - @CONVERTEDQTY,
		CurrentStock = CurrentStock - @CONVERTEDQTY,
		DU=GETDATE()
	WHERE
	StorageCode='STR001' and ItemCode=@ITEMCODE

	--INSERT INTO PARTNER PAYABLE
	INSERT INTO trans.Partner_Account_Payable
	(PartnerCode,Reference, Source, ItemCode, ItemQuantity,ItemConversionQty, UnitPrice,Amount, Date_Payable, UserCode)
	VALUES
	(@PARTNERCODE,@PTNUM,@PTNUM,@ITEMCODE,@QUANTITY,@CONVERTEDQTY,@UNITPRICE,@TOTALPRICE, GETDATE(),'USERCODEHERE')
	
	END
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
