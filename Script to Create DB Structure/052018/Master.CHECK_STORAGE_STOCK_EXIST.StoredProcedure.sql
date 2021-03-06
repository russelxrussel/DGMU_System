USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[CHECK_STORAGE_STOCK_EXIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/13/2017>
-- Description:	<CHECK BRANCH STOCK>
-- =============================================

CREATE PROCEDURE [Master].[CHECK_STORAGE_STOCK_EXIST]
@STORAGECODE nvarchar(6),
@ITEMCODE nvarchar(6)
AS
BEGIN

	SELECT CASE WHEN EXISTS(SELECT * FROM [Master].[Storage_Data]
	WHERE StorageCode=@STORAGECODE and ItemCode=@ITEMCODE)
	THEN CAST(1 AS BIT)
	ELSE CAST(0 AS BIT)
	END

END

GO
