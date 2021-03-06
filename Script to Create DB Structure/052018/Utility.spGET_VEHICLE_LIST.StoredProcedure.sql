USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[spGET_VEHICLE_LIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/21/2018>
-- Revised <02/23/2018>
-- Description:	<GET LIST OF VEHICLE>
-- =============================================
CREATE PROCEDURE [Utility].[spGET_VEHICLE_LIST] 
AS
BEGIN

	SELECT *, (PlateNumber + ' **LoadCap(' + Convert(nvarchar(25),LoadCapacity)  + ')') as Plate_CapLoad
	FROM [Utility].[Vehicle_RF]
	ORDER by PlateNumber ASC
	
END


GO
