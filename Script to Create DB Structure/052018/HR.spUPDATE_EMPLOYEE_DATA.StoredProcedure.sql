USE [DGMU]
GO
/****** Object:  StoredProcedure [HR].[spUPDATE_EMPLOYEE_DATA]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* UPDATE Employee Record
02/17/2018
Russel Vasquez
*/

CREATE PROC [HR].[spUPDATE_EMPLOYEE_DATA]
@EMPLOYEEID nvarchar(10),
--@LAST_NAME nvarchar(25),
--@FIRST_NAME nvarchar(25),
--@MIDDLE_NAME nvarchar(25),
--@NICK_NAME nvarchar(20),
--@GENDERCODE nvarchar(1),
--@DATE_OF_BIRTH datetime,
--@PLACE_OF_BIRTH nvarchar(100),
--@WEIGHT nvarchar(10),
--@HEIGHT nvarchar(10),
--@LANDLINE_NUMBER nvarchar(50),
--@MOBILE_NUMBER nvarchar(50),
--@RELIGIONCODE nvarchar(3),
--@CITIZENSHIPCODE nvarchar(3),
--@PRESENT_ADDRESS nvarchar(150),
--@PROVINCIAL_ADDRESS nvarchar(150),
--@TIN nvarchar(20),
--@SSS nvarchar(20),
--@HDMF nvarchar(20),
--@PHILHEALTH nvarchar(20),
--@DATE_HIRED datetime,
--@DEPARTMENTCODE nvarchar(3),
--@POSITIONCODE nvarchar(3),
--@EMPLOYMENTSTATUSCODE nvarchar(5),
@SIZE int,
@IMAGE_DATA varbinary(max)

AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION
	
	----Insert New Employee Record
	--INSERT INTO [HR].[Employee_MD] 
	--(EmployeeID, Last_Name, First_Name, Middle_Name, Nick_Name, GenderCode, Date_Of_Birth, Place_Of_Birth, Weight, Height, Landline_Number, Mobile_Number, ReligionCode, CitizenshipCode, Present_Address, Provincial_Address)
	--VALUES
	--(@EMPLOYEEID,UPPER(@LAST_NAME),UPPER(@FIRST_NAME),UPPER(@MIDDLE_NAME),@NICK_NAME,@GENDERCODE,@DATE_OF_BIRTH,@PLACE_OF_BIRTH,@WEIGHT,@HEIGHT, @LANDLINE_NUMBER,@MOBILE_NUMBER, @RELIGIONCODE, @CITIZENSHIPCODE,@PRESENT_ADDRESS,@PROVINCIAL_ADDRESS)
	

	----Insert Record in Employment Details
	--INSERT INTO [HR].[Employee_Employment_Details_MD]
	--(EmployeeID, TIN, SSS, HDMF, PhilHealth, Date_Hired, DepartmentCode, PositionCode, EmploymentStatusCode)
	--VALUES
	--(@EMPLOYEEID,@TIN, @SSS, @HDMF, @PHILHEALTH, @DATE_HIRED, @DEPARTMENTCODE, @POSITIONCODE, @EMPLOYMENTSTATUSCODE)

	--INSERT Employee Image
	--INSERT INTO [HR].[Employee_Picture_RF] (EmployeeID, Picture_Name, Size, Image_Data)
	--VALUES (@EMPLOYEEID,@LAST_NAME + ', ' + @FIRST_NAME, @SIZE, @IMAGE_DATA)

	UPDATE [HR].[Employee_Picture_RF]
	SET SIZE = @SIZE, Image_Data = @IMAGE_DATA
	WHERE
	EmployeeID = @EMPLOYEEID

--	EXEC xSystem.UPDATE_SERIES_NUMBER 'EMP'
	COMMIT TRANSACTION
END TRY

BEGIN CATCH

	ROLLBACK TRANSACTION -- Will not commit changes on all tables

END CATCH

END

GO
