-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Companhia Aérea
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Companhia Aérea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Companhia Aérea` DEFAULT CHARACTER SET utf8 ;
USE `Companhia Aérea` ;

-- -----------------------------------------------------
-- Table `Companhia Aérea`.`AEROPORTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Companhia Aérea`.`AEROPORTO` (
  `Codigo_aeroporto` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Cidade` VARCHAR(45) NULL,
  `Estado` VARCHAR(45) NULL,
  PRIMARY KEY (`Codigo_aeroporto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Companhia Aérea`.`VOO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Companhia Aérea`.`VOO` (
  `Numero_voo` INT NOT NULL,
  `Companhia aerea` VARCHAR(255) NULL,
  `Dias da semana` VARCHAR(255) NULL,
  PRIMARY KEY (`Numero_voo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Companhia Aérea`.`TRECHO_VOO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Companhia Aérea`.`TRECHO_VOO` (
  `Numero_voo` INT NULL,
  `Numero_trecho` INT NOT NULL AUTO_INCREMENT,
  `Codigo_aeroporto_partida` INT NULL,
  `Horario_partida_previsto` DATETIME NULL,
  `Codigo_aeroporto_chegada` INT NULL,
  `Horario_chegada_previsto` DATETIME NULL,
  PRIMARY KEY (`Numero_trecho`),
  INDEX `Numero_voo_1_idx` (`Numero_voo` ASC),
  CONSTRAINT `Numero_voo_1`
    FOREIGN KEY (`Numero_voo`)
    REFERENCES `Companhia Aérea`.`VOO` (`Numero_voo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Companhia Aérea`.`INSTANCIA_TRECHO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Companhia Aérea`.`INSTANCIA_TRECHO` (
  `Numero_voo` INT NULL,
  `Numero_trecho` INT NULL,
  `Data` DATE NOT NULL,
  `Numer_assentos_disponiveis` INT NULL,
  `Codigo_aeronave` INT NULL,
  `Codigo_aeroporto_partida` INT NULL,
  `Horario_partida` DATETIME NULL,
  `Codigo_aeroporto_chegada` INT NULL,
  `Horario_chegada` DATETIME NULL,
  PRIMARY KEY (`Data`),
  INDEX `Numero_voo_1_idx` (`Numero_voo` ASC),
  INDEX `Numero_trecho_1_idx` (`Numero_trecho` ASC),
  CONSTRAINT `Numero_voo_2`
    FOREIGN KEY (`Numero_voo`)
    REFERENCES `Companhia Aérea`.`VOO` (`Numero_voo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Numero_trecho_2`
    FOREIGN KEY (`Numero_trecho`)
    REFERENCES `Companhia Aérea`.`TRECHO_VOO` (`Numero_trecho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Companhia Aérea`.`TARIFA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Companhia Aérea`.`TARIFA` (
  `Numero_voo` INT NOT NULL,
  `Codgio_tarifa` INT NOT NULL,
  `Quantidade` INT NULL,
  `Restricoes` VARCHAR(255) NULL,
  PRIMARY KEY (`Numero_voo`, `Codgio_tarifa`),
  CONSTRAINT `Numero_voo_4`
    FOREIGN KEY (`Numero_voo`)
    REFERENCES `Companhia Aérea`.`VOO` (`Numero_voo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Companhia Aérea`.`TIPO_AERONAVE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Companhia Aérea`.`TIPO_AERONAVE` (
  `Nome_tipo_aeronave` VARCHAR(255) NOT NULL,
  `Qtd_max_assentos` INT NULL,
  `Companhia` VARCHAR(255) NULL,
  PRIMARY KEY (`Nome_tipo_aeronave`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Companhia Aérea`.`PODE_POUSAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Companhia Aérea`.`PODE_POUSAR` (
  `Nome_tipo_aeronave` VARCHAR(45) NULL,
  `Codigo_aeroporto` INT NULL,
  INDEX `Tipo_aeronave_1_idx` (`Nome_tipo_aeronave` ASC),
  INDEX `Codigo_aeroporto_1_idx` (`Codigo_aeroporto` ASC),
  CONSTRAINT `Tipo_aeronave_2`
    FOREIGN KEY (`Nome_tipo_aeronave`)
    REFERENCES `Companhia Aérea`.`TIPO_AERONAVE` (`Nome_tipo_aeronave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Codigo_aeroporto_1`
    FOREIGN KEY (`Codigo_aeroporto`)
    REFERENCES `Companhia Aérea`.`AEROPORTO` (`Codigo_aeroporto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Companhia Aérea`.`AERONAVE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Companhia Aérea`.`AERONAVE` (
  `Codigo_aeronave` INT NOT NULL,
  `Numero_total_assentos` INT NULL,
  `Tipo_aeronave` VARCHAR(255) NULL,
  PRIMARY KEY (`Codigo_aeronave`),
  INDEX `Tipo_aeronave_1_idx` (`Tipo_aeronave` ASC),
  CONSTRAINT `Tipo_aeronave_1`
    FOREIGN KEY (`Tipo_aeronave`)
    REFERENCES `Companhia Aérea`.`TIPO_AERONAVE` (`Nome_tipo_aeronave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Companhia Aérea`.`RESERVA_ASSENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Companhia Aérea`.`RESERVA_ASSENTO` (
  `Numero_voo` INT NOT NULL,
  `Numero_trecho` INT NOT NULL,
  `Data` DATE NOT NULL,
  `Numero_assento` INT NOT NULL,
  `Nome_cliente` VARCHAR(255) NULL,
  `Telefone_cliente` VARCHAR(255) NULL,
  PRIMARY KEY (`Numero_voo`, `Numero_trecho`, `Numero_assento`, `Data`),
  INDEX `Numero_trecho_1_idx` (`Numero_trecho` ASC),
  INDEX `Data_trecho_voo_1_idx` (`Data` ASC),
  CONSTRAINT `Numero_voo_3`
    FOREIGN KEY (`Numero_voo`)
    REFERENCES `Companhia Aérea`.`VOO` (`Numero_voo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Trecho_voo_3`
    FOREIGN KEY (`Numero_trecho`)
    REFERENCES `Companhia Aérea`.`TRECHO_VOO` (`Numero_trecho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Data_trecho_voo_1`
    FOREIGN KEY (`Data`)
    REFERENCES `Companhia Aérea`.`INSTANCIA_TRECHO` (`Data`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
