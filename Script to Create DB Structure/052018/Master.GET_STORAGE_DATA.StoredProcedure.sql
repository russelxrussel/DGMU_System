USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[GET_STORAGE_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/13/2017>
-- Description:	<GET STORAGE DATA>
-- =============================================
CREATE PROCEDURE [Master].[GET_STORAGE_DATA] 
AS
BEGIN
	SELECT * FROM
	Master.Storage_Data A
	INNER JOIN
	Utility.Storage_RF B
	ON A.StorageCode = B.StorageCode
	INNER JOIN
	Master.Item_Data C
	ON A.ItemCode = C.ItemCode
	ORDER BY B.StorageID,C.ItemID,  C.ItemName
END


GO
