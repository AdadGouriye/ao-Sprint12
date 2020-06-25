CREATE PROC spListEpisodes
	@SeriesNumber INT = NULL
AS
SELECT *
FROM tblEpisode
WHERE (@SeriesNumber IS NULL OR SeriesNumber = @SeriesNumber)
GO