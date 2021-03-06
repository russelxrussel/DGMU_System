USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_STATUS_ADD]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE DELIVERY RESCHED
11/20/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_STATUS_ADD]
@DRNUM nvarchar(10),
@REMARKS nvarchar(250),
@DELIVERYDATE datetime
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	UPDATE [Trans].[Delivery_Schedule_TF]
	SET IsSched = 0, IsPostPone = 0, IsAdd = 1, DeliveryDate = @DELIVERYDATE, Remarks=@REMARKS,
	DU=GETDATE()
	WHERE DRNum = @DRNUM

		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
