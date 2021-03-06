USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_SCHEDULE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Delivery Schedule
11/20//2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_SCHEDULE]
@DRNUM nvarchar(10),
@DELIVERYDATE datetime
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	
	UPDATE [Trans].[Delivery_Schedule_TF]
	SET DeliveryDate = @DELIVERYDATE, IsSet = 1,DU=GETDATE()
	WHERE DRNum = @DRNUM


	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
