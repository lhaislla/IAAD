begin;
create schema Compra; 
-- create schema
use Compra;
-- Criando tabelas
create table CLIENTE(
	CodCli INT(4) NOT NULL,
    Nome VARCHAR(40),
    Email VARCHAR(40),
    Telefone INT(9),
	PRIMARY KEY (CodCli));
create table PRODUTO(
	CodProd VARCHAR(8) NOT NULL,
    Descricao VARCHAR(20),
    PRIMARY KEY(CodProd));
create table PEDIDO(
	NumPedido INT NOT NULL,
    PcodCli  INT(4) NOT NULL,
    Data_pedido DATE,
    PRIMARY KEY(NumPedido));
create table ITEM_PEDIDO(
	InumPedido INT(1) NOT NULL,
    NumItem INT(6) NOT NULL,
    IcodProd VARCHAR(5) NOT NULL,
    Quantidade INT NOT NULL,
    PrecoUnitario FLOAT,
    PRIMARY KEY(InumPedido,NumItem));
-- Populando o banco
insert into CLIENTE values
	(2323,'Larissa Pedrosa ','larissa@gmail.com',994731414),
    (1312, 'Margarida Lacerda','marg@gmail.com',991870280),
    (0101, 'Liz Ribeiro','Liz07@gmail.com',998008696),
    (0202, 'Pedro Paulo', 'pp@ghotmail.com',981818283),
    (0303, 'Vinicius Robervaldo', 'robervaldo@live.com', 993826969),
    (0505, 'Anika west','west24@gmail.com',998008872);
insert into PRODUTO values
	('CHP45','Almofada de pelucia'),
    ('LGB67','Caderno de materia'),
    ('PBY90','Pião'),
    ('LIP87','Carro de brinquedo'),
    ('CEP11','baralho'),
    ('EST44','Estilete');
insert into PEDIDO values
	(1,2323,'2020-09-01'),
    (2,1312,'2020-09-02'),
    (3,0101,'2020-09-03'),
    (4,0202,'2020-08-29'),
    (5,0303,'2020-07-05'),
    (6,0505,'2020-07-24');
insert into ITEM_PEDIDO values
	(1, 090821,'CHP45', 3, 8.40),
    (2, 080712,'LGB67', 2, 9.99),
    (3, 061475,'PBY90', 50, 1.50),
    (4, 079741,'LIP87',4, 2.00),
    (5, 059382,'CEP11',2, 9.99),
    (6, 129812,'EST44',23,1.00);
-- Chaves Estrangeiras
alter table PEDIDO ADD FOREIGN KEY(PCodCli) REFERENCES CLIENTE (codCli);
alter table ITEM_PEDIDO ADD FOREIGN KEY (IcodProd) REFERENCES PRODUTO(CodProd)
ON DELETE RESTRICT 
ON UPDATE RESTRICT;
alter table ITEM_PEDIDO ADD FOREIGN KEY (InumPedido) REFERENCES PEDIDO(NumPedido)ON DELETE CASCADE;
commit;
-- Respostas da alternativa b
-- b.1:
-- DELETE FROM PEDIDO WHERE NumPedido = 1;
-- b.2:
-- DELETE FROM PRODUTO WHERE CodProd = 'CHP45';
-- b.3:
-- INSERT INTO ITEM_PEDIDO (Quantidade) VALUES (NULL);
















