begin;
create schema biblioteca; 
-- create schema
use biblioteca;
-- criando as tabelas
create table LIVRO(
	Cod_livro CHAR(7) NOT NULL,
    Titulo VARCHAR(40),
    Nome_editora VARCHAR(10),
    PRIMARY KEY (Cod_livro));
create table LIVRO_AUTOR(
	Autcod_livro CHAR(7) NOT NULL,
    Nome_autor VARCHAR(40),
    PRIMARY KEY(Autcod_livro,Nome_autor));
create table EDITORA(
	Nome VARCHAR(40),
	Endereco VARCHAR(40),
    Telefone INT(9),
    PRIMARY KEY (Nome));
create table LIVRO_COPIAS(
	Copcod_livro CHAR(7) NOT NULL,
    Cod_unidade CHAR(5) NOT NULL,
    Qt_copia INT,
    PRIMARY KEY (Copcod_livro,Cod_unidade));
create table LIVRO_EMPRESTIMO(
	Empcod_livro CHAR(7) NOT NULL,
    Empcod_unidade CHAR(5) NOT NULL,
    Nr_cartao INT(9) NOT NULL,
    Data_emprestimo DATE,
    Data_devolucao DATE,
    PRIMARY KEY (Empcod_livro,Empcod_unidade,Nr_cartao));
create table UNIDADE_BIBLIOTECA(
	Unicod_unidade CHAR(5) NOT NULL,
    Nome_unidade VARCHAR(40),
    Uniendereco VARCHAR(40),
	PRIMARY KEY(Unicod_unidade));
create table USUARIO(
	Num_cartao INT(9) NOT NULL,
	Nome_usuario VARCHAR(40),
    Usuendereco VARCHAR(60),
    Usutelefone INT(9),
    PRIMARY KEY (Num_cartao));
-- Populando as
insert into LIVRO values
	('0102030','Dom casmurro','Rocco'),
    ('0203041','Iracema','Panini'),
    ('0304052','Inocencia', 'Intrinseca'),
    ('0405063','Senhora', 'Nova'),
    ('0506074','A moreninha', 'Moderna'),
    ('0607085','Noite na Taverna','Escala'),
    ('0708096','O cortiço','Garnier'),
    ('0809107', 'Macunaíma','Super');
insert into LIVRO_AUTOR values
	('0102030','Machado de Assis'),
    ('0203041','José de Alencar'),
    ('0304052','Visconde de Taunay'),
    ('0405063','José de Alencar'),
    ('0506074','Joaquim Manuel de Macedo'),
    ('0607085','Álvares de Azevedo'),
    ('0708096','Aluísio Azevedo'),
    ('0809107', 'Mário de Andrade');
insert into EDITORA values
	('Rocco','Rua das flores, 751, São Paulo, SP',991870280),
    ('Panini','Rua do Horto, 35,São Paulo, SP',983920621),
    ('Intrinseca','Rua da lapa, 34, Sao Paulo, SP',995350494),
    ('Nova','Rua Souza Lima, 35, Curitiba, PR',987335879),
    ('Moderna','Av. Arthur de Lima, 54, Santo Andre, SP',994548614),
    ('Escala','Rua Rebouças,65, Piracicaba, SP',996008696),
    ('Garnier','Av. Lucas Obes, 74,São Paulo, SP',991160614),
    ('Super','Rua Timbira, 35,São Paulo, SP',997335741);
insert into LIVRO_COPIAS values
	('0102030','ABCH0',102),
	('0203041','PBCR6',3),
    ('0304052','DENJ1',7),
    ('0405063','ZVLO2',79),
    ('0506074','PPTW3',5),
    ('0607085','LRCE7',63),
    ('0708096','THBC2',24),
    ('0809107','MIRD9',1);
   
insert into LIVRO_EMPRESTIMO values
	('0102030','ABCH0',123456789,'1995-01-28','1995-02-12'),
    ('0203041','PBCR6',879217212,'2004-04-01','2004-04-19'),
    ('0304052','DENJ1',987654321,'2008-01-14','2008-09-21'),
    ('0405063','ZVLO2',794167887,'2015-05-16','2015-07-31'),
    ('0506074','PPTW3',551241271,'2020-02-07','2020-02-10'),
    ('0607085','LRCE7',737312613,'2019-07-03','2019-08-26'),
    ('0708096','THBC2',656524834,'2013-08-01','2013-08-09'),
    ('0809107','MIRD9',100039999,'2020-09-23','2020-09-09');
insert into UNIDADE_BIBLIOTECA values
	('ABCH0','Estudantes','Rua das flores, 751, São Paulo, SP'),
    ('PBCR6','Futuro','Rua do Horto, 35,São Paulo, SP'),
    ('DENJ1','Saber','Rua da lapa, 34, Sao Paulo, SP'),
    ('ZVLO2','Educação','Rua Souza Lima, 35, Curitiba, PR'),
    ('PPTW3','Aprendizado','Av. Arthur de Lima, 54, Santo Andre, SP'),
    ('LRCE7','Construindo histórias','Rua Rebouças,65, Piracicaba, SP'),
    ('THBC2','Novo dia','Av. Lucas Obes, 74,São Paulo, SP'),
    ('MIRD9','Lutas','Rua Timbira, 35,São Paulo, SP');
insert into USUARIO values
	(123456789,'Pedro Camargo Ferreira', 'Rua Coelho Rodrigues, 1175, Teresina, PI',993931313),
    (879217212, 'Roberto Ribeiro Rodrigues', ' Rua Chile, 7, Uberaba, MG',995356666),
	(987654321, 'Carolina Vicente Pereira','Avenida Rio Grande do Norte, 22, Natal, RN',991131430),
    (794167887, 'Paula Roberta Neves', 'Rua José bonifacio, 60, Recife, PE',998000071),
    (551241271, 'Kassiana Moura de Souza','Rua Embaixador Thiago Souto Maior, 54,João Pessoa, PB',996967678),
    (737312613,'Douglas Pedrosa da Silva', 'Travessa da Independência, 10, Curitiba, PA',992848454),
	(656524834, 'Fernanda Oliveira Ramos', 'Rua Embaixador Valadares, 714, Rio de Janeiro, RJ',981171791),
    (100039999,'Laura Macêdo Diniz','Rua Eptacio Coimbra, 210, Recife, PE',983830083);
-- Restrições/Chave estrangeira 
alter table LIVRO_AUTOR ADD FOREIGN KEY(Autcod_livro) REFERENCES LIVRO(Cod_livro);
alter table LIVRO_COPIAS ADD FOREIGN KEY(Copcod_livro) REFERENCES LIVRO(Cod_livro);
alter table LIVRO_EMPRESTIMO ADD FOREIGN KEY(Empcod_livro) REFERENCES LIVRO(Cod_livro);
alter table LIVRO  ADD FOREIGN KEY(Nome_editora) REFERENCES EDITORA(Nome);
alter table LIVRO_COPIAS ADD FOREIGN KEY(Cod_unidade) REFERENCES  UNIDADE_BIBLIOTECA(Unicod_unidade);
alter table LIVRO_EMPRESTIMO ADD FOREIGN KEY( Empcod_unidade) REFERENCES  UNIDADE_BIBLIOTECA(Unicod_unidade);
alter table LIVRO_EMPRESTIMO ADD FOREIGN KEY(Nr_cartao) REFERENCES USUARIO(Num_cartao);
Commit;

-- SELECT Titulo FROM LIVRO WHERE Nome_editora = 'Moderna';
-- SELECT Titulo,Nome_autor FROM LIVRO, LIVRO_AUTOR ; 
-- SELECT * FROM LIVRO, UNIDADE_BIBLIOTECA WHERE Titulo = 'Sistemas de Banco de Dados' AND  Nome_unidade ='Sede_UFRPE';
-- SELECT COUNT(Titulo) FROM LIVRO, UNIDADE_BIBLIOTECA WHERE Titulo = 'Sistemas de Banco de Dados' AND  Nome_unidade ='Sede_UFRPE';
-- SELECT Titulo FROM LIVRO,LIVRO_EMPRESTIMO WHERE Data_emprestimo  BETWEEN '2020-08-01' AND'2020-09-01';
SELECT Nome_usuario,Nome_unidade,Titulo FROM USUARIO,UNIDADE_BIBLIOTECA,LIVRO WHERE Nome_usuario LIKE "A%";

