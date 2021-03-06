USE [DGMU]
GO
/****** Object:  StoredProcedure [HR].[spGET_EMPLOYEE_LIST]    Script Date: 5/2/2018 9:08:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<RUSSEL VASQUEZ>
-- Create date: <02/15/2018>
-- Description:	<GET EMPLOYEE LIST>
-- =============================================
CREATE PROCEDURE [HR].[spGET_EMPLOYEE_LIST]
AS
BEGIN
	
	SELECT *, C.GenderDescription,
	(A.Last_Name + ', ' + A.First_Name + ' ' + LEFT(a.Middle_Name, 1) + '.') as EmployeeName,
	(A.Last_Name + A.First_Name + A.Middle_Name) as SearchText
	FROM [HR].[Employee_MD] A
	INNER JOIN [HR].[Employee_Picture_RF] B
	ON A.EmployeeID = B.EmployeeID
	INNER JOIN [HR].Utility_Gender_RF C
	ON A.GenderCode = C.GenderCode
	LEFT JOIN [HR].[Employee_Employment_Details_MD] D
	ON A.EmployeeID = D.EmployeeID
	LEFT JOIN [HR].Utility_Department_RF E
	ON D.DepartmentCode = E.DepartmentCode
	LEFT JOIN [HR].[Utility_Position_RF] F
	ON D.PositionCode = F.PositionCode
	LEFT JOIN [hr].[Utility_Employment_Status_RF] G
	ON D.EmploymentStatusCode = G.StatusCode
	ORDER BY a.Last_Name ASC
	
	
END


GO
