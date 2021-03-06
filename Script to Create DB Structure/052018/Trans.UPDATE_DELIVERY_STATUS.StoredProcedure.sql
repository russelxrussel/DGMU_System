USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_STATUS]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Delivery Receipt Transaction Per Line Item 
11/19//2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_STATUS]
@ID int
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	--IF DATE GENERATION EXIST DONT RUN BATCH UPDATE
	IF NOT EXISTS(SELECT * FROM [xSystem].[Delivery_Date_Generate] 
	WHERE CONVERT(Date,DateDeliveryListGenerate, 101) = CONVERT(Date,getDate(), 101))
	BEGIN
	UPDATE [Trans].[Delivery_Status_TF]
	SET ISSET = 1, ISCANCEL = 0, DeliveryDateToday = getdate()
	WHERE id=@ID
	
	    --SAVE SINGLE DATE GENERATED
		IF NOT EXISTS 
		(SELECT * FROM [xSystem].[Delivery_Date_Generate] 
		WHERE CONVERT(Date,DateDeliveryListGenerate, 101) = CONVERT(Date,getDate(), 101))
		BEGIN
			INSERT INTO  [xSystem].[Delivery_Date_Generate]
				(DateDeliveryListGenerate)
				VALUES
				(getdate())
		END
	
	END

	
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
