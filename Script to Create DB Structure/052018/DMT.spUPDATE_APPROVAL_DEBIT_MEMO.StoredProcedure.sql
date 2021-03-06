USE [DGMU]
GO
/****** Object:  StoredProcedure [DMT].[spUPDATE_APPROVAL_DEBIT_MEMO]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* UPDATE APPROVAL
03/28/2018
Rev. 04/02/2018
Russel Vasquez
*/

CREATE PROC [DMT].[spUPDATE_APPROVAL_DEBIT_MEMO]
@DMRNUM nvarchar(15),
@REQUESTSTATUS nvarchar(1),
@ID int,
@APPROVER_NOTES nvarchar(250)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	UPDATE DMT.DebitMemoRequest_TF
	SET RequestStatus = @REQUESTSTATUS, DateApproved=getdate()
	WHERE ID = @ID
	
	UPDATE DMT.DebitMemoRequest_Header_TF
	SET Approver_Notes = @APPROVER_NOTES
	WHERE DMRNum = @DMRNUM
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
