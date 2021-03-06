USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[INSERT_BRANCH_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<INSERT BRANCH DATA>
-- =============================================
CREATE PROCEDURE [Master].[INSERT_BRANCH_DATA]
@BRANCHCODE nvarchar(6), 
@PARTNERCODE nvarchar(6),
@LACODE nvarchar(6),
@BRANCHNAME nvarchar(100),
@B_ADDRESS nvarchar(250),
@B_CONTACTNUMBERS nvarchar(100),
@SUPERVISOR nvarchar(100)

AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

INSERT INTO 
Master.Branch_Data(BranchCode,PartnerCode,LACode,BranchName,B_Address,B_ContactNumbers,Supervisor)
VALUES
(UPPER(@BRANCHCODE),@PARTNERCODE,@LACODE,UPPER(@BRANCHNAME),@B_ADDRESS,@B_CONTACTNUMBERS,UPPER(@SUPERVISOR))

INSERT INTO 
[Utility].[Delivery_Schedule_RF](BranchCode)
VALUES(@BRANCHCODE)


--INSERT INTO BRANCH_INVENTORY
DECLARE @COUNTER int = 0
DECLARE @ROWCOUNT int = (SELECT COUNT(*) FROM Master.Branch_Item_MF)
DECLARE @GROUPITEMCODE nvarchar(6)

	--WHILE @COUNTER < @ROWCOUNT
	--	BEGIN
	--	SET @COUNTER = @COUNTER + 1
	
	--	--SET @ITEMCODE = @SUB_ITEMCODE + CONVERT(NVARCHAR(2), @COUNTER)
	--	SET @GROUPITEMCODE = (Select Branch_ItemCode FROM Master.Branch_Item_MF WHERE ItemGroupID=@COUNTER)

	--	--SET @CURRENTQUANTITY = (Select EndQuantity FROM Trans.Inventory_Ending_Stock_TF where ItemCode=@ITEMCODE and endDate= dateadd(day,datediff(day,1,GETDATE()),0))
		
	--	INSERT INTO master.Branch_Inventory_RF
	--	(BranchCode, Branch_ItemCode)
	--	VALUES
	--	(@BRANCHCODE,@GROUPITEMCODE) 
	--	END

	INSERT INTO [Master].[Branch_Inventory_RF](BranchCode,Branch_ItemCode)
	SELECT UPPER(@BRANCHCODE), Branch_ItemCode
	FROM Master.Branch_Item_MF

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH
END


GO
