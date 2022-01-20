-- LEFT JOIN
SELECT cli.CLI_NOME,
	nfe.NFE_ID,
	nfe.NFE_DATA_EMISSAO,
	nfe.NFE_CHAVE_CONSULTA,
	nfe.NFE_STATUS,
	prd.PRD_NOME,
	nit.NIT_QUANTIDADE,
	prd.PRD_UNIDADE
FROM geral.CLI_CLIENTES AS cli 
	LEFT JOIN financeiro.NFE_NOTAS_FISCAIS AS nfe ON cli.CLI_ID = nfe.CLI_ID
	LEFT JOIN financeiro.NIT_ITENS_NOTA_FISCAL AS nit ON nfe.NFE_ID = nit.NFE_ID
	LEFT JOIN geral.PRD_PRODUTOS AS prd ON nit.PRD_ID = prd.PRD_ID;

-- RIGHT JOIN
SELECT cli.CLI_NOME,
	nfe.NFE_ID,
	nfe.NFE_DATA_EMISSAO,
	nfe.NFE_CHAVE_CONSULTA,
	nfe.NFE_STATUS,
	prd.PRD_NOME,
	nit.NIT_QUANTIDADE,
	prd.PRD_UNIDADE
FROM geral.CLI_CLIENTES AS cli 
	LEFT JOIN financeiro.NFE_NOTAS_FISCAIS AS nfe ON cli.CLI_ID = nfe.CLI_ID
	LEFT JOIN financeiro.NIT_ITENS_NOTA_FISCAL AS nit ON nfe.NFE_ID = nit.NFE_ID
	LEFT JOIN geral.PRD_PRODUTOS AS prd ON nit.PRD_ID = prd.PRD_ID;
	