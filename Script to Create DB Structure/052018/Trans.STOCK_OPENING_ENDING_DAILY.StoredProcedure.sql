USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[STOCK_OPENING_ENDING_DAILY]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--THIS IS FOR SYSTEM GENERATED RECORDING OF DAILY OPENING AND ENDING STOCK IN INVENTORY
--RUSSEL VASQUEZ
--04/26/2018

CREATE PROC [Trans].[STOCK_OPENING_ENDING_DAILY]
AS
BEGIN

IF NOT EXISTS (SELECT DI from [Trans].[Inventory_Opening_Ending_TF] where CONVERT(date,DI,101)=CONVERT(date,getdate(), 101))
	
	BEGIN

	INSERT INTO [Trans].[Inventory_Opening_Ending_TF](ItemCode,Opening,Ending)
	SELECT ItemCode,RunningStock,RunningStock
	FROM [Master].[Inventory_Data]
	
	END

END
GO
