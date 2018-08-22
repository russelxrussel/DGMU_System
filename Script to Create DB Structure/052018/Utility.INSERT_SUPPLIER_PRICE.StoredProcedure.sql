USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[INSERT_SUPPLIER_PRICE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/30/2017>
-- Description:	<INSERT PURCHASING PRICE>
-- =============================================
CREATE PROCEDURE [Utility].[INSERT_SUPPLIER_PRICE] 
@SUPPLIERCODE nvarchar(6),
@ITEMSUBCATID int,
@PRICECODE nvarchar(6)
AS
BEGIN
	INSERT INTO Utility.INSERT_SUPPLIER_PRICE
	(SupplieCode, ItemSubCatID,PriceCode)
	VALUES
	(@SUPPLIERCODE,@ITEMSUBCATID,@PRICECODE)
END


GO
