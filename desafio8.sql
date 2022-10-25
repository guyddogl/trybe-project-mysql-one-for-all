SELECT artists.name AS 'artista', albums.name AS 'album'
FROM SpotifyClone.albums
LEFT JOIN SpotifyClone.artists
ON albums.artist = artists.id
WHERE artists.name = 'Elis Regina';