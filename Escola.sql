CREATE DATABASE EscolaDB;
USE EscolaDB;

CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    idade INT
);

CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100),
    carga_horaria INT
);

CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_curso INT,
    nota DECIMAL(4,2),
    faltas INT,
FOREIGN KEY (id_aluno)REFERENCES Alunos(id_aluno),
FOREIGN KEY (id_curso)REFERENCES Cursos(id_curso)
);


INSERT INTO Alunos (nome, cidade, idade)VALUES
('Carlos','São Paulo',18),
('Mariana','Curitiba',22),
('João','Florianópolis',19),
('Fernanda','São Paulo',25),
('Lucas','Rio de Janeiro',20),
('Patricia','Curitiba',21),
('Ana','Porto Alegre',23),
('Bruno','São Paulo',24);

INSERT INTO Cursos (nome_curso, carga_horaria)VALUES
('Python',40),
('Banco de Dados',60),
('Java',80),
('Data Science',100);

INSERT INTO Matriculas (id_aluno, id_curso, nota, faltas)VALUES
(1,1,8.5,2),
(1,2,7.0,5),
(2,1,9.5,1),
(2,4,8.0,4),
(3,2,6.5,6),
(3,3,7.5,3),
(4,4,9.0,0),
(5,1,5.5,10),
(5,2,6.0,7),
(6,3,8.5,2),
(7,4,7.0,5),
(8,2,9.5,1);

--FACÍL
--1)
SELECT * from `Alunos`;

--2)
SELECT nome
from `Alunos`;

--3)
SELECT nome_curso
from `Cursos`;

--4)
SELECT * from `Alunos`
where cidade = 'são paulo'

--5)
SELECT * from `Alunos`
where idade > 20;

--6)
SELECT * from `Cursos`
where carga_horaria > 50;

--7)
SELECT * from `Alunos`
where idade > 18 and idade < 22;

--8)
SELECT * from `Alunos`
where cidade = 'curitiba';

--9)
SELECT * from `Alunos`
where idade < 21;

--10)
SELECT * from `Matriculas`;

--INTERMEDIÁRIO
--1)
SELECT nome,nota from `Alunos`,`Matriculas`
where nota > 8;
--2)
SELECT nome,faltas from `Alunos`,`Matriculas`
where faltas > 5;
--3)
SELECT nome_curso as Curso
from `Cursos`
where carga_horaria = 80;

--4)
SELECT nome as Nome_Aluno,cidade as Cidade_que_nasceu from `Alunos`
where cidade not like 'São Paulo';

--5)
SELECT nome from `Alunos`
WHERE nome not like 'A%';

--6)
SELECT nome from `Alunos`
WHERE nome like '%A';

--7)
SELECT nome_curso from `Cursos`
WHERE nome_curso like '%Dados%';

--8)
SELECT id_aluno from `Matriculas`
where nota > 7 and nota < 9;

--9)
SELECT nome,idade from `Alunos`
where idade = 20;

--10)
SELECT nome_curso,carga_horaria from `Cursos`
where carga_horaria <= 60;

-- GROUP BY
--1)
SELECT cidade, count(cidade) from `Alunos`
group by cidade;

--2)
SELECT avg(idade) as Média_idade, COUNT(cidade) as cidade FROM `Alunos`
GROUP BY cidade;

--3)
select id_curso, count(id_aluno) from `Matriculas`
GROUP BY id_curso;

--4)
SELECT id_curso, avg(nota) from `Matriculas`
GROUP BY id_curso;

--5)
SELECT id_curso, sum(faltas) from `Matriculas`
GROUP BY id_curso;

--6)
select id_curso, max(nota) from `Matriculas`
group by id_curso;

--7)
select id_curso, min(nota) from `Matriculas`
group by id_curso;

--8)
SELECT nome, sum(faltas) from `Alunos`
join `Matriculas`
on Alunos.id_aluno = `Matriculas`.id_aluno
GROUP BY nome;

--9)
SELECT nome, avg(nota) from `Alunos`
join `Matriculas`
on `Alunos`.id_aluno = `Matriculas`.id_aluno
GROUP BY nome;

--10)
SELECT nome, count(idade) from `Alunos`
GROUP BY nome;

--HAVING E ODER BY
--1)
SELECT cidade, count(cidade) from `Alunos`
group by cidade
HAVING count(cidade) > 2;

--2)
SELECT id_curso, avg(nota) from `Matriculas`
GROUP BY id_curso
HAVING avg(nota) >= 8
ORDER BY avg(nota) asc;

--3)
SELECT id_curso, count(id_aluno) as aluno from `Matriculas`
GROUP BY id_curso
HAVING aluno >= 2
ORDER BY aluno asc;

--4)
SELECT nome, sum(faltas) as faltas from `Alunos`
join `Matriculas`
on `Alunos`.id_aluno = `Matriculas`.id_aluno
GROUP BY nome
HAVING faltas > 5
ORDER BY faltas DESC;

--5)
SELECT id_curso, min(nota) as nota from `Matriculas`
GROUP BY id_curso
HAVING nota > 6
ORDER BY nota ASC;

--6)
SELECT nome_curso, carga_horaria from `Cursos`
ORDER BY carga_horaria DESC;

--7)
SELECT nome, idade from `Alunos`
ORDER BY idade desc;

--8)
SELECT id_curso, avg(nota) from `Matriculas`
GROUP BY id_curso
ORDER BY avg(nota);

--9)
SELECT cidade, count(cidade) as Cidade from `Alunos`
group by cidade
ORDER by Cidade;

--10)
SELECT nome, avg(nota) as nota from `Alunos`
join `Matriculas`
on `Alunos`.id_aluno = `Matriculas`.id_aluno
GROUP BY nome
ORDER BY nota desc;

