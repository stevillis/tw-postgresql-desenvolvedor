INSERT INTO geral.prd_produtos
(PRD_NOME, PRD_QUANTIDADE_ESTOQUE, PRD_UNIDADE, PRD_CODIGO_BARRAS)
VALUES
('Produto a ser excluído', 10, 'UN', '11111111');

SELECT *
FROM geral.prd_produtos;


DELETE FROM geral.prd_produtos
WHERE prd_id = 13;