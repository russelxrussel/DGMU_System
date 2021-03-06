USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[GET_SUPPLIER_PRICE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/04/2017>
-- Description:	<GET SUPPLIER ITEM PRICE>
-- =============================================
CREATE PROCEDURE [Utility].[GET_SUPPLIER_PRICE] 
AS
BEGIN
	SELECT *, (X.ItemName + ' - ' + C.ItemSubName) as Chicken_Desc
	FROM master.Supplier_Data A
	INNER JOIN
	Utility.Supplier_Price_RF B
	ON A.SupplierCode = B.SupplierCode
	INNER JOIN Utility.Item_SubCat_RF C
	ON B.ItemSubCatID = C.ItemSubCatID
	INNER JOIN master.Item_Data X
	ON C.ItemCode = X.ItemCode
	INNER JOIN Utility.Price_RF D
	ON B.PriceCode = D.PriceCode

	
END


GO
