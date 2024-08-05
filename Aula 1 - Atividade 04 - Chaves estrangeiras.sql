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