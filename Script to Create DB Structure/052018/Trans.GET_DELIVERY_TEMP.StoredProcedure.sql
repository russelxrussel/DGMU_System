USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_TEMP]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/20/2017>
-- Description:	<GET LIST OF DELIVERY TODAY>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_TEMP] 
AS
BEGIN
	SELECT *, A.DRNum + '-' + B.BranchName as DRBranch FROM
	[Trans].[Delivery_Status_TF] A
	INNER JOIN
	[Master].[Branch_Data] B
	ON 
	A.BranchCode = B.BranchCode
	INNER JOIN
	[Utility].[Delivery_Schedule_RF] C
	ON
	A.BranchCode = C.BranchCode
	
	WHERE A.IsSet = 0
	
END


GO
