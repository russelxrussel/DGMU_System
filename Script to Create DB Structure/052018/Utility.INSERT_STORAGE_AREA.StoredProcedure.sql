USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[INSERT_STORAGE_AREA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/07/2017>
-- Description:	<INSERT STORAGE AREA>
-- =============================================
CREATE PROCEDURE [Utility].[INSERT_STORAGE_AREA] 
@STORAGECODE nvarchar(6),
@STORAGENAME nvarchar(150),
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN
	INSERT INTO Utility.Storage_RF
	(StorageCode, StorageName, Remarks,UserCode)
	VALUES
	(@STORAGECODE,@STORAGENAME,@REMARKS,@USERCODE)
END


GO
