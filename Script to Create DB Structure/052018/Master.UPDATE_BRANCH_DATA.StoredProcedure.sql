USE [DGMU]
GO
/****** Object:  StoredProcedure [Master].[UPDATE_BRANCH_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <10/24/2017>
-- Description:	<UPDATE BRANCH DATA>
-- =============================================
CREATE PROCEDURE [Master].[UPDATE_BRANCH_DATA]
@BRANCHCODE nvarchar(6), 
@PARTNERCODE nvarchar(6),
@LACODE nvarchar(6),
@BRANCHNAME nvarchar(100),
@B_ADDRESS nvarchar(250),
@B_CONTACTNUMBERS nvarchar(100),
@SUPERVISOR nvarchar(100)

AS
BEGIN

UPDATE Master.Branch_Data
SET
PartnerCode=@PARTNERCODE,
BranchName=UPPER(@BRANCHNAME),
LACode=@LACODE,
B_Address=@B_ADDRESS,
B_ContactNumbers=@B_CONTACTNUMBERS,
Supervisor=UPPER(@SUPERVISOR)
WHERE
BranchCode=@BRANCHCODE

END


GO
