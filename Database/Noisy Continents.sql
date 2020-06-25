CREATE PROC ContinentsWith50Events
AS
SELECT C.ContinentName, COUNT(C.ContinentID) AS [Number of events]
FROM tblContinent C
JOIN tblCountry CO ON C.ContinentID = CO.ContinentID
JOIN tblEvent E ON E.CountryID = CO.CountryID
GROUP BY C.ContinentName
HAVING COUNT(C.ContinentID) >=50
GO