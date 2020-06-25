CREATE PROC uspMostNumerous
	@TopCountry nvarchar(100) OUTPUT,
	@EventCount INT OUTPUT

AS
SELECT TOP 1 @TopCountry = C.CountryName, @EventCount = COUNT(E.EventName)
FROM tblEvent E
JOIN tblCountry C ON C.CountryID = E.CountryID
JOIN tblContinent CO ON CO.ContinentID = C.ContinentID
GROUP BY C.CountryName
ORDER BY COUNT(E.EventName) DESC
GO