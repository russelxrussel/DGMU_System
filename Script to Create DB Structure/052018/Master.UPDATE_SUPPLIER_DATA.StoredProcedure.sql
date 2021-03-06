USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[UPDATE_SUPPLIER_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<UPDATE SUPPLIER DATA>
-- =============================================
CREATE PROCEDURE [Master].[UPDATE_SUPPLIER_DATA]
@SUPPLIERCODE nvarchar(10), 
@SUPPLIERNAME nvarchar(100),
@S_ADDRESS nvarchar(250),
@S_CONTACTNUMBERS nvarchar(100),
@S_CONTACTPERSON nvarchar(100),
@ITEMSUBCATID int,
@PRICECODE nvarchar(6)

AS
BEGIN

UPDATE Master.Supplier_Data
SET
[SupplierName] = UPPER(@SUPPLIERNAME),
[S_Address] = @S_ADDRESS,
[S_ContactNumber] =@S_CONTACTNUMBERS ,
[S_ContactPerson] =UPPER(@S_CONTACTPERSON) 
WHERE
[SupplierCode] = @SUPPLIERCODE


IF NOT EXISTS(SELECT * FROM Utility.SUPPLIER_PRICE_RF WHERE SupplierCode = @SUPPLIERCODE AND ItemSubCatID=@ITEMSUBCATID)
BEGIN
  -- INSERT NEW PRICE
  INSERT INTO Utility.SUPPLIER_PRICE_RF
	(SupplierCode, ItemSubCatID,PriceCode)
	VALUES
	(@SUPPLIERCODE,@ITEMSUBCATID,@PRICECODE)
END

--UPDATE PRICE
UPDATE Utility.SUPPLIER_PRICE_RF
SET PriceCode=@PRICECODE
WHERE SupplierCode=@SUPPLIERCODE and ItemSubCatID=@ITEMSUBCATID

END


GO
