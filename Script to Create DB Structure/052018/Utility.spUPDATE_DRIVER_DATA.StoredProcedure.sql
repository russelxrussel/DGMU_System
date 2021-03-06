USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[spUPDATE_DRIVER_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/21/2018>
-- Description:	<UPDATE DRIVER DATA>
-- =============================================
CREATE PROCEDURE [Utility].[spUPDATE_DRIVER_DATA]
@DRIVERID int, 
@DRIVERNAME nvarchar(100),
@LICENSENUMBER nvarchar(50),
@STATUS bit
AS
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
	--IDENTIFY ACTION 
	--INSERT TO DELIVERY INFO
	IF NOT EXISTS(SELECT * FROM Utility.Driver_RF WHERE DriverID=@DRIVERID)
		BEGIN
			INSERT INTO Utility.Driver_RF(DriverName, LicenseNumber, Status)
			VALUES (UPPER(@DRIVERNAME), UPPER(@LICENSENUMBER), @STATUS)
		END
	ELSE
	--UPDATE DELIVERY
		BEGIN
			UPDATE Utility.Driver_RF
			SET DriverName=UPPER(@DRIVERNAME), LicenseNumber=UPPER(@LICENSENUMBER), Status=@STATUS
			WHERE DriverID=@DRIVERID
		END

	COMMIT TRANSACTION
	END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH
END


GO
