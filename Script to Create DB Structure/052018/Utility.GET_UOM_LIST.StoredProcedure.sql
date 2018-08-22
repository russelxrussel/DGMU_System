USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[GET_UOM_LIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<GET LIST OF UOM>
-- =============================================
CREATE PROCEDURE [Utility].[GET_UOM_LIST] 
AS
BEGIN
	SELECT *
	FROM Utility.UOM_RF
	ORDER by UOMID ASC
	
END


GO
