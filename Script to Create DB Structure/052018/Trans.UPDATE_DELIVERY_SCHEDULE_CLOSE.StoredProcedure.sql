USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_SCHEDULE_CLOSE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Update Delivery Schedule Batch to close
11/21/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_SCHEDULE_CLOSE]
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	UPDATE [Trans].[Delivery_Schedule_TF]
	SET IsSched = 1
	WHERE Convert(date,DeliveryDate, 101) < Convert(date, getdate(), 101)
	AND IsPostpone = 0

	UPDATE  A
	SET A.IsDelivered = 1
	FROM [Trans].[Delivery_TF] A
	INNER JOIN [Trans].[Delivery_Schedule_TF] B
	ON A.DRNUM = B.DRNUM
	WHERE B.ISSCHED = 1

	
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
