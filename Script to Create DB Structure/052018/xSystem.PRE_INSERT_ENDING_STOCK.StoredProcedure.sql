USE [DGMU]
GO
/****** Object:  StoredProcedure [xSystem].[PRE_INSERT_ENDING_STOCK]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--System Execution
--Russel Vasquez
--This function will insert all item ending stock from previous date


CREATE PROC [xSystem].[PRE_INSERT_ENDING_STOCK]
AS

BEGIN

DECLARE @COUNTER int = 0
DECLARE @ROWCOUNT int = (SELECT COUNT(*) FROM Master.Item_Data)
DECLARE @SUB_ITEMCODE nvarchar(6) = 'ITM00'
DECLARE @ITEMCODE NVARCHAR(6)
DECLARE @CURRENTQUANTITY int

IF NOT EXISTS (SELECT EndDate from Trans.Inventory_Ending_Stock_TF where endDate=CONVERT(date,getdate(), 101))
	BEGIN
	WHILE @COUNTER < @ROWCOUNT
		BEGIN
		SET @COUNTER = @COUNTER + 1
	
		SET @ITEMCODE = @SUB_ITEMCODE + CONVERT(NVARCHAR(2), @COUNTER)
		
		--[1] GET THE CURRENT PREVIOUS DATE IN INVENTORY ENDING TABLE
		DECLARE @LASTDATE DateTime = (Select TOP 1 EndDate FROM Trans.Inventory_Ending_Stock_TF WHERE ItemCode=@ITEMCODE Order By EndDate Desc)

--		SET @CURRENTQUANTITY = (Select EndQuantity FROM Trans.Inventory_Ending_Stock_TF where ItemCode=@ITEMCODE and endDate= dateadd(day,datediff(day,1,@LASTDATE),0))
		
		--[2] GET THE QUANTIY OF @LASTDATE QUERY
		SET @CURRENTQUANTITY = (Select EndQuantity FROM Trans.Inventory_Ending_Stock_TF where ItemCode=@ITEMCODE and endDate= @LASTDATE)

		--[3] INSERT THE QUANTITY AND DATE IT AS CURRENT, WHICH WILL SERVE AS OPENING STOCK
		INSERT INTO Trans.Inventory_Ending_Stock_TF
		(ItemCode,EndQuantity, EndDate)
		VALUES 
		(@ITEMCODE, @CURRENTQUANTITY,GETDATE())
		END
	END
	
END	 
GO
