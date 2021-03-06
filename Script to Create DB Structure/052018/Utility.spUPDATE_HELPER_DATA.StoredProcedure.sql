USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[spUPDATE_HELPER_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/21/2018>
-- Description:	<UPDATE HELPER DATA>
-- =============================================
CREATE PROCEDURE [Utility].[spUPDATE_HELPER_DATA]
@HELPERID int, 
@HELPERNAME nvarchar(100),
@STATUS bit
AS
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
	--IDENTIFY ACTION 
	--INSERT TO DELIVERY INFO
	IF NOT EXISTS(SELECT * FROM Utility.Helper_RF WHERE HelperID=@HELPERID)
		BEGIN
			INSERT INTO Utility.Helper_RF(HelperName, Status)
			VALUES (UPPER(@HELPERNAME), @STATUS)
		END
	ELSE
	--UPDATE DELIVERY
		BEGIN
			UPDATE Utility.Helper_RF
			SET HelperName=UPPER(@HELPERNAME), Status=@STATUS
			WHERE HelperID=@HELPERID
		END

	COMMIT TRANSACTION
	END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH
END


GO
