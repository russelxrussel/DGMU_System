USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_PARTNER_PAYABLE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/22/2017>
-- Description:	<GET PAYABLE LIST>
-- =============================================
CREATE PROCEDURE [Trans].[GET_PARTNER_PAYABLE] 
AS
BEGIN
	SELECT A.ORDERDATE, B.PartnerCode, SUM(A.TotalPriceFresh + A.TotalPriceFrozen + A.TotalLiempoCost) as PayableAmount,
	A.TotalPriceFresh as Fresh_Cost, A.TotalPriceFrozen as Frozen_Cost, A.TotalLiempoCost as Liempo_Cost
	FROM [Trans].[Delivery_Reciept_TF] A
	INNER JOIN [Master].[Branch_Data] B
	ON A.BranchCode = B.BranchCode
	WHERE a.IsCancel = 0
	GROUP BY A.ORDERDATE, B.PartnerCode, A.TotalPriceFresh, A.TotalPriceFrozen, A.TotalLiempoCost
	ORDER BY A.OrderDate DESC
END


GO
