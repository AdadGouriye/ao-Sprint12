CREATE Procedure spSelectAllTitles
AS
	SELECT *
	FROM Song
	
GO

CREATE Procedure spSelectAllArtist
AS
	SELECT *
	FROM Artist
	
GO

CREATE Procedure spSelectListingOnYear
	@Year integer
AS
	SELECT *
	FROM SongRank
	Where Year = @Year
	
GO

CREATE Procedure spNumberOfSongsOfArtist
AS
	SELECT A.ArtistName, COUNT(S.SongTitle) AS 'Aantal Nummers'
	FROM Song S
	JOIN SongArtist SA ON SA.SongID = S.SongID
	JOIN Artist A ON A.ArtistID = SA.ArtistID
	GROUP BY A.ArtistName
	
GO

CREATE Procedure spSelectSearchedArtist
	@ArtistName nvarchar(50)
AS
	SELECT A.ArtistID, A.ArtistName
	FROM Artist A
	WHERE A.ArtistName = @ArtistName

GO

CREATE Procedure spSelectTop10ListingOnYear
	@Year integer
AS
	SELECT TOP 10
	FROM SongRank SR
	WHERE SR.Year = @Year
	
GO