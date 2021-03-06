USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_PARTNER_PO_TRANS_HDR]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Insert New Purchaes Request
10/25/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_PARTNER_PO_TRANS_HDR]
@PONUM nvarchar(10),
@PARTNERCODE nvarchar(10),
@REQUESTDATE datetime,
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

INSERT INTO Trans.Partner_PO_Hdr(PONum,PartnerCode,  RequestDate, Remarks, UserCode)
VALUES(@PONum,@PARTNERCODE, @REQUESTDATE, @REMARKS, @USERCODE)

--AUDIT
--	EXEC xSys.SP_AUDIT_LOG @PONUM, 'CREATED NEW PO', 'PO Module', @USERCODE


	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
