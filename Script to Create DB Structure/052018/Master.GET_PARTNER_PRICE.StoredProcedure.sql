USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[GET_PARTNER_PRICE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/09/2018>
-- Description:	<GET PARTNER ITEM PRICE>
-- =============================================
CREATE PROCEDURE [Master].[GET_PARTNER_PRICE] 
AS
BEGIN
	SELECT A.PartnerCode, B.ItemCode, B.PriceCode
	FROM master.Partners_Data A
	INNER JOIN Utility.Partner_Price_RF B
	ON A.PartnerCode = B.PartnerCode 
END


GO
