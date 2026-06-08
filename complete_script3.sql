**DROP TABLE IF EXISTS** Colaborador;

**CREATE TABLE** Colaborador (
nome VARCHAR(20),
nascimento DATE,
sexo VARCHAR(10),
cpf BIGINT UNIQUE,
foto BLOB
);
