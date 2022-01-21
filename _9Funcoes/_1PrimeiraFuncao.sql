/*
# Tipos de Função
## VOLATILE (Default)
	1. Podem fazer qualquer coisa, inclusive modificar o banco de dados
	2. Podem retornar diferentes resultados para os mesmos parâmetros
	3. Não são otimizadas

## STABLE
	1. Não podem modificar o banco de dados
	2. Retorna os mesmos resultados para os mesmos parâmetros dentro de uma varredura de linhas
	3. Podem ser otimizadas

## IMMUTABLE
	1. Não podem modificar o banco de dados
	2. Retorna os mesmos resultados para os mesmos parâmetros sempre
	3. Podem ser otimizadas
*/

DROP FUNCTION geral.FN_SOMAR;

CREATE FUNCTION geral.FN_SOMAR(INTEGER, INTEGER)
RETURNS INTEGER AS
$$
BEGIN
	RETURN $1 + $2;
END;
$$
LANGUAGE plpgsql
IMMUTABLE
;

SELECT geral.FN_SOMAR(10, 28);

CREATE OR REPLACE FUNCTION geral.FN_MULTIPLICAR(pnum1 INTEGER DEFAULT 0, pnum2 INTEGER DEFAULT 0)
RETURNS INTEGER AS
$$
BEGIN
	RETURN pnum1 + pnum2;
END;
$$
LANGUAGE plpgsql
IMMUTABLE
;

SELECT geral.FN_MULTIPLICAR(10, 28),
	geral.FN_MULTIPLICAR(10),
	geral.FN_MULTIPLICAR()
;

------------------------------
CREATE FUNCTION financeiro.FN_CALCULAR_VALOR_VENDA(P_NFE_ID INTEGER, P_PRD_ID INTEGER)
RETURNS MONEY AS
$$
DECLARE
	V_QUANTIDADE_PRODUTO INTEGER;
	V_VALOR_UNITARIO_PRODUTO MONEY;
	V_VALOR_PARCIAL_PRODUTO MONEY;
BEGIN
	SELECT nit.NIT_QUANTIDADE,
		nit.NIT_VALOR_UNITARIO
	INTO V_QUANTIDADE_PRODUTO,
		V_VALOR_UNITARIO_PRODUTO
	FROM financeiro.NIT_ITENS_NOTA_FISCAL nit
	WHERE nit.NFE_ID = P_NFE_ID
		AND nit.PRD_ID = P_PRD_ID;
	
	V_VALOR_PARCIAL_PRODUTO := V_VALOR_UNITARIO_PRODUTO * V_QUANTIDADE_PRODUTO;
	RETURN V_VALOR_PARCIAL_PRODUTO + (V_VALOR_PARCIAL_PRODUTO * 0.1);
END;
$$
LANGUAGE plpgsql
STABLE;

SELECT cli.CLI_NOME,
	COALESCE(SUM(financeiro.FN_CALCULAR_VALOR_VENDA(nfe.NFE_ID, nit.PRD_ID)), 0::MONEY) AS VALOR_TOTAL_GASTO,
	COALESCE(MIN(financeiro.FN_CALCULAR_VALOR_VENDA(nfe.NFE_ID, nit.PRD_ID)), 0::MONEY) AS MENOR_VALOR_GASTO,
	COALESCE(MAX(financeiro.FN_CALCULAR_VALOR_VENDA(nfe.NFE_ID, nit.PRD_ID)), 0::MONEY) AS MAIOR_VALOR_GASTO,
	COALESCE(SUM(financeiro.FN_CALCULAR_VALOR_VENDA(nfe.NFE_ID, nit.PRD_ID)) / COUNT(nit.NIT_ID), 0::MONEY) AS MEDIA_VALOR_GASTO
FROM geral.CLI_CLIENTES cli
LEFT JOIN financeiro.NFE_NOTAS_FISCAIS nfe ON cli.CLI_ID = nfe.CLI_ID
LEFT JOIN financeiro.NIT_ITENS_NOTA_FISCAL nit ON nfe.NFE_ID = nit.NFE_ID
GROUP BY cli.CLI_NOME
ORDER BY cli.CLI_NOME
;