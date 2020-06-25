CREATE PROC spCompanionsForDoctor
	@DoctorName nvarchar(50) = NULL
AS

SELECT D.DoctorName, C.CompanionName
FROM tblDoctor D
JOIN tblEpisode E ON E.DoctorId = D.DoctorId
JOIN tblEpisodeCompanion EC ON EC.EpisodeId = E.EpisodeId
JOIN tblCompanion C ON C.CompanionId = EC.CompanionId
WHERE (@DoctorName IS NULL OR D.DoctorName LIKE '%'+ @DoctorName+'%')
GROUP BY D.DoctorName, C.CompanionName

GO