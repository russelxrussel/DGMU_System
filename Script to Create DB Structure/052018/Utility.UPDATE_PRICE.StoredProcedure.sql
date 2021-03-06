USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[UPDATE_PRICE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Description:	<INSERT SELLING PRICE>
-- =============================================
CREATE PROCEDURE [Utility].[UPDATE_PRICE] 
@PRICECODE nvarchar(6),
@PRICEAMOUNT float,
@PRICEDESCRIPTION nvarchar(150),
@USERCODE nvarchar(50)
AS
BEGIN
	 UPDATE Utility.PRICE_RF
	 SET
	 PriceAmount=@PRICEAMOUNT,PriceDescription=@PRICEDESCRIPTION, UserCode=@USERCODE
	WHERE
	PriceCode= @PRICECODE
END


GO
