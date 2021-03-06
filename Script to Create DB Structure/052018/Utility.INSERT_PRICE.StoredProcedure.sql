USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[INSERT_PRICE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Description:	<INSERT SELLING PRICE>
-- =============================================
CREATE PROCEDURE [Utility].[INSERT_PRICE] 
@PRICECODE nvarchar(6),
@PRICEAMOUNT float,
@PRICEDESCRIPTION nvarchar(150),
@USERCODE nvarchar(50)
AS
BEGIN
	INSERT INTO Utility.PRICE_RF
	(PriceCode,PriceAmount,PriceDescription,UserCode)
	VALUES
	(@PRICECODE,@PRICEAMOUNT,@PRICEDESCRIPTION,@USERCODE)
END


GO
