USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_LIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/20/2017>
-- Description:	<GET LIST PARTNERS>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_LIST] 
AS
BEGIN
	SELECT *, C.LACode + '-' + c.LAName as LocationArea FROM
	[Trans].[Delivery_Status_TF] A
	INNER JOIN
	[Master].[Branch_Data] B
	ON 
	A.BranchCode = B.BranchCode
	INNER JOIN
	[Utility].Location_Area_RF C
	ON
	B.LACode = C.LACode
	
	WHERE A.IsSet = 1 and Iscancel = 0 and CONVERT(Date,DeliveryDateToday, 101) = CONVERT(Date,getDate(), 101)
	
END


GO
