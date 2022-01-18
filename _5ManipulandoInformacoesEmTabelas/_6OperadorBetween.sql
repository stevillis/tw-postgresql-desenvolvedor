SELECT *
FROM geral.prd_produtos
WHERE prd_id BETWEEN 3 AND 9;

-- Equivalência entre operador between e operadores de comparação
SELECT *
FROM geral.prd_produtos
WHERE prd_id >= 3 AND prd_id <= 9;