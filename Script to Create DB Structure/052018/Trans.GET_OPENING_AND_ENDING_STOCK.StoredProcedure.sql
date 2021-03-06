USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_OPENING_AND_ENDING_STOCK]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--IMPORTANT
--RUSSEL VASQUEZ
--DISPLAY OPENING AGAINST CURRENT
--VERSION 2
CREATE PROC [Trans].[GET_OPENING_AND_ENDING_STOCK]
@SELECTEDDATE datetime

AS
BEGIN


SELECT A.ItemCode, A.ItemName,B.Opening, B.Stock_In, B.Stock_Out, B.Ending
FROM
Master.Item_Data A
LEFT JOIN [Trans].[Inventory_Opening_Ending_TF] B
ON A.ItemCode = B.ItemCode
WHERE CONVERT(date,DI,101)= CONVERT(date,@SELECTEDDATE,101)

END
GO
