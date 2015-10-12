-- MySQL Script generated by MySQL Workbench
-- 10/11/15 20:29:45
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema store_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `store_db` ;

-- -----------------------------------------------------
-- Schema store_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `store_db` DEFAULT CHARACTER SET latin1 ;
USE `store_db` ;

-- -----------------------------------------------------
-- Table `store_db`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store_db`.`users` ;

CREATE TABLE IF NOT EXISTS `store_db`.`users` (
  `uname` VARCHAR(16) NULL DEFAULT NULL COMMENT '',
  `email` VARCHAR(50) NULL DEFAULT NULL COMMENT '',
  `pass` VARCHAR(16) NULL DEFAULT NULL COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;