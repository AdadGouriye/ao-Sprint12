CREATE PROC CountryEvents
	@CountryName nvarchar(100)
AS
	SELECT E.EventName, E.EventDate, C.CountryName
	FROM tblEvent E
	JOIN tblCountry C ON C.CountryID = E.CountryID
	WHERE C.CountryName LIKE '%'+ @CountryName + '%'
GO

