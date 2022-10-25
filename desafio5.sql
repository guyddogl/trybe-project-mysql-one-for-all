SELECT songs.name AS 'cancao', COUNT(historic.reproduction_date) AS 'reproducoes'
FROM SpotifyClone.songs
INNER JOIN SpotifyClone.historic
ON historic.song = songs.id
GROUP BY songs.name
ORDER BY COUNT(historic.reproduction_date) DESC, songs.name ASC
LIMIT 2;