SELECT aluno.primeiro_nome,
       aluno.ultimo_nome,
       COUNT(aluno_curso.curso_id) numero_cursos
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
GROUP BY 1,2
ORDER BY numero_cursos DESC
    LIMIT 1;