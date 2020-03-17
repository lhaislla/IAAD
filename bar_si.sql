#
#Scripts baseados no nos scripts do livro 
#"Head First SQL"
#
DROP DATABASE IF EXISTS bar_si;

CREATE DATABASE bar_si;

USE DATABASE bar_si;

CREATE TABLE `bebidas` (
  `nome_bebida` VARCHAR(16) DEFAULT NULL,
  `ingrediente1` VARCHAR(20) DEFAULT NULL,
  `qtd1` DECIMAL(3,1) DEFAULT NULL,
  `ingrediente2` VARCHAR(20) DEFAULT NULL,
  `qtd2` DECIMAL(4,2) DEFAULT NULL,
  `instrucoes` VARCHAR(250) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;

INSERT INTO `bebidas` (`nome_bebida`,`ingrediente1`,`qtd1`,`ingrediente2`,`qtd2`,`instrucoes`) VALUES 
('Kiss on the Lips','cherry juice',2.0,'apricot nectar',7.00,'serve over ice with straw'),
('Hot Gold','peach nectar',3.0,'orange juice',6.00,'pour hot orange juice in mug and add peach nectar'),
('Lone Tree','soda',1.5,'cherry juice',0.75,'stir with ice, strain into cocktail glass'),
('Greyhound','soda',1.5,'grapefruit juice',5.00,'serve over ice, stir well'),
('Indian Summer','apple juice',2.0,'hot tea',6.00,'add juice to mug and top off with hot tea'),
('Bull Frog','iced tea',1.5,'lemonade',5.00,'serve over ice with lime slice'),
('Soda and It','soda',2.0,'grape juice',1.00,'shake in cocktail glass, no ice'),
('Blackthorn','tonic water',1.5,'pineapple juice',1.00,'stir with ice, strain into cocktail glass with lemon twist'),
('Blue Moon','soda',1.5,'blueberry juice',0.75,'stir with ice, strain into cocktail glass with lemon twist'),
('Oh My Gosh','peach nectar',1.0,'pineapple juice',1.00,'stir with ice, strain into shot glass'),
('Lime Fizz','Sprite',1.5,'lime juice',0.75,'stir with ice, strain into cocktail glass');


CREATE TABLE `info_bebidas` (
  `nome_bebida` VARCHAR(16) DEFAULT NULL,
  `preco` DECIMAL(4,2) DEFAULT NULL,
  `carboidratos` DECIMAL(4,2) DEFAULT NULL,
  `cor` VARCHAR(20) DEFAULT NULL,
  `gelo` CHAR(1) DEFAULT NULL,
  `calorias` INT(11) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;

INSERT INTO `info_bebidas` VALUES 
('Blackthorn', 3, 8.4, 'yellow', 'Y', 33),
('Blue Moon', 2.5, 3.2, 'blue', 'Y', 12),
('Oh My Gosh', 3.5, 8.6, 'orange', 'Y', 35),
('Lime Fizz', 2.5, 5.4, 'green', 'Y', 24),
('Kiss on the Lips', 5.5, 42.5, 'purple', 'Y', 171),
('Hot Gold', 3.2, 32.1, 'orange', 'N', 135),
('Lone Tree', 3.6, 4.2, 'red', 'Y', 17),
('Greyhound', 4, 14, 'yellow', 'Y', 50), 
('Indian Summer', 2.8, 7.2, 'brown', 'N', 30),
('Bull Frog', 2.6, 21.5, 'tan', 'Y', 80),
('Soda and It', 3.8, 4.7, 'red', 'N', 19), 
('Slim Shady', 4.35, NULL, 'clear', 'Y', NULL);