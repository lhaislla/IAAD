-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Script do Banco de Dados Matricula 

begin;
create schema matricula_lhaislla; 
-- create schema
use matricula_lhaislla;
-- Criando as tabelas
create table ALUNO(
	Cpf CHAR(11) NOT NULL,
	Nome VARCHAR(15) NOT NULL,
    Curso CHAR(5) Not NULL,
	Datanasc DATE NOT NULL,
	PRIMARY KEY(Cpf));  -- Aplicando a restrição de chave primária (PK)
create table DISCIPLINA(
	Dnome VARCHAR(15) NOT NULL,
	Num_Disciplina INT  NOT NULL,
	Dept CHAR(3),
	PRIMARY KEY (Num_Disciplina),
	UNIQUE(Dnome));
create table INSCRICAO(
	Cpf CHAR(11) NOT NULL,
    Num_Disciplina INT NOT NULL,
    Semestre INT,
    Nota DECIMAL(9,8),
    PRIMARY KEY (Cpf,Num_Disciplina,Semestre));
create table LIVRO(
    ISBN_livro CHAR(7),
    Titulo_livro VARCHAR(70),
    Editora VARCHAR(20),
    Autor VARCHAR(12),
	PRIMARY KEY(ISBN_livro),
	UNIQUE(ISBN_livro));
create table LIVRO_ADOTADO(
    Num_Disciplina INT  NOT NULL,
    Semestre INT,
    ISBN_livro CHAR(7),
    PRIMARY KEY(ISBN_livro,Num_Disciplina,Semestre),
    UNIQUE(ISBN_livro));
	
-- populando/carregando as tabelas do banco de dados

insert into ALUNO values
	('12345678966','João','BSI','1965-01-09'),
	('33344555587','Fernando','LC', '1955-12-08'),
	('99988777767', 'Alice','ADM','1968-01-19'),
	('98765432168','Jennifer','ADM','1941-06-20'),
	('66688444476','Ronaldo','ADM','1962-09-15'),
	('45345345376','Joice','LC','1972-07-31'),
	('98798798733','André','BCC','1969-03-29'),
    ('88866555576','Jorge','BCC','1937-11-10');	
 insert into DISCIPLINA values
	('IAAD',1,'BSI'),
	('FPC',2,'BSI'),
	('AED',3,'MAT');		
insert into INSCRICAO values
    ('12345678966',1,1,9.9),
	('33344555587',2,2,6.8),
	('99988777767',3,3,7.0),
	('98765432168',2,9,4.5),
	('66688444476',2,1,3.8);
insert into LIVRO values
	('PABACA2','Sistemas de Banco de dados','Pearson','Elmasri'),
	('LHEDCA7','Introdução a Algoritmos','THIRD EDITION', 'Cormen'),
	('THFIBE8','Desng Thinking', 'São Paulo','Pedro');	
insert into LIVRO_ADOTADO values
	(1, 1,'PABACA2'),
    (2, 2,'LHEDCA7'),
    (2, 3,'THFIBE8');
-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table INSCRICAO ADD FOREIGN KEY(Cpf) REFERENCES ALUNO(Cpf);
alter table INSCRICAO ADD FOREIGN KEY(Num_Disciplina) REFERENCES DISCIPLINA(Num_Disciplina);
alter table LIVRO ADD FOREIGN KEY(ISBN_livro) REFERENCES LIVRO_ADOTADO(ISBN_livro);
alter table LIVRO_ADOTADO ADD FOREIGN KEY (Num_Disciplina) REFERENCES DISCIPLINA(Num_Disciplina); 
commit;


