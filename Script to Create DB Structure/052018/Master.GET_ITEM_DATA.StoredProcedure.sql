USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[GET_ITEM_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<GET ITEM LIST>
-- =============================================
CREATE PROCEDURE [Master].[GET_ITEM_DATA] 
AS
BEGIN
	SELECT *
	FROM Master.Item_Data A
	INNER JOIN Utility.UOM_RF B
	ON A.InvUomCode = B.UomCode
	INNER JOIN [Utility].[Price_RF] C
	ON A.PurchasingPriceCode = C.PriceCode
	ORDER BY A.ItemCode
	
END


GO
