USE [DGMU]
GO
/****** Object:  StoredProcedure [xSystem].[CHECK_DELIVERY_DATE_EXIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/21/2017>
-- Description:	<CHECK DELIVERY DATE EXIST ON THE LIST>
-- =============================================
CREATE PROCEDURE [xSystem].[CHECK_DELIVERY_DATE_EXIST]
@DATE datetime 
AS
BEGIN
	SELECT *
	FROM [xSystem].[Delivery_Date_RF]
	WHERE CONVERT(date,datedeliverylist) = Convert(date,@DATE)
END


GO
