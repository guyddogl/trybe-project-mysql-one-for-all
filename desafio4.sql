SELECT users.name AS 'usuario', (CASE WHEN users.id = active.user THEN 'Usuário ativo' ELSE 'Usuário inativo' END) AS 'status_usuario'
FROM SpotifyClone.users
LEFT JOIN (SELECT DISTINCT historic.user FROM SpotifyClone.historic WHERE YEAR(historic.reproduction_date) >= 2021) AS active
ON users.id = active.user
ORDER BY users.name;