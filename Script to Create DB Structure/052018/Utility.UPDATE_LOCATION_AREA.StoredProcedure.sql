USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[UPDATE_LOCATION_AREA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Description:	<UPDATE LOCATION AREA>
-- =============================================
CREATE PROCEDURE [Utility].[UPDATE_LOCATION_AREA] 
@LACODE nvarchar(6),
@LANAME nvarchar(150),
@USERCODE nvarchar(50)
AS
BEGIN
	 UPDATE Utility.Location_Area_RF
	 SET
	 LAName=@LANAME, UserCode=@USERCODE
	WHERE
	LACode=@LACODE
END


GO
