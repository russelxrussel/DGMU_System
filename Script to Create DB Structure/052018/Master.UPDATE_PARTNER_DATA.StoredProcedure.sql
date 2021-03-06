USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[UPDATE_PARTNER_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Update date: <01/22/2018> ver 2 <01/30/2018>
-- Description:	<UPDATE PARTNERS DATA>
-- =============================================
CREATE PROCEDURE [Master].[UPDATE_PARTNER_DATA]
@PARTNERCODE nvarchar(6), 
@PARTNERNAME nvarchar(100),
@P_ADDRESS nvarchar(250),
@P_CONTACTNUMBERS nvarchar(100),
@P_CONTACTPERSON nvarchar(50),
@PRICECODE nvarchar(6),
@LIEMPOPRICECODE nvarchar(6),
@LEEG_PRICE_CODE NVARCHAR(6),
@ATSARA_PRICE_CODE nvarchar(6)

AS
BEGIN

UPDATE
Master.Partners_Data
SET
PartnerName = UPPER(@PARTNERNAME),
P_Address = @P_ADDRESS,
P_ContactNumber = @P_CONTACTNUMBERS,
P_ContactPerson = UPPER(@P_CONTACTPERSON),
PriceCode=@PRICECODE, Liempo_PriceCode=@LIEMPOPRICECODE,
Leeg_PriceCode=@LEEG_PRICE_CODE,
Atsara_PriceCode=@ATSARA_PRICE_CODE
WHERE
PartnerCode = @PARTNERCODE

END


GO
