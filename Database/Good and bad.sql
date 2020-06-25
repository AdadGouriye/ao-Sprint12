CREATE PROC spGoodAndBad
	@SeriesNumber INT,
	@NumCompanions INT OUTPUT,
	@NumEnemies INT OUTPUT

AS

SELECT @NumEnemies = COUNT(DISTINCT EN.EnemyName) , @NumCompanions =COUNT(DISTINCT C.CompanionName)
FROM tblEpisode E
JOIN tblEpisodeEnemy EE ON EE.EpisodeId = E.EpisodeId
JOIN tblEnemy EN ON EN.EnemyId = EE.EnemyId
JOIN tblEpisodeCompanion EC ON E.EpisodeId = EC.EpisodeId
JOIN tblCompanion C ON C.CompanionId = EC.CompanionId
WHERE E.SeriesNumber = @SeriesNumber
GROUP BY E.SeriesNumber

GO


