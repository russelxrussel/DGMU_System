USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_PICKUP_TRANS_DISTRIBUTE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* DISTRIBUTE ITEM FROM PICK UP AND TRANSFER PROCESS
<03/13/2018>
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_PICKUP_TRANS_DISTRIBUTE]
@PTBNUM nvarchar(12),
@DPTNUM nvarchar(12),
@BRANCHCODE nvarchar(6),
@BRANCHITEMCODE nvarchar(10),
@QUANTITYRECEIVED int,
@DATETRANS datetime,
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	--[1] CHECK FIRST IF EXIST
	
	IF NOT EXISTS(SELECT * FROM Pickup_Transfer_Branch_Receive_TF WHERE PTBNum=@PTBNUM and BranchCode=@BRANCHCODE and Branch_ItemCode=@BRANCHITEMCODE)
		BEGIN
		--[1.1] INSERT RECORD
		INSERT INTO TRANS.Pickup_Transfer_Branch_Receive_TF
		(PTBNum, DPTNum, BranchCode, Branch_ItemCode, QuantityReceived, DateReceived, Remarks, UserCode)
		VALUES
		(@PTBNUM,@DPTNUM, @BRANCHCODE, @BRANCHITEMCODE, @QUANTITYRECEIVED,@DATETRANS,@REMARKS, @USERCODE)
		
		EXEC xSystem.UPDATE_SERIES_NUMBER 'DPT'

		--[1.2] UPDATE PICKUP TRANSFER BRANCH SOURCE
		UPDATE [Trans].[PickUp_Transfer_Branch_Source_TF]
		SET DistributedQty = DistributedQty + @QUANTITYRECEIVED
		WHERE PTBNum = @PTBNUM AND BranchItemCode=@BRANCHITEMCODE

		--[1.3] INSERT INTO BRANCH RUNNING STOCK
		--**************
		--INSERT INTO BRANCH INVENTORY
		--**************
		--EXEC [TRANS].[INSERT_BRANCH_RUNNING_STOCK_IN] @DPTNUM, @BRANCHCODE, @BRANCHITEMCODE, @QUANTITYRECEIVED, @DATETRANS
			DECLARE @RUNNING_STOCK int = (Select Stock_On_Hand From [Master].[Branch_Inventory_RF]
									  Where BranchCode=@BRANCHCODE and Branch_ItemCode=@BRANCHITEMCODE)
		
			DECLARE @BALANCE int = @RUNNING_STOCK + @QUANTITYRECEIVED
	
			INSERT INTO [Trans].[Branch_Inventory_Running_Stock_TF]
			(ReferenceNum, BranchCode, Branch_ItemCode, Running_Stock, Stock_IN, Balance, DateTrans)
			VALUES
			(@DPTNUM, @BRANCHCODE,@BRANCHITEMCODE,@RUNNING_STOCK,@QUANTITYRECEIVED,@BALANCE,@DATETRANS)
	
			--UPDATE BRANCH INVENTORY
			UPDATE MASTER.Branch_Inventory_RF
			SET STOCK_IN = STOCK_IN + @QUANTITYRECEIVED, Stock_On_Hand = Stock_On_Hand + @QUANTITYRECEIVED,
						DU=GETDATE()
			WHERE BranchCode=@BRANCHCODE AND Branch_ItemCode=@BRANCHITEMCODE

		END

	--[2] GET THE QUANTITY SOURCE AND MATCH TO TOTAL DISTRIBUTED ITEM
	DECLARE @INI_QUANTITY int = (SELECT TotalQty FROM [PickUp_Transfer_Branch_Source_TF] WHERE PTBNum = @PTBNUM AND BranchItemCode=@BRANCHITEMCODE)
	DECLARE @TOTAL_DISTRIBUTED int = (SELECT DistributedQty FROM [PickUp_Transfer_Branch_Source_TF] WHERE PTBNum = @PTBNUM AND BranchItemCode=@BRANCHITEMCODE)
	
	IF (@INI_QUANTITY = @TOTAL_DISTRIBUTED)
			BEGIN
			--[2.1] CLOSED THE RECORD
			UPDATE [Trans].[PickUp_Transfer_Branch_Source_TF]
			SET IsClosed = 1
			WHERE PTBNum = @PTBNUM AND BranchItemCode=@BRANCHITEMCODE
		
			--[2.2]
			UPDATE [Trans].[PickUp_Transfer_TF]
			SET IsClosed = 1
			WHERE PTBNum = @PTBNUM
			END

	 
	

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION

END CATCH

END

GO
