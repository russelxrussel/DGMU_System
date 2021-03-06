USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_PREVIOUS_DELIVERY_SCHEDULED_FINAL]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/27/2017>
-- Description:	<GET LIST OF PREVIOUS>
-- =============================================
CREATE PROCEDURE [Trans].[GET_PREVIOUS_DELIVERY_SCHEDULED_FINAL] 
@BRANCHCODE nvarchar(10)
AS
BEGIN
	SELECT TOP 1 *, (A.TotalPriceFresh + a.TotalPriceFrozen) as TotalCost, (A.ConvertedFreshQty + a.ConvertedFrozenQty) as TotalQty
	FROM Trans.Delivery_Reciept_TF A
	INNER JOIN master.Branch_Data B
	ON A.BranchCode = B.BranchCode
	INNER JOIN Utility.Location_Area_RF C
	ON B.LACode = C.LACode
	
	WHERE A.IsScheduled=1  and A.Iscancel = 0 and CONVERT(Date,A.OrderDate, 101) < CONVERT(Date,GETDATE(), 101)
	and A.BranchCode = @BRANCHCODE

	ORDER BY a.OrderDate desc
	
END


GO
