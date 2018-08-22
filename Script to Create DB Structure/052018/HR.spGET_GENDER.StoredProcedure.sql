USE [DGMU]
GO
/****** Object:  StoredProcedure [HR].[spGET_GENDER]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/13/2018>
-- Description:	<GET GENDER LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_GENDER]
AS
BEGIN
	
	SELECT *
	FROM [HR].[Utility_Gender_RF]
	ORDER BY GENDERCODE desc
	
END


GO
