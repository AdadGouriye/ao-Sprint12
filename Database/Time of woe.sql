CREATE PROC uspProcedure1
	@FirstEventContinent nvarchar(50) = NULL OUTPUT
AS
SELECT @FirstEventContinent = CO.ContinentName
FROM tblEvent E
JOIN tblCountry C ON C.CountryID = E.CountryID
JOIN tblContinent CO ON CO.ContinentID = C.ContinentID
WHERE E.EventDate = (
	SELECT MIN(E.EventDate)
	FROM tblEvent E
)

GO

CREATE PROC uspProcedure2
	@ContinentName nvarchar(50)
AS
SELECT E.EventName, E.EventDate, CO.ContinentName
FROM tblEvent E
JOIN tblCountry C ON C.CountryID = E.CountryID
JOIN tblContinent CO ON CO.ContinentID = C.ContinentID
WHERE Co.ContinentName = @ContinentName
GO