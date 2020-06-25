

CREATE PROCEDURE DullAsANull
	@CategoryName nvarchar(100) = '',
	@After Datetime = NULL,
	@CategoryID INT = NULL
AS
	SELECT  C.CategoryName ,E.EventDate, C.CategoryID
	FROM tblCategory C
	JOIN tblEvent E ON C.CategoryID = E.CategoryID
	Where C.CategoryName LIKE '%'+@CategoryName+'%' AND (@CategoryID IS NULL OR C.CategoryID = @CategoryID) AND (@After IS NULL OR E.EventDate >= @After)
	ORDER BY E.EventDate
GO