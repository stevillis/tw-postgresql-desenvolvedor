CREATE TABLE financeiro.NIT_ITENS_NOTA_FISCAL
(
	NIT_ID SERIAL PRIMARY KEY,
	NIT_QUANTIDADE INTEGER NOT NULL,
	NIT_VALOR_UNITARIO MONEY NOT NULL,
	NFE_ID INTEGER NOT NULL,
	PRD_ID INTEGER NOT NULL
);

ALTER TABLE financeiro.NIT_ITENS_NOTA_FISCAL
ADD CONSTRAINT FK_NFE_ID FOREIGN KEY(NFE_ID) REFERENCES financeiro.NFE_NOTAS_FISCAIS(NFE_ID);
 
ALTER TABLE financeiro.NIT_ITENS_NOTA_FISCAL
ADD CONSTRAINT FK_PRD_ID FOREIGN KEY(PRD_ID) REFERENCES geral.PRD_PRODUTOS(PRD_ID);

SELECT *
FROM geral.PRD_PRODUTOS;

SELECT *
FROM geral.CLI_CLIENTES;

SELECT *
FROM financeiro.NFE_NOTAS_FISCAIS;

SELECT *
FROM financeiro.NIT_ITENS_NOTA_FISCAL;

INSERT INTO financeiro.NIT_ITENS_NOTA_FISCAL
(NIT_QUANTIDADE, NIT_VALOR_UNITARIO, NFE_ID, PRD_ID)
VALUES
(13, 15.63, 3, 7),
(2, 0.52, 2, 10);

