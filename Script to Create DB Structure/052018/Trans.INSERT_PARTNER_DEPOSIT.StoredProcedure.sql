USE [DGMU]
GO
/****** Object:  StoredProcedure [Trans].[INSERT_PARTNER_DEPOSIT]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* INSERT PARTNER DEPOSIT
11/22/2017
Russel Vasquez
*/

CREATE PROC [Trans].[INSERT_PARTNER_DEPOSIT]
@DEPOSITNUM nvarchar(10),
@PARTNERCODE nvarchar(6),
@DEPOSITAMOUNT FLOAT,
@DEPOSITDATE datetime,
@CHEQUENUMBER nvarchar(50),
@BANK nvarchar(50),
@REMARKS nvarchar(250),
@USERCODE nvarchar(50)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO [Trans].[Partner_Deposit_TF]
	(DepositNum, PartnerCode, DepositAmount, DepositDate, ChequeNumber, Bank, Remarks, UserCode)
	VALUES
	(@DEPOSITNUM,@PARTNERCODE,@DEPOSITAMOUNT,@DEPOSITDATE,@CHEQUENUMBER,@BANK,@REMARKS,@USERCODE)

	EXEC xSystem.UPDATE_SERIES_NUMBER 'PD'
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
