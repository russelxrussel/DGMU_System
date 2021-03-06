USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_PARTNER_ITEM_FOR_DISTRIBUTION]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/13/2018>
-- Description:	<GET THE LIST OF AVAILABLE ITEM TO BE DISTRIBUTED>
-- =============================================
CREATE PROCEDURE [Trans].[GET_PARTNER_ITEM_FOR_DISTRIBUTION] 
AS
BEGIN
	
	SELECT A.ID,A.PTBNum,A.PartnerCode,A.BranchItemCode, A.TotalQty, A.DistributedQty, A.DateTrans,
	B.PartnerName, C.Branch_ItemName, (Branch_ItemName + '---' + A.PTBNum + '---' + b.PartnerName) as DisplayText
	FROM
	[Trans].[PickUp_Transfer_Branch_Source_TF] A
	LEFT JOIN [Master].[Partners_Data] B
	ON A.PartnerCode = B.PartnerCode
	LEFT JOIN [Master].[Branch_Item_MF] C
	ON A.BranchItemCode = C.Branch_ItemCode
	WHERE A.IsClosed = 0
	ORDER BY A.DateTrans DESC	
		
END


GO
