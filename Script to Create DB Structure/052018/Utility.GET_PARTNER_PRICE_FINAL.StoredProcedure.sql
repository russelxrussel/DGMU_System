USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[GET_PARTNER_PRICE_FINAL]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Update date: <01/23/2018>
-- Description:	<GET PARTNER PRICE LIST>
-- =============================================
CREATE PROCEDURE [Utility].[GET_PARTNER_PRICE_FINAL] 
AS
BEGIN
	SELECT *, D.PriceAmount as LiempoPrice, E.PriceAmount as LeegPrice, F.PriceAmount as AtsaraPrice
	FROM [Master].[Partners_Data] A
	INNER JOIN [Utility].[Price_RF] B 
	ON A.PriceCode = B.PriceCode
	INNER JOIN [master].[Branch_Data] C 
	ON A.PartnerCode = C.PartnerCode
	LEFT JOIN [Utility].[Price_RF] D
	ON A.Liempo_PriceCode = D.PriceCode
	LEFT JOIN [Utility].[Price_RF] E
	ON A.Leeg_PriceCode = E.PriceCode
	LEFT JOIN [Utility].[Price_RF] F
	ON A.Atsara_PriceCode = F.PriceCode
	
END


GO
