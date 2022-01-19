CREATE TABLE financeiro.NIT_ITENS_NOTA_FISCAL
(
	NIT_ID SERIAL PRIMARY KEY,
	NIT_QUANTIDADE INTEGER NOT NULL,
	NIT_VALOR_UNITARIO MONEY NOT NULL,
	NFE_ID INTEGER NOT NULL,
	PRD_ID INTEGER NOT NULL
);

ALTER TABLE financeiro.NIT_ITENS_NOTA_FISCAL
ADD CONSTRAINT FK_NFE_ID FOREIGN KEY (NFE_ID) REFERENCES financeiro.NFE_NOTAS_FISCAIS(NFE_ID);
