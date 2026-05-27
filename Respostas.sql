# Questões — SELECT, FROM, WHERE e GROUP BY
# Básicas

--  1)--------------------------------------------------------------------------------------
select * from Alunos;
--  2)--------------------------------------------------------------------------------------
select nome from Alunos;
--  3)--------------------------------------------------------------------------------------
select nome_curso from Cursos;
--  4)--------------------------------------------------------------------------------------
select * from Alunos
where cidade = 'São Paulo';
--  5)--------------------------------------------------------------------------------------
select * from Alunos
where idade > 20;
--  6)--------------------------------------------------------------------------------------
select nome_curso from Cursos
where carga_horaria > 50;
--  7)--------------------------------------------------------------------------------------
select * from Alunos
where idade > 18 and idade < 22;
--  8)--------------------------------------------------------------------------------------
select * from Alunos
WHERE cidade ='Curitiba';
--  9)--------------------------------------------------------------------------------------
select nome, idade from Alunos
where idade < 21;
--  10)-------------------------------------------------------------------------------------
select * from Matriculas;

#Intermediárias------------------------------------------------------------------------------------------

--  1)--------------------------------------------------------------------------------------
select nome,nota from Alunos,Matriculas
where nota > 8;
--  2)--------------------------------------------------------------------------------------
select nome, faltas from Alunos,Matriculas
where faltas > 5;
--  3)--------------------------------------------------------------------------------------
select  nome_curso, carga_horaria from Cursos
where carga_horaria = 80;
--  4)--------------------------------------------------------------------------------------
select nome, cidade from Alunos
where cidade not like 'São Paulo';
--  5)--------------------------------------------------------------------------------------
select nome from Alunos
where nome not like 'A%';
--  6)--------------------------------------------------------------------------------------
select nome from Alunos
where nome not like '%A';
--  7)--------------------------------------------------------------------------------------
select nome_curso from Cursos
where nome_curso like '%Dados%';
--  8)--------------------------------------------------------------------------------------
select id_matricula,id_aluno,id_curso,nota from Matriculas
where nota BETWEEN 7 and 9;
--  9)--------------------------------------------------------------------------------------
select nome, idade from Alunos
where idade = 20;
--  10)-------------------------------------------------------------------------------------
select  nome_curso, carga_horaria from Cursos
where carga_horaria <= 60;

#Questões com GROUP BY--------------------------------------------------------------------------------------

--  1)--------------------------------------------------------------------------------------
select cidade, count(cidade) as qtd_alunos_cidade
FROM Alunos
group by cidade;
--  2)--------------------------------------------------------------------------------------
select avg(idade), count(cidade) as avgIdade_alunos_cidade
FROM Alunos
group by cidade;
--  3)--------------------------------------------------------------------------------------
select id_curso, count(id_aluno) as qtd_alunos_curso
FROM Matriculas
group by id_curso;
--  4)--------------------------------------------------------------------------------------
select id_curso, avg(nota) as media_nota_curso
FROM Matriculas
group by id_curso;
--  5)--------------------------------------------------------------------------------------
select id_curso, sum(faltas) as faltas_totais
FROM Matriculas
group by id_curso;
--  6)--------------------------------------------------------------------------------------
select id_curso, max(nota) as notaMaxima_curso
FROM Matriculas
group by id_curso;
--  7)--------------------------------------------------------------------------------------
select id_curso, min(nota) as notaBaixa_curso
FROM Matriculas
group by id_curso;
--  8)--------------------------------------------------------------------------------------
select nome, sum(faltas) as falta_aluno
from Alunos
join Matriculas
on Alunos.id_aluno = Matriculas.id_aluno
GROUP BY nome;
--  9)--------------------------------------------------------------------------------------

select nome, avg(nota) as media_aluno
from Alunos
join Matriculas
on Alunos.id_aluno = Matriculas.id_aluno
GROUP BY nome;
--  10)-------------------------------------------------------------------------------------
select nome, count(idade) as faixa_etária
from Alunos
GROUP BY nome;

#Questões Avançadas — HAVING e ORDER BY----------------------------------------------------------------------

--  1)--------------------------------------------------------------------------------------
select cidade, count(cidade) as qtd_alunos_cidade
FROM Alunos
group by cidade
HAVING qtd_alunos_cidade > 2
ORDER BY qtd_alunos_cidade asc;
--  2)--------------------------------------------------------------------------------------
select id_curso, avg(nota) as media_nota_curso
FROM Matriculas
group by id_curso
HAVING media_nota_curso >= 8
ORDER BY media_nota_curso desc;
--  3)--------------------------------------------------------------------------------------
select id_curso, count(id_aluno) as qtd_alunos_curso
FROM Matriculas
group by id_curso
HAVING count(id_aluno) >= 2
ORDER BY count(id_aluno) desc;
--  4)--------------------------------------------------------------------------------------
select nome, sum(faltas) as falta_aluno
from Alunos
join Matriculas
on Alunos.id_aluno = Matriculas.id_aluno
GROUP BY nome
having sum(faltas) >= 5
ORDER BY sum(faltas) desc;
--  5)--------------------------------------------------------------------------------------
select id_curso, min(nota) as notaBaixa_curso
FROM Matriculas
group by id_curso
having min(nota) > 6
ORDER BY min(nota) desc;
--  6)--------------------------------------------------------------------------------------
select nome_curso, carga_horaria
FROM Cursos
ORDER BY carga_horaria desc;
--  7)--------------------------------------------------------------------------------------
select nome, idade
from Alunos
order by idade desc;
--  8)--------------------------------------------------------------------------------------
select id_curso, avg(nota) as media_nota_curso
FROM Matriculas
group by id_curso
ORDER BY media_nota_curso desc;
--  9)--------------------------------------------------------------------------------------
select cidade, count(cidade) as Qtd_alunos_cidade
from Alunos
GROUP BY cidade
ORDER BY Qtd_alunos_cidade desc;
--  10)-------------------------------------------------------------------------------------
select nome, avg(nota) as media_aluno
from Alunos
join Matriculas
on Alunos.id_aluno = Matriculas.id_aluno
GROUP BY nome
ORDER BY avg(nota) desc;
