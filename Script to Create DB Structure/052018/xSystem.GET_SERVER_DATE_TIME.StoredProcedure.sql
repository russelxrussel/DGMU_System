USE [DGMU]
GO
/****** Object:  StoredProcedure [xSystem].[GET_SERVER_DATE_TIME]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/3/2017>
-- Description:	<GET SERVER DATE AND TIME>
-- =============================================
CREATE PROCEDURE [xSystem].[GET_SERVER_DATE_TIME] 
AS
BEGIN
	SELECT GETDATE() as SERVER_DATE_TIME

END



GO
