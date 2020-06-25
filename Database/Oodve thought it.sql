CREATE PROCEDURE spEnemyEpisodes
	@EnemyName nvarchar(50)
AS
	SELECT EP.SeriesNumber, EP.EpisodeNumber, EP.Title
	FROM dbo.tblEpisode EP
	JOIN dbo.tblEpisodeEnemy EE ON EP.EpisodeId = EE.EpisodeId
	JOIN dbo.tblEnemy EN ON EN.EnemyId = EE.EnemyId
	WHERE EN.EnemyName LIKE @EnemyName
	ORDER BY EP.SeriesNumber, EP.EpisodeNumber
GO