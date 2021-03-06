USE [DGMU]
GO
/****** Object:  StoredProcedure [DMT].[GET_BRANCH_LIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/23/2018>
-- Description:	<GET LIST BRANCHES>
-- =============================================
CREATE PROCEDURE [DMT].[GET_BRANCH_LIST] 
AS
BEGIN
	SELECT *, A.BranchName + B.PartnerName as SearchText FROM
	Master.Branch_Data A
	INNER JOIN Master.Partners_Data B
	ON A.PartnerCode = b.PartnerCode
	order by a.BranchName
END


GO
