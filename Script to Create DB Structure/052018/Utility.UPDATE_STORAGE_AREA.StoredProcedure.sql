USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[UPDATE_STORAGE_AREA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/13/2017>
-- Description:	<UPDATE STORAGE AREA>
-- =============================================
CREATE PROCEDURE [Utility].[UPDATE_STORAGE_AREA] 
@STORAGECODE nvarchar(6),
@STORAGENAME nvarchar(150),
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN
	UPDATE Utility.Storage_RF
	SET 
	StorageName = @STORAGENAME,
	Remarks = @REMARKS,
	DU = getdate(),
	UserCode = @USERCODE
	WHERE
	StorageCode = @STORAGECODE
END


GO
