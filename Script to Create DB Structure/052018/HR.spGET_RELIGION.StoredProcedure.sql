USE [DGMU]
GO
/****** Object:  StoredProcedure [HR].[spGET_RELIGION]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/13/2018>
-- Description:	<GET RELIGION LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_RELIGION]
AS
BEGIN
	
	SELECT *
	FROM [HR].[Utility_Religion_RF]
	ORDER BY Religion desc
	
END


GO
