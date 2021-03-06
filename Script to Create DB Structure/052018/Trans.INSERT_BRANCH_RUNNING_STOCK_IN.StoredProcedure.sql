USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_BRANCH_RUNNING_STOCK_IN]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* INSERT TO BRANCH RUNNING_STOCK
03/09/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_BRANCH_RUNNING_STOCK_IN]
@REFERENCENUM nvarchar(15),
@BRANCHCODE nvarchar(6),
@ITEMCODE nvarchar(6),
@CONVERTEDQTY int,
@DATETRANS datetime
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	
	
	--GET THE GROUP ITEMCODE
	DECLARE @BRANCH_ITEMCODE nvarchar(6) = (Select Branch_ItemCode FROM Master.Item_Data Where ItemCode=@ITEMCODE)
	

	--CHECK IF EXIST
	IF NOT EXISTS(Select * FROM Master.Branch_Inventory_RF
				  Where BranchCode=@BRANCHCODE and Branch_ItemCode=@BRANCH_ITEMCODE)
		BEGIN
			INSERT INTO Master.Branch_Inventory_RF (BranchCode,Branch_ItemCode)
			VALUES (@BRANCHCODE,@ITEMCODE)
		END



	DECLARE @RUNNING_STOCK int = (Select Stock_On_Hand From [Master].[Branch_Inventory_RF]
							  Where BranchCode=@BRANCHCODE and Branch_ItemCode=@BRANCH_ITEMCODE)
		
	DECLARE @BALANCE int = @RUNNING_STOCK + @CONVERTEDQTY
	
	INSERT INTO [Trans].[Branch_Inventory_Running_Stock_TF]
	(ReferenceNum, BranchCode, Branch_ItemCode, Running_Stock, Stock_IN, Balance, DateTrans)
	VALUES
	(@REFERENCENUM, @BRANCHCODE,@BRANCH_ITEMCODE,@RUNNING_STOCK,@CONVERTEDQTY,@BALANCE,@DATETRANS)
	
	--UPDATE BRANCH INVENTORY
	UPDATE MASTER.Branch_Inventory_RF
	SET STOCK_IN = STOCK_IN + @CONVERTEDQTY, Stock_On_Hand = Stock_On_Hand + @CONVERTEDQTY,
		DU=GETDATE()
	WHERE BranchCode=@BRANCHCODE AND Branch_ItemCode=@BRANCH_ITEMCODE
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
