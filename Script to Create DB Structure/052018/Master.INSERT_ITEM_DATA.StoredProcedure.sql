USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[INSERT_ITEM_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<INSERT ITEM DATA>
-- =============================================
CREATE PROCEDURE [Master].[INSERT_ITEM_DATA]
@ITEMCODE nvarchar(6), 
@ITEMNAME nvarchar(100),
@INVUOMCODE nvarchar(6),
@CONVERSIONQTY float

AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

INSERT INTO 
Master.Item_Data(ItemCode,ItemName,InvUomCode,ConversionQty)
VALUES
(UPPER(@ITEMCODE),UPPER(@ITEMNAME),@INVUOMCODE,@CONVERSIONQTY)


--INSERT ON INVENTORY DATA
INSERT INTO master.Inventory_Data(ItemCode, InvUomCode)
VALUES(@ITEMCODE, @INVUOMCODE)

	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END


GO
