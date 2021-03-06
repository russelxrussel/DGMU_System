USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_PARTNER_PRICE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* User query for Partner Price Setup 
11/5/2017
*/

CREATE PROC [Trans].[GET_PARTNER_PRICE]
AS
BEGIN

 SELECT *
 FROM Utility.Partner_Price_RF A
 INNER JOIN
 Utility.Price_RF B
 ON 
 A.PriceCode = B.PriceCode
 INNER JOIN
 Master.Item_Data C
 ON
 A.ItemCode = C.ItemCode

END

GO
