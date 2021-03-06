USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[GET_SUPPLIER_PRICE_SETUP]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/30/2017>
-- Description:	<GET SUPPLIER PRICE>
-- =============================================
CREATE PROCEDURE [Utility].[GET_SUPPLIER_PRICE_SETUP] 
AS
BEGIN
	
	SELECT * 
	FROM [Utility].[Supplier_Price_RF] A
	INNER JOIN [Master].[Supplier_Data] B
	ON A.SupplierCode = B.SupplierCode
	INNER JOIN [Utility].Price_RF C
	ON A.PriceCode = C.PriceCode

END


GO
