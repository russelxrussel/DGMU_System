USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_SCHEDULED_FINAL]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/11/2017>
-- Description:	<GET LIST OF SELECTED DELIVERY>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_SCHEDULED_FINAL] 
@DATEDELIVER datetime 
AS
BEGIN
	SELECT *, (A.ConvertedFreshQty + a.ConvertedFrozenQty) as TotalQty,
	(X.DriverName + '/' + X.HelperName + '---' + X.VehiclePlateNumber) as DelInfo 
	FROM Trans.Delivery_Reciept_TF A
	INNER JOIN master.Branch_Data B
	ON A.BranchCode = B.BranchCode
	INNER JOIN Utility.Location_Area_RF C
	ON B.LACode = C.LACode
	LEFT JOIN Trans.Delivery_Info X
	ON B.LACode = X.LACode AND a.OrderDate = X.DeliveryOrder
	
	WHERE A.IsScheduled=1  and A.Iscancel = 0 and CONVERT(Date,A.OrderDate, 101) = CONVERT(Date,@DATEDELIVER, 101)
	
END


GO
