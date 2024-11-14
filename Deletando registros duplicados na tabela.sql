-- Deletando registros duplicados na tabela

-- Define uma CTE (Common Table Expression) chamada CTE
WITH CTE AS (
    -- Seleciona todas as colunas da tabela aluno
    SELECT *,
           -- Adiciona uma coluna chamada row_num que atribui um número de linha a cada registro
           -- O número de linha é reiniciado para cada combinação de primeiro_nome, ultimo_nome e data_nascimento
           -- Os registros são ordenados pelo id
           ROW_NUMBER() OVER (PARTITION BY primeiro_nome, ultimo_nome, data_nascimento ORDER BY id) AS row_num
    FROM aluno
)
-- Executa a operação de DELETE na tabela aluno
DELETE FROM aluno
WHERE id IN (
    -- Seleciona os ids dos registros que têm row_num maior que 1 na CTE
    -- Isso significa que apenas os registros duplicados (com base em primeiro_nome, ultimo_nome e data_nascimento) serão deletados
    SELECT id
    FROM CTE
    WHERE row_num > 1
);

/*
Explicação Detalhada
CTE (Common Table Expression):

A CTE é definida usando a cláusula WITH e é nomeada como CTE.

Dentro da CTE, uma consulta é executada para selecionar todas as colunas da tabela aluno.
A função ROW_NUMBER() é usada para atribuir um número de linha a cada registro. A cláusula PARTITION BY reinicia a numeração para cada combinação de primeiro_nome, 
ultimo_nome e data_nascimento. A cláusula ORDER BY id garante que os números de linha sejam atribuídos na ordem dos ids.
DELETE:

A operação de DELETE é executada na tabela aluno.

A cláusula WHERE id IN é usada para especificar quais registros devem ser deletados.
Uma subconsulta é executada dentro da cláusula WHERE. Esta subconsulta seleciona os ids dos registros na CTE onde row_num é maior que 1. 
Isso significa que apenas os registros duplicados (com base em primeiro_nome, ultimo_nome e data_nascimento) serão deletados, 
mantendo apenas o primeiro registro de cada grupo de duplicados.

Resumo
Este código SQL é usado para remover registros duplicados da tabela aluno. Ele identifica duplicatas com base nas colunas primeiro_nome, ultimo_nome e data_nascimento, 
e mantém apenas o primeiro registro de cada grupo de duplicados, deletando os demais. A CTE é usada para calcular o número de linha para cada registro, e a operação de 
DELETE remove os registros onde o número de linha é maior que 1.
*/



