USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_INPUT_FINAL]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <12/6/2017>
-- Update date: <01/29/2018> / <02/09/2018>
-- Description:	<GET DELIVERY INPUT>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_INPUT_FINAL] 
AS
BEGIN
	
	SELECT *, (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM001') as FreshConversion, 
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM002') as FrozenConversion,
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM003') as LiempoConversion, 
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM004') as LeegConversion,
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM005') as Atsara100Conversion,
	 (Select ConversionQty from Master.Item_Data where ItemCode = 'ITM006') as Atsara160Conversion,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM001') as FreshCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM002') as FrozenCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM003') as LiempoCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM004') as LeegCode,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM005') as Atsara100Code,
	 (Select ItemCode from Master.Item_Data where ItemCode = 'ITM006') as Atsara160Code,
	 F.PriceAmount as LiempoPrice, G.PriceAmount as LeegPrice, H.PriceAmount as AtsaraPrice
	 FROM
	MASTER.Branch_Data A
	INNER JOIN MASTER.Partners_Data B
	ON A.PartnerCode = B.PartnerCode
	INNER JOIN Utility.Location_Area_RF C
	ON A.LACode = C.LACode
	INNER JOIN Utility.Price_RF D
	ON B.PriceCode = D.PriceCode
	INNER JOIN Utility.Delivery_Schedule_RF E
	ON A.BranchCode = E.BranchCode
	LEFT JOIN Utility.Price_RF F
	ON B.Liempo_PriceCode = F.PriceCode
	LEFT JOIN Utility.Price_RF G
	ON B.Leeg_PriceCode = G.PriceCode
	LEFT JOIN Utility.Price_RF H
	ON B.Atsara_PriceCode = H.PriceCode
END


GO
