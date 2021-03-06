USE [DGMU]
GO
/****** Object:  StoredProcedure [Utility].[INSERT_PARTNER_PRICE_SETUP]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <11/04/2017>
-- Description:	<INSERT PARTNER PRICE LIST>
-- =============================================
CREATE PROCEDURE [Utility].[INSERT_PARTNER_PRICE_SETUP] 
@PARTNERCODE nvarchar(6),
@ITEMCODE nvarchar(6),
@PRICECODE nvarchar(6),
@DESCRIPTION nvarchar(150),
@USERCODE nvarchar(50)

AS
BEGIN
	INSERT INTO [Utility].[Partner_Price_RF]
	(PartnerCode,ItemCode,PriceCode,Description,UserCode)
	VALUES
	(@PARTNERCODE,@ITEMCODE,@PRICECODE,@DESCRIPTION,@USERCODE)
END


GO
