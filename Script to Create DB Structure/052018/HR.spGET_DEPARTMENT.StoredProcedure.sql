USE [DGMU]
GO
/****** Object:  StoredProcedure [HR].[spGET_DEPARTMENT]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/17/2018>
-- Description:	<GET DEPARTMENT LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_DEPARTMENT]
AS
BEGIN
	
	SELECT *
	FROM [HR].[Utility_Department_RF]
	ORDER BY Department desc
	
END


GO
