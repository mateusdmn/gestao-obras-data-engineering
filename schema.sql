-- SQL Clean & Optimized for Data Portfolio
-- Target: MySQL 8.0+

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema jdm_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jdm_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `jdm_db` ;

-- -----------------------------------------------------
-- Table `jdm_db`.`monetizacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jdm_db`.`monetizacoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_plano` VARCHAR(255) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  `ativo` TINYINT(1) NULL DEFAULT '1',
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `jdm_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jdm_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `edcadastrado` VARCHAR(255) NULL DEFAULT NULL, -- Representa a Região/Bairro do Usuário
  `planoId` INT NULL DEFAULT '1',                 -- Chave Estrangeira ligando o usuário ao plano escolhido
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_user_email` (`email` ASC) VISIBLE,
  UNIQUE INDEX `uq_user_cpf` (`cpf` ASC) VISIBLE,
  CONSTRAINT `fk_users_monetizacoes`
    FOREIGN KEY (`planoId`)
    REFERENCES `jdm_db`.`monetizacoes` (`id`)
    ON UPDATE CASCADE
    ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `jdm_db`.`constructions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jdm_db`.`constructions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `cnpjCpf` VARCHAR(18) NOT NULL,
  `nomeObra` VARCHAR(255) NOT NULL,
  `localObra` VARCHAR(255) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `dataInicio` DATE NOT NULL,
  `previsaoTermino` DATE NULL DEFAULT NULL,
  `fotoObra` VARCHAR(255) NULL DEFAULT NULL,
  `status` ENUM('Em Planejamento', 'Em Andamento', 'Concluída', 'Suspensa', 'Atrasada') NULL DEFAULT 'Em Planejamento',
  `progresso` INT NULL DEFAULT '0',
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_construction_userId` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_constructions_users`
    FOREIGN KEY (`userId`)
    REFERENCES `jdm_db`.`users` (`id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;