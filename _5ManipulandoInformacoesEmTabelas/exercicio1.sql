/*
magine uma tabela com a seguinte definição:

Nome:   ALN_ALUNOS
Campos: ALN_ID (SERIAL), ALN_NOME (VARCHAR(50) NOT NULL), ALN_IDADE (INT DEFAULT 18).
Assinale os comandos de inserção que poderiam ser aplicados a essa tabela e que apresentem um certo "sentido", dada a estrutura da tabela.

(Escolha 3 opções)
*/

CREATE TABLE geral.aln_alunos (
	ALN_ID SERIAL,
	ALN_NOME VARCHAR(50) NOT NULL, 
	ALN_IDADE INT DEFAULT 18
);

-- Opção 1 (x)
INSERT INTO geral.aln_alunos 
(ALN_NOME, ALN_IDADE)
VALUES
('Marcela', NULL);

-- Opção 2
INSERT INTO geral.aln_alunos 
VALUES
(1, 'Karina', 20);

-- Opção 3 (x)
INSERT INTO geral.aln_alunos 
(ALN_NOME, ALN_IDADE)
VALUES
('Marcela', 30);

-- Opção 4
INSERT INTO geral.aln_alunos 
(ALN_IDADE)
VALUES
('Jorge');

-- Opção 5 (x)
INSERT INTO geral.aln_alunos 
(ALN_ID, ALN_NOME)
VALUES
(2, 'Marcos');

-- Testes
DROP TABLE geral.aln_alunos;

SELECT *
FROM geral.aln_alunos;
