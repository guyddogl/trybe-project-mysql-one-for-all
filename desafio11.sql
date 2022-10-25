SELECT songs.name AS 'nome_musica',
CASE
	WHEN name LIKE '%Bard%' THEN REPLACE(name, 'Bard', 'QA')
	WHEN name LIKE '%Amar%' THEN REPLACE(name, 'Amar', 'Code Review')
	WHEN name LIKE '%Pais%' THEN REPLACE(name, 'Pais', 'Pull Requests')
	WHEN name LIKE '%SOUL%' THEN REPLACE(name, 'SOUL', 'CODE')
	WHEN name LIKE '%SUPERSTAR%' THEN REPLACE(name, 'SUPERSTAR', 'SUPERDEV')
	ELSE name
END AS 'novo_nome'
FROM SpotifyClone.songs
WHERE songs.name LIKE '%Bard%' OR songs.name LIKE '%Amar%' OR songs.name LIKE '%Pais%' OR songs.name LIKE '%SOUL%' OR songs.name LIKE '%SUPERSTAR%'
ORDER BY songs.name DESC;