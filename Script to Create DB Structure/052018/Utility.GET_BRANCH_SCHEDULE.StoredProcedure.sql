USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[GET_BRANCH_SCHEDULE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/13/2017>
-- Description:	<GET LIST OF BRANCH SCHEDULE>
-- =============================================
CREATE PROCEDURE [Utility].[GET_BRANCH_SCHEDULE] 
AS
BEGIN
	SELECT *
	FROM 
	[Master].[Branch_Data] A
	INNER JOIN
	[Utility].[Delivery_Schedule_RF] B
	ON
	A.BranchCode = B.BranchCode
	ORDER BY A.BranchName ASC
END


GO
