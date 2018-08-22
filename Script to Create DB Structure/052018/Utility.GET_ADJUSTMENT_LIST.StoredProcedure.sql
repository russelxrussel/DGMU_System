USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[GET_ADJUSTMENT_LIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/19/2017>
-- Description:	<GET LIST OF ADJUSTMENT>
-- =============================================
CREATE PROCEDURE [Utility].[GET_ADJUSTMENT_LIST]
AS
BEGIN
	SELECT *
	FROM Utility.Adjustment_RF
	ORDER BY Arrangement
	
END


GO
