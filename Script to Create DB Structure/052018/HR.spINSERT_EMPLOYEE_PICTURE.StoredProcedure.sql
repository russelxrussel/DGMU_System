USE [DGMU]
GO
/****** Object:  StoredProcedure [HR].[spINSERT_EMPLOYEE_PICTURE]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/12/2018>
-- Description:	<STORING EMPLOYEE IMAGE>
-- =============================================
CREATE PROCEDURE [HR].[spINSERT_EMPLOYEE_PICTURE]
@EMPLOYEEID nvarchar(10),
@PICTURE_NAME nvarchar(255),
@SIZE int,
@IMAGE_DATA varbinary(max)

AS
BEGIN
	INSERT INTO [HR].[Employee_Picture_RF] (EmployeeID, Picture_Name, Size, Image_Data)
	VALUES (@EMPLOYEEID,@PICTURE_NAME, @SIZE, @IMAGE_DATA)
	
	--SELECT @NEW_ID = SCOPE_IDENTITY()
END


GO
