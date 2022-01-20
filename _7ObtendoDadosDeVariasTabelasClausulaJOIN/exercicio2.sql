/*
Considere as tabelas abaixo:

ALN_ALUNOS
--
|ALN_ID | ALN_NOME    | ALN_IDADE|
----------------------------------
|1      | Maria       | 20       |
|2      | Marcos      | 18       |
|3      | Markos      | 18       |
|4      | João        | 19       |
|5      | Mateus      | 27       |
|6      | Roberta   | 12       |

MAT_MATERIAIS
--
|MAT_ID | MAT_NOME    | MAT_SERIE| ALN_ID  |
--------------------------------------------
|1      | Livro Ing.  | 12345    | 1       |
|2      | Livro Port. | 97654    | 1       |
|3      | Livro Bio.  | 552344   | 2       |
|4      | Livro Geo.  | 302978   | 3       |
Caso você quisesse trazer a lista com o nome dos alunos e seus respectivos materiais, qual join seria o mais adequado?
*/

DROP TABLE geral.ALN_ALUNOS;

CREATE TABLE geral.ALN_ALUNOS (
	ALN_ID SERIAL PRIMARY KEY,
	ALN_NOME VARCHAR(60) NOT NULL,
	ALN_IDADE INTEGER NOT NULL
);

INSERT INTO geral.ALN_ALUNOS
(ALN_NOME, ALN_IDADE)
VALUES
('Maria', 20),
('Marcos', 18),
('Markos', 18),
('João', 19),
('Mateus', 27),
('Roberta', 12)
;

SELECT *
FROM geral.ALN_ALUNOS;

DROP TABLE geral.MAT_MATERIAIS;

CREATE TABLE geral.MAT_MATERIAIS (
	MAT_ID SERIAL PRIMARY KEY,
	MAT_NOME VARCHAR(100) NOT NULL,
	MAT_SERIE VARCHAR(20) NOT NULL,
	ALN_ID INTEGER NOT NULL
);

ALTER TABLE geral.MAT_MATERIAIS
ADD CONSTRAINT FK_ALN_ID FOREIGN KEY (ALN_ID) REFERENCES geral.ALN_ALUNOS(ALN_ID);

INSERT INTO geral.MAT_MATERIAIS
(MAT_NOME, MAT_SERIE, ALN_ID)
VALUES
('Livro Ing.', '12345', 1),
('Livro Port.', '97654', 1),
('Livro Bio.', '552344', 2),
('Livro Geo.', '302978', 3)
;

SELECT *
FROM geral.MAT_MATERIAIS;

----- RESPOSTA -----
SELECT *
FROM geral.ALN_ALUNOS aln
INNER JOIN geral.MAT_MATERIAIS mat ON aln.ALN_ID = mat.ALN_ID;