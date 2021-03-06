USE [DGMU]
GO
/****** Object:  StoredProcedure [DMT].[spINSERT_DEBIT_MEMO]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* INSERT DEBIT MEMO REQUEST
03/23/2018
Russel Vasquez
*/

CREATE PROC [DMT].[spINSERT_DEBIT_MEMO]
@DMRNUM nvarchar(15),
@BRANCHCODE nvarchar(10),
@SUPERVISOR nvarchar(50),
@REQUESTFOR nvarchar(50),
@CHARGETO nvarchar(50),
@ASSIGNEDTO nvarchar(50),
@ITEMDESCRIPTION nvarchar(150),
@QUANTITY float,
@AMOUNT float,
@PURPOSE_REMARKS nvarchar(250),
@ATTACHMENT image,
@ISATTACHMENT bit,
@DATEREQUEST datetime

AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	--INSERT TO HEADER
	--CHECK IF ALREADY EXIST
	IF NOT EXISTS(SELECT DMRNUM FROM [DMT].[DebitMemoRequest_Header_TF] WHERE DMRNum=@DMRNUM)
	BEGIN
		INSERT INTO [DMT].[DebitMemoRequest_Header_TF]
		(DMRNum,DateRequest,BranchCode,Supervisor,RequestFor,ChargeTo,AssignedTo)
		VALUES
		(@DMRNUM,@DATEREQUEST,@BRANCHCODE,@SUPERVISOR,@REQUESTFOR,@CHARGETO,@ASSIGNEDTO)
	END

	INSERT INTO [DMT].[DebitMemoRequest_TF]
	(DMRNum, ItemDescription, Quantity, Amount, Purpose_Remarks, Attachment,IsAttachment, DateRequest)
	VALUES
	(@DMRNUM, @ITEMDESCRIPTION, @QUANTITY, @AMOUNT, @PURPOSE_REMARKS, @ATTACHMENT,@ISATTACHMENT, @DATEREQUEST)
	
		
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
