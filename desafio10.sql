SELECT songs.name AS 'nome', COUNT(historic.song) AS 'reproducoes'
FROM SpotifyClone.songs
INNER JOIN SpotifyClone.historic
ON songs.id = historic.song
INNER JOIN SpotifyClone.users
ON historic.user = users.id
WHERE users.plan IN (1, 3)
GROUP BY songs.name
ORDER BY songs.name ASC;