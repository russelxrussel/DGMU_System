USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[UPDATE_STOCK_INVENTORY_FROM_SUPPLIER]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE STOCK ITEM IN INVENTORY FROM SUPPLIER 
10/26/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_STOCK_INVENTORY_FROM_SUPPLIER]
@ITEMCODE nvarchar(10),
@QTY float
AS
BEGIN

UPDATE MASTER.Inventory_Data
SET InStock = InStock + @QTY, 
RunningStock = RunningStock + @QTY, dateUpdate=GETDATE()
WHERE ItemCode=@ITEMCODE

END

GO
