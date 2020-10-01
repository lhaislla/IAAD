begin;
create schema BD_Startup;
use BD_Startup;
-- Criação das tabelas 
create table Startup(
	id_startup INT NOT NULL,
    nome_startup VARCHAR(15) NOT NULL,
    PRIMARY KEY(id_startup));
create table Linguagem_Programação(
	id_linguagem INT NOT NULL,
	linguagem VARCHAR(15) ,
	PRIMARY KEY(id_linguagem));
create table Programador(
	id_programador INT NOT NULL,
    id_startup INT NOT NULL,
    nome_programador VARCHAR(15),
    PRIMARY KEY(id_programador));
 create table Programador_Linguagem(
	id_programador INT NOT NULL, 
    id_linguagem INT NOT NULL,
	PRIMARY KEY(id_programador,id_linguagem));
-- Inserções na tabela 
insert into Startup values 
	(1,'Startup 1'),
    (2,'Startup 2'),
    (3,'Startup 3'),
    (4,'Startup 4'),
    (5,'Startup 5'),
    (6,'Startup 6');
insert into Linguagem_Programação values
	(1,'Python'),
    (2,'PHP'),
    (3,'Java'),
    (4,'Swift'),
    (5,'C#'),
    (6,'JavaScript');
insert into Programador values
	(1,1,'João'),
    (2,2,'Paula'),
    (3,3,'Renata'),
    (4,4,'Felipe'),
    (5,4,'Ana'),
    (6,1,'Alexandre');
insert into Programador_Linguagem values
	(1,1),
    (1,2),
    (2,3),
    (3,4),
    (3,5),
    (4,5);
-- Restrições 
alter table Programador  ADD FOREIGN KEY(id_startup) REFERENCES Startup(id_startup);
alter  table Programador_Linguagem ADD FOREIGN KEY(id_programador) REFERENCES Programador(id_programador);
alter table Programador_Linguagem  ADD FOREIGN KEY(id_linguagem) REFERENCES Linguagem_Programação(id_linguagem);
commit;

-- Respostas da letra b da segunda questão da lista 05:
-- I:
SELECT nome_programador,nome_startup FROM  Programador,Startup WHERE Programador.id_startup = Startup.id_startup;
SELECT nome_programador,nome_startup FROM  Programador INNER JOIN Startup ON Programador.id_startup = Startup.id_startup;
SELECT nome_programador,nome_startup FROM Programador NATURAL JOIN  Startup;
-- II:
SELECT P.nome_programador, LP.linguagem FROM Programador_Linguagem AS PL JOIN Linguagem_Programação AS LP ON PL.id_linguagem  = LP.id_linguagem  JOIN Programador AS P ON PL.id_programador = P.id_programador;
-- III:SELECT DISTINCT TAB.* FROM ( SELECT P.nome_programador, LP.linguagem FROM Programador_Linguagem AS PL  LEFT JOIN Linguagem_Programação AS LP ON PL.id_linguagem  = LP.id_linguagem  LEFT JOIN Programador AS P ON PL.id_programador = P.id_programador UNION ALL SELECT P.nome_programador, LP.linguagem FROM Programador_Linguagem AS PL  RIGHT JOIN Linguagem_Programação AS LP ON PL.id_linguagem  = LP.id_linguagem  RIGHT JOIN Programador AS P ON PL.id_programador = P.id_programador) AS TAB;
SELECT DISTINCT TAB.* FROM ( SELECT P.nome_programador, LP.linguagem FROM Programador_Linguagem AS PL  LEFT JOIN Linguagem_Programação AS LP ON PL.id_linguagem  = LP.id_linguagem  LEFT JOIN Programador AS P ON PL.id_programador = P.id_programador UNION ALL SELECT P.nome_programador, LP.linguagem FROM Programador_Linguagem AS PL  RIGHT JOIN Linguagem_Programação AS LP ON PL.id_linguagem  = LP.id_linguagem  RIGHT JOIN Programador AS P ON PL.id_programador = P.id_programador) AS TAB;
-- IV: 
 SELECT DISTINCT P.nome_programador FROM Programador AS P WHERE P.id_programador NOT IN (SELECT id_programador FROM Programador_Linguagem);
-- V:
SELECT DISTINCT TAB.* FROM (SELECT S.nome_startup, P.nome_programador FROM Startup AS S LEFT JOIN Programador AS P ON P.id_startup = S.id_startup UNION ALL SELECT S.nome_startup, P.nome_programador FROM Startup AS S RIGHT JOIN Programador AS P ON P.id_startup = S.id_startup) AS TAB;
-- VI:
SELECT S.nome_startup FROM Startup AS S WHERE S.nome_startup NOT IN(SELECT S.nome_startup FROM Startup AS S JOIN Programador AS P ON P.id_startup = S.id_startup);
-- Letra C:
SELECT DISTINCT TAB.* FROM ( SELECT P.nome_programador, LP.linguagem FROM Programador_Linguagem AS PL  LEFT JOIN Linguagem_Programação AS LP ON PL.id_linguagem  = LP.id_linguagem  LEFT JOIN Programador AS P ON PL.id_programador = P.id_programador UNION ALL SELECT P.nome_programador, LP.linguagem FROM Programador_Linguagem AS PL  RIGHT JOIN Linguagem_Programação AS LP ON PL.id_linguagem  = LP.id_linguagem  RIGHT JOIN Programador AS P ON PL.id_programador = P.id_programador) AS TAB; 

















