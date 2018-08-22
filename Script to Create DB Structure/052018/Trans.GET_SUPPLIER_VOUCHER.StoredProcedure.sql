USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[GET_SUPPLIER_VOUCHER]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* User query for Partner Price Setup 
11/13/2017
*/

CREATE PROC [Trans].[GET_SUPPLIER_VOUCHER]
AS
BEGIN

 SELECT *
 FROM [Trans].[Supplier_Voucher_Hdr_TF]
 order by VoucherNum desc

END

GO
