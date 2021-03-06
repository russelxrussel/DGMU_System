USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[INSERT_PARTNER_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/20/2017>
-- Updated date: <1/22/2018> VER 2.0 <01/30/2018>
-- VER 3.0 <02/09/2018>
-- Description:	<INSERT PARTNERS DATA>
-- =============================================
CREATE PROCEDURE [Master].[INSERT_PARTNER_DATA]
@PARTNERCODE nvarchar(10), 
@PARTNERNAME nvarchar(100),
@P_ADDRESS nvarchar(250),
@P_CONTACTNUMBERS nvarchar(100),
@P_CONTACTPERSON nvarchar(50),
@ITEMCODE nvarchar(6),
@PRICECODE nvarchar(6)

AS
BEGIN
BEGIN TRY
	BEGIN TRANSACTION
	
	--Condition to avoid multi insertion of the same record.
	IF NOT EXISTS(SELECT * FROM Master.Partners_Data WHERE PartnerCode = @PARTNERCODE)
		BEGIN
		INSERT INTO 
		Master.Partners_Data(PartnerCode,PartnerName,P_Address,P_ContactNumber,P_ContactPerson)
		VALUES
		(UPPER(@PARTNERCODE),UPPER(@PARTNERNAME),@P_ADDRESS,@P_CONTACTNUMBERS,UPPER(@P_CONTACTPERSON))
		END
	ELSE
		--UPDATE RECORD
		BEGIN
		UPDATE MASTER.Partners_Data
		SET PartnerName=UPPER(@PARTNERNAME), P_Address=@P_ADDRESS, P_ContactNumber=@P_CONTACTNUMBERS, 
		P_ContactPerson=@P_CONTACTPERSON
		WHERE
		PartnerCode=@PARTNERCODE
		END

	IF NOT EXISTS(SELECT * FROM Utility.Partner_Price_RF WHERE PartnerCode = @PARTNERCODE AND ItemCode=@ITEMCODE)
		BEGIN
		INSERT INTO Utility.Partner_Price_RF
		(PartnerCode, ItemCOde, PriceCode)	
		VALUES
		(@PARTNERCODE,@ITEMCODE,@PRICECODE)
		END
	ELSE
		BEGIN
		UPDATE Utility.Partner_Price_RF
		SET PriceCode=@PRICECODE
		WHERE PartnerCode=@PARTNERCODE AND ItemCode=@ITEMCODE	
		END

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH
END


GO
