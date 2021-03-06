USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_SCHEDULE_TODAY]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Delivery Schedule
11/20//2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_SCHEDULE_TODAY]
@DRNUM nvarchar(10),
@DELIVERYDATE datetime
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	IF EXISTS (SELECT * FROM [Trans].[Delivery_Schedule_TF]
			   WHERE DRNum=@DRNUM AND DeliveryDate IS NULL)
	UPDATE [Trans].[Delivery_Schedule_TF]
	SET DeliveryDate = @DELIVERYDATE, IsSet=1
	WHERE DRNum = @DRNUM

	UPDATE [Trans].[Delivery_TF]
	SET IsDelivered = 1
	WHERE DRNum = @DRNUM

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
