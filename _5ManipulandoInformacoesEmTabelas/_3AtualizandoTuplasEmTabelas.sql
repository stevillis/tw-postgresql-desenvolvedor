SELECT *
FROM geral.prd_produtos;

-- Atualizando o campo prd_descricao
UPDATE geral.prd_produtos
SET prd_descricao = 'Biscoito de polvilho'
WHERE prd_id = 3;


-- Atualizando mais de um campo da tabela
UPDATE geral.prd_produtos
SET prd_descricao = 'Pão de forma',
	prd_quantidade_estoque = 20
WHERE prd_id = 9;