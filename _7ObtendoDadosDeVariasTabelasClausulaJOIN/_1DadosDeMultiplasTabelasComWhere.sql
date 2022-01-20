SELECT nfe.NFE_ID,
	nfe.NFE_DATA_EMISSAO,
	nfe.NFE_CHAVE_CONSULTA,
	nfe.NFE_STATUS,
	prd.PRD_NOME,
	nit.NIT_QUANTIDADE,
	prd.PRD_UNIDADE,
	cli.CLI_NOME
FROM financeiro.NFE_NOTAS_FISCAIS AS nfe, 
	financeiro.NIT_ITENS_NOTA_FISCAL AS nit,
	geral.CLI_CLIENTES AS cli,
	geral.PRD_PRODUTOS AS prd
WHERE nfe.CLI_ID = cli.CLI_ID
	AND nfe.NFE_ID = nit.NFE_ID
	AND nit.PRD_ID = prd.PRD_ID;
	