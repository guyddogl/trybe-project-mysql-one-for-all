SELECT COUNT(songs.name) AS 'cancoes', COUNT(DISTINCT artists.name) AS 'artistas', COUNT(DISTINCT albums.name) AS 'albuns'
FROM SpotifyClone.songs
RIGHT JOIN SpotifyClone.albums
ON albums.id = songs.album
RIGHT JOIN SpotifyClone.artists
ON albums.artist = artists.id;