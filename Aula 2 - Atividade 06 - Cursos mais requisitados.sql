/* Nesta aula iremos gerar um relatório dos cursos, ou do curso, mais requisitado, ou seja, aqueles que têm mais alunos matriculados.*/

/*
Se queremos os cursos mais requisitados, começaremos codando SELECT * FROM curso; , ou seja, executaremos parte a parte a query que estamos criando. 
Com esse código acessamos todos os cursos, mas queremos aqueles que têm alunos matriculados. 
Para isso adicionaremos um JOIN , informando como critério de junção aluno_curso.curso_id = cuso.id.
*/

SELECT *
    FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id;

/*
Notamos que retornamos menos cursos, porque estão sendo exibidos apenas aqueles que têm alunos matriculados. Caso quiséssemos todos os cursos, 
ainda que não tivesse ninguém matriculado, poderíamos substituir o JOIN por LEFT JOIN , assim a lista completa de cursos seria exibida, tendo ou não alunos matriculados.

Todavia precisamos apenas dos cursos com alunos matriculados para o nosso relatório, então manteremos o JOIN. 
Agora que temos essas informações, precisamos organizá-las. Vamos precisar apenas do nome dos cursos e número de alunos matriculados neles.
*/

SELECT curso.nome,
       COUNT(aluno_curso.aluno_id) numero_alunos
    FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id;

/*

Se tentarmos executar apenas esse código, teremos um erro, porque se codamos uma função de agregação, precisamos agrupar, com GROUP BY , pelo curso.nome ou pelo 1, 
já que agruparemos pelo primeiro campo do SELECT .
*/

SELECT curso.nome,
       COUNT(aluno_curso.aluno_id) numero_alunos
    FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id
GROUP BY 1;

/*
Agora temos o nome dos cursos e o número de alunos. Falta apenas ordenar pelo número de alunos de forma decrescente, escrevendo ORDER BY numero_alunos DESC; . 
Dessa forma temos o resultado esperado em um relatório simples, mas próximo da realidade.

Executamos parte a parte da nossa query, partindo de um ponto que queremos exibir e realizando as junções necessárias. 
Esse é processo real de criação de um relatório. Temos todos os dados necessários para enviarmos para pessoa que solicitou.

Caso a pessoa queira apenas o curso mais requisitado, como aconteceu com os alunos, basta limitarmos o resultado para um com LIMIT 1; , 
retornando apenas o curso mais requisitado que, no nosso exemplo, é o PHP. Então nosso código final é:
*/

SELECT curso.nome,
       COUNT(aluno_curso.aluno_id) numero_alunos
    FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id
GROUP BY 1
ORDER BY numero_alunos DESC
    LIMIT 1;




