USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[UPDATE_ITEM_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/3/2017>
-- Description:	<UPDATE ITEM DATA>
-- =============================================
CREATE PROCEDURE [Master].[UPDATE_ITEM_DATA]
@ITEMCODE nvarchar(6), 
@ITEMNAME nvarchar(100),
@CONVERSIONQTY float

AS
BEGIN

UPDATE Master.Item_Data
SET
ItemName=UPPER(@ITEMNAME),
ConversionQty=@CONVERSIONQTY
WHERE
ItemCode=@ITEMCODE

END


GO
