USE [DGMU]
GO
/****** Object:  StoredProcedure [HR].[spGET_CITIZENSHIP]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/14/2018>
-- Description:	<GET CITIZENSHIP LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_CITIZENSHIP]
AS
BEGIN
	
	SELECT *
	FROM [HR].[Utility_CITIZENSHIP_RF]
	ORDER BY ARR ASC
	
	
END


GO
