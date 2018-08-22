USE [DGMU]
GO
/****** Object:  StoredProcedure [HR].[spGET_EMPLOYMENT_STATUS]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/17/2018>
-- Description:	<GET DESIGNATION LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_EMPLOYMENT_STATUS]
AS
BEGIN
	
	SELECT *
	FROM [HR].[Utility_Employment_Status_RF]
	ORDER BY Status  asc
	
END


GO
