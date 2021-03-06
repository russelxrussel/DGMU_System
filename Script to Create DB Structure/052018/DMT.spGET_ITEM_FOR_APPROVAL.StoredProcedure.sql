USE [DGMU]
GO
/****** Object:  StoredProcedure [DMT].[spGET_ITEM_FOR_APPROVAL]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <03/27/2018>
-- Description:	<GET FOR APPROVAL LIST ITEM>
-- =============================================
CREATE PROCEDURE [DMT].[spGET_ITEM_FOR_APPROVAL]
@DMRNUM nvarchar(15)
AS
BEGIN
	
	SELECT ID,ItemDescription, Quantity, Amount, Purpose_Remarks,RequestStatus
	FROM DMT.DebitMemoRequest_TF
	WHERE RequestStatus <> 'A' and RequestStatus <> 'R' and DMRNum = @DMRNUM
	
END


GO
