USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[UPDATE_DELIVERY_STATUS_CANCEL]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE Delivery Cancel Status
11/22/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_DELIVERY_STATUS_CANCEL] 
@DRNUM nvarchar(10),
@REMARKS nvarchar(150)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	UPDATE [Trans].[Delivery_Schedule_TF]
	SET IsSched = 0, IsPostPone = 1, IsAdd = 0, DeliveryDate = NULL, Remarks=@REMARKS, DU=GETDATE()
	WHERE DRNum = @DRNUM

		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
