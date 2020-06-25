ALTER PROC uspHowMuchLoger
	
AS
DECLARE @Difference int


SELECT @Difference =  MAX(LEN(EventName))-MIN(LEN(EventName))
FROM tblEvent 

Return @Difference



GO