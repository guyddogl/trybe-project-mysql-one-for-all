SELECT artists.name AS 'artista', albums.name AS 'album', COUNT(following.user) AS 'seguidores'
FROM SpotifyClone.albums
LEFT JOIN SpotifyClone.artists
ON albums.artist = artists.id
LEFT JOIN SpotifyClone.following
ON following.artist = artists.id
GROUP BY albums.name, artists.name
ORDER BY COUNT(following.user) DESC, artists.name ASC, albums.name ASC;