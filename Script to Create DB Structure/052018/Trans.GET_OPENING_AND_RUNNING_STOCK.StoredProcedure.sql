USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_OPENING_AND_RUNNING_STOCK]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--IMPORTANT
--RUSSEL VASQUEZ
--DISPLAY OPENING AGAINST CURRENT
CREATE PROC [Trans].[GET_OPENING_AND_RUNNING_STOCK]
@SELECTEDDATE datetime

AS
BEGIN


DECLARE @PREVIOUSDATE datetime
--SET @PREVIOUSDATE = (SELECT dateadd(day,datediff(day,1,@SELECTEDDATE),0))
SET @PREVIOUSDATE = (Select TOP 1 EndDate FROM Trans.Inventory_Ending_Stock_TF Where CONVERT(date,EndDate, 101) < CONVERT(date,@SELECTEDDATE, 101)   Order By EndDate Desc)

Select a.ItemCode, a.ItemName, b.endquantity as Opening_Stock, (select endQuantity from Trans.Inventory_Ending_Stock_TF where ItemCode = a.ItemCode and EndDate=CONVERT(date,@SELECTEDDATE, 101)) as Current_Stock,
ISNULL((Select SUM(Out_Stock) FROM Trans.Inventory_Running_Stock_TF Where ItemCode=a.ItemCode and CONVERT(date,DateTrans, 101) = CONVERT(date,@SELECTEDDATE, 101)), 0) as Stock_Out,
ISNULL((Select SUM(In_Stock) FROM Trans.Inventory_Running_Stock_TF Where ItemCode=a.ItemCode and CONVERT(date,DateTrans, 101) = CONVERT(date,@SELECTEDDATE, 101)), 0) as Stock_In,
ISNULL((Select TOP 1 Running_Stock FROM Trans.Inventory_Running_Stock_TF Where ItemCode=a.ItemCode and CONVERT(date,DateTrans, 101) = CONVERT(date,@SELECTEDDATE, 101) ORDER by DateTrans desc), 0) as Running_Stock
FROM
Master.Item_Data A
LEFT JOIN trans.Inventory_Ending_Stock_TF B
ON A.ItemCode = B.ItemCode
WHERE EndDate=@PREVIOUSDATE

END
GO
