
CREATE SCHEMA IF NOT EXISTS `bd1`;
USE `bd1` ;

CREATE TABLE IF NOT EXISTS `Endereco` (
  `idEndereco` INT NOT NULL,
  `CEP` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  `Numero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereco`));


CREATE TABLE IF NOT EXISTS `Universidade` (
  `idUniversidade` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idUniversidade`),
  UNIQUE (`Endereco_idEndereco`),
  FOREIGN KEY (`Endereco_idEndereco`) REFERENCES `Endereco` (`idEndereco`));


CREATE TABLE IF NOT EXISTS `Curso` (
  `idCurso` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Periodo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCurso`));
  
  
CREATE TABLE IF NOT EXISTS `Empresa` (
  `idEmpresa` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(255) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idEmpresa`),
  UNIQUE (`Endereco_idEndereco`),
    FOREIGN KEY (`Endereco_idEndereco`)REFERENCES `Endereco` (`idEndereco`));

CREATE TABLE IF NOT EXISTS `Area` (
  `idArea` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`idArea`),
    FOREIGN KEY (`Curso_idCurso`)REFERENCES `Curso` (`idCurso`));
  
  CREATE TABLE IF NOT EXISTS `Vaga` (
  `idVaga` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `Nome` VARCHAR(255) NULL,
  `Tipo` VARCHAR(40) NULL,
  `Habilidades` VARCHAR(255) NULL,
  `Area_idArea` INT NOT NULL,
  `Empresa_idEmpresa` INT NOT NULL,
  PRIMARY KEY (`idVaga`),
    FOREIGN KEY (`Area_idArea`) REFERENCES `Area` (`idArea`),
    FOREIGN KEY (`Empresa_idEmpresa`)REFERENCES `Empresa` (`idEmpresa`));

CREATE TABLE IF NOT EXISTS `Candidato` (
  `idCandidato` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Curso_idCurso` INT NOT NULL,
  `Universidade_idUniversidade` INT NOT NULL,
  `Vaga_idVaga` INT NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idCandidato`),
  UNIQUE (`Endereco_idEndereco`),
  UNIQUE (`CPF`),
    FOREIGN KEY (`Curso_idCurso`) REFERENCES `Curso`(`idCurso`),
    FOREIGN KEY (`Universidade_idUniversidade`) REFERENCES `Universidade` (`idUniversidade`),
    FOREIGN KEY (`Vaga_idVaga`) REFERENCES `Vaga` (`idVaga`),
    FOREIGN KEY (`Endereco_idEndereco`)REFERENCES `Endereco` (`idEndereco`));





