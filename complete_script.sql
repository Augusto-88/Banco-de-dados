CREATE DATABASE livro;

use DATABASE livro;

DROP TABLE IF EXISTS livro;
CREATE TABLE livro (
titulo_livro VARCHAR(200) NOT NULL,
lancamento_livro DATE,
idioma_livro CHAR(2),
codigo_isbn VARCHAR(13) UNIQUE,
capa_livro BLOB
);
