USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[UPDATE_SUPPLIER_PO_HDR_STATUS]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* UPDATE PO STATUS 
10/26/2017
Russel Vasquez
*/

CREATE PROC [Trans].[UPDATE_SUPPLIER_PO_HDR_STATUS]
@PONUM NVARCHAR(10),
@DOCSTATUS nvarchar(1)
AS
BEGIN

UPDATE [Trans].[Supplier_PO_Hdr]
SET DocStatus = @DOCSTATUS
WHERE PONum=@PONUM

END

GO
