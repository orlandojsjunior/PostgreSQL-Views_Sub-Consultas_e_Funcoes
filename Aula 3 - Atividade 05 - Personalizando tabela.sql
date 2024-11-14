SELECT categoria.nome AS categoria,
        COUNT(curso.id) as numero_cursos
    FROM categoria
    JOIN curso ON curso.categoria_id = categoria.id
GROUP BY categoria;


/*
Portanto temos uma query que entrega, basicamente, uma tabela. E sabemos que, quando estamos executando um SELECT , escrevemos SELECT, os campos desejados, FROM, 
alguma tabela. Se o SELECT está nos entregando uma tabela, será possível colocar esse retorno dentro do FROM,por exemplo, e manipular como se fosse uma tabela?

Imaginem que queremos buscar a categoria e o número de cursos de "algum lugar" que tenha as categorias e quantos cursos elas têm. Nesse lugar, 
queremos utilizar um filtro onde o número de cursos precisa ser maior que três. Nosso modelo de código seria:
*/

SELECT categoria,
       numero_cursos
    FROM algum_lugar
  WHERE numero_cursos > 3;

/*
Queremos realizar essa consulta, mas já temos a tabela onde buscarmos essa informação, ou seja, o retorno do SELECT anterior. 
Então podemos copiar o código e colar, entre parênteses, no FROM.

Isso significa que, no FROM, podemos colocar uma subquery que será utilizada como uma tabela. Precisamos, portanto, nomear essa tabela, 
que pode receber qualquer nome, mas colocaremos AS categoria_cursos , inserindo essa informação após o () do FROM .
*/


SELECT categoria,
       numero_cursos
    FROM (
            SELECT categoria.nome AS categoria,
                COUNT(curso.id) as numero_cursos
            FROM categoria
            JOIN curso ON curso.categoria_id = categoria.id
        GROUP BY categoria
    ) AS categoria_cursos
  WHERE numero_cursos >= 3;

/*
Executando, teremos apenas o retorno da categoria "Banco de dados". Não precisaríamos trazer nem o número de cursos, 
limitando a exibição das informações existentes na subquery. Dessa forma, o começo do nosso código será SELECT categoria FROM () .

Agora sabemos que, das nossas categorias, apenas "Banco de dados" tem mais do que três cursos. Se mudarmos nosso WHERE para WHERE numero_cursos >= 3 , 
teremos a lista de todas as categorias. O ponto é que podemos utilizar uma query como se fosse uma tabela, e não apenas como filtro.

Sendo assim, uma subquery pode entregar informações que podem ser reutilizadas em outros códigos. Contudo, é importante deixar claro que, na maioria das vezes, 
é possível resolver essas solicitações com outras cláusulas, tais como JOIN ou mais de um WHERE . Portanto, essa solução pode ser implementada de forma simplificada.

Por exemplo, no caso anterior poderíamos utilizar a cláusula HAVING na nossa primeira busca.
*/

SELECT categoria.nome AS categoria, 
    COUNT(curso.id) as numero_cursos 
FROM categoria 
JOIN curso ON curso.categoria_id = categoria.id 
GROUP BY categoria 
HAVING COUNT(curso.id) > 10;

/*
Esse código nos retorna o mesmo resultado. Todavia, em alguns casos pode ser necessário usar uma subquery, ou uma sub consulta, como tabela,
diretamente no FROM() , mas só saberemos se essa estrutura é necessária quando nos depararmos com a situação.

Recapitulando, é possível utilizar uma query em um filtro, ou seja, no WHERE , ou no FROM() . Geralmente, quando se utiliza uma subquery no FROM, 
é possível simplificar a busca modificando a subquery em questão, porém em alguns casos raros, que só conheceremos quando nos depararmos com eles, 
pode ser necessário utilizar esse artefato, que já conhecemos e conseguiremos utilizar.

Agora que falamos bastante sobre sub consultas, conversaremos sobre funcionalidades específicas do Postgres, como as funções para realizar filtros, 
tratamento de dados, entre outras.
*/

