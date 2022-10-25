SELECT users.name AS 'usuario', COUNT(historic.song) AS 'qt_de_musicas_ouvidas', ROUND(SUM(songs.length) / 60, 2) AS 'total_minutos'
FROM SpotifyClone.users
INNER JOIN SpotifyClone.songs
INNER JOIN SpotifyClone.historic
ON songs.id = historic.song AND historic.user = users.id
GROUP BY users.id
ORDER BY users.name;