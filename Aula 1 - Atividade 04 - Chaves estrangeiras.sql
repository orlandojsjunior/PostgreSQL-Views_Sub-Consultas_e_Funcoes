CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);


drop table aluno_curso, curso
	
CREATE TABLE curso(
    id SERIAL PRIMARY KEY, 
    nome VARCHAR(255) NOT NULL, 
    categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);