USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[GET_PARTNER_PRICE_SETUP]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Description:	<GET PARTNER PRICE LIST>
-- =============================================
CREATE PROCEDURE [Utility].[GET_PARTNER_PRICE_SETUP] 
AS
BEGIN
	SELECT *
	FROM [Utility].[Partner_Price_RF] A
	INNER JOIN [Master].[Partners_Data] B
	ON A.PartnerCode = B.PartnerCode
	INNER JOIN [Master].[Item_Data] C
	ON A.ItemCode = C.ItemCode
	INNER JOIN [Utility].[Price_RF] D
	ON A.PriceCode = D.PriceCode
	
END


GO
