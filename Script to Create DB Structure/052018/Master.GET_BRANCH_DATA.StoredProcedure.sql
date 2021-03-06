USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[GET_BRANCH_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<GET LIST BRANCHES>
-- =============================================
CREATE PROCEDURE [Master].[GET_BRANCH_DATA] 
AS
BEGIN
	SELECT *, A.BranchName + B.PartnerName as SearchText FROM
	Master.Branch_Data A
	INNER JOIN Master.Partners_Data B
	ON A.PartnerCode = b.PartnerCode
	INNER JOIN Utility.Location_Area_RF C
	ON A.LACode = C.LACode
	ORDER by C.LAName, A.BranchName
END


GO
