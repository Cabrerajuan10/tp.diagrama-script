SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `bazar_digital_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bazar_digital_db` ;

-- -----------------------------------------------------
-- Table `bazar_digital_db`.`Rols`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazar_digital_db`.`Rols` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bazar_digital_db`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazar_digital_db`.`Employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firs_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `salary` DECIMAL(8,2) NOT NULL,
  `rolId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employees_rols_idx` (`rolId` ASC),
  CONSTRAINT `fk_employees_rols`
    FOREIGN KEY (`rolId`)
    REFERENCES `bazar_digital_db`.`Rols` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bazar_digital_db`.`Uses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazar_digital_db`.`Uses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bazar_digital_db`.`Articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazar_digital_db`.`Articles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `stock` VARCHAR(5000) NOT NULL,
  `useId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_articles_uses_idx` (`useId` ASC),
  CONSTRAINT `fk_articles_uses`
    FOREIGN KEY (`useId`)
    REFERENCES `bazar_digital_db`.`Uses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bazar_digital_db`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazar_digital_db`.`Sales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `payment_method` VARCHAR(45) NOT NULL,
  `total` DECIMAL(8,2) NOT NULL,
  `employeeId` INT NOT NULL,
  `articleId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sales_employees_idx` (`employeeId` ASC),
  INDEX `fk_sales_articles_idx` (`articleId` ASC),
  CONSTRAINT `fk_sales_employees`
    FOREIGN KEY (`employeeId`)
    REFERENCES `bazar_digital_db`.`Employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_articles`
    FOREIGN KEY (`articleId`)
    REFERENCES `bazar_digital_db`.`Articles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
