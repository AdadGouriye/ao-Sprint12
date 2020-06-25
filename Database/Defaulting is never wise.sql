CREATE PROC uspContinentEvents
	@ContinentName nvarchar(150) = '',
	@FirstDate DateTime = '17750101',
	@LastDate Datetime = '20250101'

AS
SELECT C.ContinentName , E.EventName, E.EventDate
FROM tblContinent C
JOIN tblCountry CO ON CO.ContinentID = C.ContinentID
JOIN tblEvent E ON  E.CountryID = CO.CountryID
WHERE C.ContinentName LIKE '%'+@ContinentName+'%' AND E.EventDate BETWEEN @FirstDate AND @LastDate
GO