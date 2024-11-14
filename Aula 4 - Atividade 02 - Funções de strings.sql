SELECT (primeiro_nome || ultimo_nome) AS nome_completo FROM aluno;

SELECT ((CONCAT('Vinicius', NULL, 'Dias') || ' '));

SELECT (UPPER(CONCAT('Vinicius', NULL, 'Dias') || ' '));

SELECT TRIM((CONCAT('Vinicius', NULL, 'Dias') || ' '));

SELECT TRIM(UPPER(CONCAT('Vinicius', NULL, 'Dias') || ' '));

/*
Essa não é a única função para manipular string, mas eu me lembro de todas as funções? Obviamente não. 
Para isso temos a Internet. Na documentação oficial do PostgreSQL (https://www.postgresql.org/docs/9.1/functions-string.html) 
temos uma lista enorme de funções específicas para string.
*/