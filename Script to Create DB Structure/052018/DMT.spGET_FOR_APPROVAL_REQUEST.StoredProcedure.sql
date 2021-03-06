USE [DGMU]
GO
/****** Object:  StoredProcedure [DMT].[spGET_FOR_APPROVAL_REQUEST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/27/2018>
-- Description:	<GET FOR APPROVAL LIST ITEM>
-- =============================================
CREATE PROCEDURE [DMT].[spGET_FOR_APPROVAL_REQUEST]
AS
BEGIN
	
	SELECT A.DMRNum, cONVERT(date, A.DateRequest) as DateRequest, B.BranchName, A.Supervisor 
	FROM [DMT].[DebitMemoRequest_Header_TF] A
	LEFT JOIN Master.Branch_Data B
	ON A.BranchCode = B.BranchCode
	WHERE A.IsCompleted = 0
	ORDER BY A.DateRequest DESC
	
END


GO
