/*
Vamos pensar. Estamos buscando todos os cursos das categorias 1 e 2. Quando pesquisamos a tabela "categoria", 
com SELECT * FROM categoria; descobrimos que a demanda que chegou para nós é retornar todos os cursos que estejam dentro de uma categoria cujo nome não tenha espaço. 
Como "Banco de dados" e "Ciência de Dados", têm espaço entre as palavras, elas não aparecem na busca.

Portanto, queremos buscar todos os cursos dentro de categorias que não possuem espaço, mas se inserirmos outra categoria que não têm espaço entre as palavras, 
como "Design", nossa query SELECT * FROM categoria WHERE categoria_id IN (1,2); estará errada.

Para resolver esse problema, podemos escrever SELECT id FROM categoria WHERE nome NOT LIKE ('% %'); , 
lembrando que no curso anterior já havíamos aprendido a usar o LIKE e os operadores coringa, como o % . Ao executarmos o código, 
teremos o retorno dos id's 1 e 2, ou seja, a lista dos id's das categorias cujos nomes não têm espaço.

Se temos uma query que exibe a lista que queremos utilizar no IN(), poderíamos replicar isso na query SELECT * FROM curso WHERE categoria_id IN (); ? 
Para testarmos, colocaremos a query com LIKE dentro dos () de IN .
*/

SELECT * FROM curso;

SELECT * FROM categoria;

SELECT * FROM curso WHERE categoria_id IN (
    SELECT id FROM categoria WHERE nome NOT LIKE ('% %')
);

/*
Percebemos que nosso código funciona. Estamos utilizando o resultado de uma query como filtro de outra query. 
Quando temos uma query dentro de outra, chamamos subquery. Apesar dessa estrutura parecer estranha, é bastante utilizada. 
Através da subqueries conseguimos alcançar resultados mais específicos.

Se alterarmos o SELECT * FROM curso do nosso código por SELECT curso.nome FROM curso , conseguiremos retornar todos os cursos que fazem parte das categorias que não possuem espaço. 
Outro exercício que podemos realizar é a busca por cursos cujas categorias possuem a palavra " de ", entre espaços, como "Banco de dados" e "Ciência de Dados"
*/

SELECT * FROM curso WHERE categoria_id IN (
    SELECT id FROM categoria WHERE nome LIKE ('% de %')
);


/*
Com esse código, retornamos todos os cursos das categorias "Banco de dados" e "Ciência de Dados". Caso adicionássemos outra categoria, como "Linguagens de Programação", 
os cursos associados a ela também seriam retornados. Assim, com subqueries conseguimos alcançar resultados mais específicos.

Na próxima aula conversaremos rapidamente e de forma conceitual sobre outros casos de uso para subqueries.
*/
