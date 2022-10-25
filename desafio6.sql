SELECT ROUND(MIN(plans.value), 2) AS 'faturamento_minimo', ROUND(MAX(plans.value), 2) AS  'faturamento_maximo', ROUND(AVG(plans.value), 2) AS 'faturamento_medio', ROUND(SUM(plans.value), 2) AS 'faturamento_total'
FROM SpotifyClone.plans
INNER JOIN SpotifyClone.users
ON users.plan = plans.id;