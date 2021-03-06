USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[spUPDATE_VEHICLE_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/21/2018>
-- Description:	<UPDATE VEHICLE DATA>
-- =============================================
CREATE PROCEDURE [Utility].[spUPDATE_VEHICLE_DATA]
@PLATEID int, 
@PLATENUMBER nvarchar(20),
@VEHICLEDESCRIPTION nvarchar(100),
@LOADCAPACITY int
AS
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
	--IDENTIFY ACTION 
	--INSERT TO DELIVERY INFO
	IF NOT EXISTS(SELECT * FROM [Utility].[Vehicle_RF] WHERE PlateID = @PLATEID)
		BEGIN
			INSERT INTO [Utility].[Vehicle_RF](PlateNumber, VehicleDescription, LoadCapacity)
			VALUES (UPPER(@PLATENUMBER), UPPER(@VEHICLEDESCRIPTION), @LOADCAPACITY)
		END
	ELSE
	--UPDATE DELIVERY
		BEGIN
			UPDATE [Utility].[Vehicle_RF]
			SET PlateNumber=UPPER(@PLATENUMBER), VehicleDescription=UPPER(@VEHICLEDESCRIPTION), LoadCapacity=@LOADCAPACITY
			WHERE PlateID=@PLATEID
		END

	COMMIT TRANSACTION
	END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH
END


GO
