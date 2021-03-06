USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_ITEM_RUNNING_STOCK]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--IMPORTANT
--RUSSEL VASQUEZ
--DISPLAY ITEM RUNNING TRANSACTION LOGS
CREATE PROC [Trans].[GET_ITEM_RUNNING_STOCK]
@SELECTEDDATE datetime
AS
BEGIN

SELECT A.ItemCode, A.ItemName, B.In_Stock, B.Out_Stock, B.Reference,ISNULL(X.SupplierName,(ISNULL(I2.BranchName,ISNULL(d.BranchName,E.PTNUM + '-' + F.PartnerName)))) as ReferenceText FROM
Master.Item_Data A
LEFT JOIN Trans.Inventory_Running_Stock_TF B
ON A.ItemCode = B.ItemCode
LEFT JOIN Trans.Delivery_Reciept_TF C
ON B.Reference = C.DRNum
LEFT JOIN Master.Branch_Data D
ON C.BranchCode = D.BranchCode
LEFT JOIN Trans.Pickup_Transfer_TF E
ON B.Reference = E.PTNum
LEFT JOIN Master.Partners_Data F
ON E.PartnerCode = F.PartnerCode
LEFT JOIN Trans.Direct_Receiving_Hdr_TF H
ON b.Reference = H.IRNum
LEFT JOIN Master.Supplier_Data X
ON H.SupplierCode = X.SupplierCode
LEFT JOIN TRANS.Stock_Branch_Return_TF I
ON B.Reference = I.SRNum
LEFT JOIN Master.Branch_Data I2
ON I.BranchCode = I2.BranchCode
WHERE CONVERT(date,b.DateTrans, 101) = CONVERT(date,@SELECTEDDATE, 101)
ORDER BY B.DateTrans DESC

END
GO
