USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[spGET_HELPER_LIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/21/2018>
-- Description:	<GET LIST OF HELPER>
-- =============================================
CREATE PROCEDURE [Utility].[spGET_HELPER_LIST] 
AS
BEGIN
	SELECT *
	FROM Utility.Helper_RF
	ORDER by HelperName DESC
	
END


GO
