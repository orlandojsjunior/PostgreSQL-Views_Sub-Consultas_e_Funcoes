-- Aula 3 - Atividade 02 - Operador IN

SELECT * FROM curso;

SELECT * FROM categoria;

-- Buscando os cursos que sejam da categoria "Front-End" ou a categoria "Programação".

SELECT * FROM curso WHERE categoria_id = 1 OR categoria_id = 2;


-- Buscando cursos cuja categoria_id esteja entre 1 e 2 na lista, ou seja, queremos que seja 1 ou 2.

SELECT * FROM curso WHERE categoria_id IN (1,2);


/*
Observemos que, caso o IN() tenha apenas um item, por exemplo, IN(3) , os resultados retornados são os mesmo do comando SELECT * FROM curso WHERE categoria_id = 3; . 
Sendo assim, para cada item da lista do IN(), nosso código irá comparar com o campo a partir do operador de igualdade, ou seja, quando colocamos IN (1,2) , 
o código buscará cada curso da tabela e verificar se o campo categoria_id é igual a 1 ou 2. Caso seja, o código inclui o valor na lista, do contrário, o valor não aparece no relatório.
*/

SELECT * FROM curso WHERE categoria_id = 3;