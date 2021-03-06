USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[GET_PARTNERS_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/20/2017>
-- Description:	<GET LIST PARTNERS>
-- =============================================
CREATE PROCEDURE [Master].[GET_PARTNERS_DATA] 
AS
BEGIN
	--SELECT *, C.PriceCode as LiempoPriceCode, C.PriceAmount as LiempoPrice, D.PriceCode as LeegPriceCode, D.PriceAmount as LeegPriceAmount,
	--E.PriceCode as AtsaraPriceCode, E.PriceAmount as AtsaraPriceAmount
	--FROM Master.Partners_Data A
	--LEFT JOIN 
	--Utility.Price_RF B
	--ON 
	--A.PriceCode = B.PriceCode
	--LEFT JOIN Utility.Price_RF C
	--ON 
	--A.Liempo_PriceCode = C.PriceCode
	--LEFT JOIN Utility.Price_RF D
	--ON 
	--A.Leeg_PriceCode = D.PriceCode
	--LEFT JOIN Utility.Price_RF E
	--ON
	--A.Atsara_PriceCode = E.PriceCode

	SELECT *
	FROM MASTER.Partners_Data
	ORDER by PartnerName
END


GO
