USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[GET_STORAGE_AREA_LIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/13/2017>
-- Description:	<GET LIST OF STORAGE AREA>
-- =============================================
CREATE PROCEDURE [Utility].[GET_STORAGE_AREA_LIST] 
AS
BEGIN
	
	SELECT *
	FROM [Utility].[Storage_RF]
	ORDER by StorageName ASC
	
END


GO
