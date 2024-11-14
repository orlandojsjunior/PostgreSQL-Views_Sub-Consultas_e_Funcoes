-- Nosso primeiro passo será selecionar o nome completo do aluno, assim como sua data de nascimento.

SELECT (primeiro_nome || ultimo_nome) AS nome_completo, data_nascimento FROM aluno;

/*
Com o retorno dos nossos dados, tentaremos calcular a idade de cada pessoa, mas para isso precisamos informar a data atual. 
Existe uma função para isso, a NOW() , então vamos inseri-la no nosso código.
*/

SELECT (primeiro_nome || ultimo_nome) AS nome_completo, NOW(), data_nascimento FROM aluno;

/*
Percebemos que o NOW() retorna várias informações, sendo elas: data, hora e timezone. Contudo, não queremos todas essas informações, apenas a data. 
Então converteremos esse valor de TIMESTAMP para data, por meio do operador ::. Esse é um operador que indica conversão e, após ele, precisamos 
informar o tipo de dado que queremos, no caso, DATE.
*/

SELECT (primeiro_nome || ultimo_nome) AS nome_completo, NOW()::DATE, data_nascimento FROM aluno;


-- Dessa forma, o NOW() retorna apenas a data. Agora para descobrirmos a idade, basta subtrairmos a data de nascimento da atual, ou seja NOW()::DATE - data_nascimento .

SELECT (primeiro_nome || ultimo_nome) AS nome_completo,
    NOW()::DATE - data_nascimento
  FROM aluno;

/*
Entretanto, nosso resultado aparece em dias. Testaremos se, dividindo o resultado por 365, obteremos a idade aproximada de cada pessoa em anos, ou seja, 
(NOW()::DATE - data_nascimento) / 365) , e passaremos o alias “Idade”.

Ao executarmos o novo código, aparentemente funcionou, porque eu, Vinicius, tenho 22 anos. Minha esposa, Patrícia Freitas, tem 33 anos, o Diogo tem 35 e a Maria Rosa, 
que é fictícia, também tem 35. Sendo assim, conseguimos calcular a idade, mas foi um pouco difícil, devido as várias etapas do nosso código.
*/

SELECT (primeiro_nome || ultimo_nome) AS nome_completo,
    (NOW()::DATE - data_nascimento)/365 AS idade
  FROM aluno;


-- Uma forma mais fácil de fazer esse cálculo é através da função AGE() , informando a data de nascimento nos parâmetros.

SELECT (primeiro_nome || ultimo_nome) AS nome_completo,
    AGE(data_nascimento) AS idade
  FROM aluno; 
 
SELECT * FROM aluno;


/*
Poderíamos retornar apenas os anos, porque não queremos saber os meses e dias. Para isso existem duas formas de executarmos essa alteração. 
A primeira é transformar o campo "Idade" em string e selecionar os dois primeiros caracteres. A outra forma, que é mais interessante, 
é utilizando a função EXTRACT(), com a qual podemos extrair parte da data, no nosso caso, o ano.
*/

SELECT (primeiro_nome || ultimo_nome) AS nome_completo,
    EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade
  FROM aluno;


/*
Sendo assim, ao executarmos nosso código, teremos o mesmo resultado do cálculo enorme que fizemos, aparecendo apenas a idade em anos.

Portanto temos muitas funções e operadores matemáticos que podemos utilizar para manipular datas. Novamente, eu não me lembro de todas elas, 
então na [documentação do Postgres](https://www.postgresql.org/docs/9.1/functions-datetime.html) encontramos mais funções e operadores de data.

É possível realizar somas em datas, intervalos, timestamp e horários. De mesmo modo, conseguimos subtrair, multiplicar e dividir esses valores. 
Entretanto, o mais interessante são as funções: podemos calcular a idade, retornar a data atual, o momento atual, extrair uma parte da data com date_part() , 
que é parecido com oEXTRACT(), entre outras possibilidades.

Na documentação também encontramos alguns exemplos do que fazer, como extrair o século, o dia, a década, o dia da semana, o timestamp, 
a hora e diversas outras informações de uma data ou intervalo. Enfim, existem inúmeras funções para trabalhar com data e hora no Postgres, 
que vocês podem aprender olhando a documentação.
*/