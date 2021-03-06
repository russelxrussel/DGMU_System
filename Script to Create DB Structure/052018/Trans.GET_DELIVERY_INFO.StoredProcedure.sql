USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_DELIVERY_INFO]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <01/26/2018>
-- Description:	<GET DELIVERY INFO>
-- =============================================
CREATE PROCEDURE [Trans].[GET_DELIVERY_INFO] 
@LACODE nvarchar(10),
@DELIVERYORDER datetime 
AS
BEGIN
	SELECT * FROM
	[Trans].[Delivery_Info] A
	LEFT JOIN [Utility].Driver_RF B
	ON A.T1Driver1 = B.DriverID
	LEFT JOIN Utility.Helper_RF C
	ON A.T1Helper1 = C.HelperID
	LEFT JOIN Utility.Vehicle_RF D
	ON A.T1Vehicle = D.PlateID
	WHERE	
	CONVERT(Date, DeliveryOrder, 101) = @DELIVERYORDER
	AND LACode = @LACODE
	
END


GO
