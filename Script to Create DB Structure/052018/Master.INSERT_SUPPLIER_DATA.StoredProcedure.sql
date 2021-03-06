USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[INSERT_SUPPLIER_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<INSERT SUPPLIER DATA>
-- =============================================
CREATE PROCEDURE [Master].[INSERT_SUPPLIER_DATA]
@SUPPLIERCODE nvarchar(10), 
@SUPPLIERNAME nvarchar(100),
@S_ADDRESS nvarchar(250),
@S_CONTACTNUMBERS nvarchar(100),
@S_CONTACTPERSON nvarchar(100),
@ITEMSUBCATID int,
@PRICECODE nvarchar(6)

AS
BEGIN
BEGIN TRY
	BEGIN TRANSACTION

--Condition to avoid multi insertion of the same record.
IF NOT EXISTS(SELECT * FROM Master.Supplier_Data WHERE SupplierCode = @SUPPLIERCODE)
BEGIN
	INSERT INTO 
	Master.Supplier_Data([SupplierCode],[SupplierName],[S_Address],[S_ContactNumber],[S_ContactPerson])
	VALUES
	(UPPER(@SUPPLIERCODE),UPPER(@SUPPLIERNAME),@S_ADDRESS,@S_CONTACTNUMBERS,UPPER(@S_CONTACTPERSON))
END


INSERT INTO Utility.SUPPLIER_PRICE_RF
	(SupplierCode, ItemSubCatID,PriceCode)
	VALUES
	(@SUPPLIERCODE,@ITEMSUBCATID,@PRICECODE)

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END


GO
