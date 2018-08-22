USE [DGMU]
GO
/****** Object:  StoredProcedure [DMT].[spGET_REQUEST_STATUS]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/27/2018>
-- Description:	<GET REQUEST STATUS>
-- =============================================
CREATE PROCEDURE [DMT].[spGET_REQUEST_STATUS]
AS
BEGIN
	
	SELECT RequestStatus, RequestDescription
	FROM DMT.Request_Status_RF
	WHERE TYPE = 1
	ORDER BY RequestStatus
	
END


GO
