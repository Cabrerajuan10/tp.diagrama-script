SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `tp.diseñoydefinicion` DEFAULT CHARACTER SET utf8 ;

-- -----------------------------------------------------
-- Table `playground_db`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground_db`.`courses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `Coursescol` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `date_start` DATE NOT NULL,
  `date_end` DATE NOT NULL,
  `quota` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground_db`.`units`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground_db`.`units` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `date_start` DATE NOT NULL,
  `courseID` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_units_courses_idx` (`courseID` ASC),
  CONSTRAINT `fk_units_courses`
    FOREIGN KEY (`courseID`)
    REFERENCES `playground_db`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground_db`.`lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground_db`.`lessons` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `date_start` DATE NOT NULL,
  `visible` TINYINT NOT NULL,
  `unitId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lessons_units_idx` (`unitId` ASC),
  CONSTRAINT `fk_lessons_units`
    FOREIGN KEY (`unitId`)
    REFERENCES `playground_db`.`units` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground_db`.`types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground_db`.`types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground_db`.`blocks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground_db`.`blocks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `visible` TINYINT(1) NOT NULL,
  `typeId` INT NOT NULL,
  `lessonId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bloks_types_idx` (`typeId` ASC),
  INDEX `fk_blocks_lessons_idx` (`lessonId` ASC),
  CONSTRAINT `fk_blocks_lessons`
    FOREIGN KEY (`lessonId`)
    REFERENCES `playground_db`.`lessons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bloks_types`
    FOREIGN KEY (`typeId`)
    REFERENCES `playground_db`.`types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground_db`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground_db`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `categoryId` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_category_idx` (`categoryId` ASC),
  CONSTRAINT `fk_users_category`
    FOREIGN KEY (`categoryId`)
    REFERENCES `playground_db`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playground_db`.`courses_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playground_db`.`courses_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `courseId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_courses_idx` (`userId` ASC),
  INDEX `fk_courses_users_idx` (`courseId` ASC),
  CONSTRAINT `fk_courses_users`
    FOREIGN KEY (`courseId`)
    REFERENCES `playground_db`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_courses`
    FOREIGN KEY (`userId`)
    REFERENCES `playground_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `tp.diseñoydefinicion` ;

-- -----------------------------------------------------
-- Table `tp.diseñoydefinicion`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp.diseñoydefinicion`.`courses` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `Coursescol` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `date_start` DATE NOT NULL,
  `date_end` DATE NOT NULL,
  `quota` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tp.diseñoydefinicion`.`units`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp.diseñoydefinicion`.`units` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `date_start` DATE NOT NULL,
  `courseID` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_units_courses_idx` (`courseID` ASC),
  CONSTRAINT `fk_units_courses`
    FOREIGN KEY (`courseID`)
    REFERENCES `tp.diseñoydefinicion`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tp.diseñoydefinicion`.`lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp.diseñoydefinicion`.`lessons` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `date_start` DATE NOT NULL,
  `visible` TINYINT(1) NOT NULL,
  `unitId` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lessons_units_idx` (`unitId` ASC),
  CONSTRAINT `fk_lessons_units`
    FOREIGN KEY (`unitId`)
    REFERENCES `tp.diseñoydefinicion`.`units` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tp.diseñoydefinicion`.`types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp.diseñoydefinicion`.`types` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tp.diseñoydefinicion`.`blocks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp.diseñoydefinicion`.`blocks` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `visible` TINYINT(1) NOT NULL,
  `typeId` INT(11) NOT NULL,
  `lessonId` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bloks_types_idx` (`typeId` ASC),
  INDEX `fk_blocks_lessons_idx` (`lessonId` ASC),
  CONSTRAINT `fk_blocks_lessons`
    FOREIGN KEY (`lessonId`)
    REFERENCES `tp.diseñoydefinicion`.`lessons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bloks_types`
    FOREIGN KEY (`typeId`)
    REFERENCES `tp.diseñoydefinicion`.`types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tp.diseñoydefinicion`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp.diseñoydefinicion`.`categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tp.diseñoydefinicion`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp.diseñoydefinicion`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `categoryId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_category_idx` (`categoryId` ASC),
  CONSTRAINT `fk_users_category`
    FOREIGN KEY (`categoryId`)
    REFERENCES `tp.diseñoydefinicion`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tp.diseñoydefinicion`.`courses_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp.diseñoydefinicion`.`courses_users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `userId` INT(11) NOT NULL,
  `courseId` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_courses_idx` (`userId` ASC),
  INDEX `fk_courses_users_idx` (`courseId` ASC),
  CONSTRAINT `fk_courses_users`
    FOREIGN KEY (`courseId`)
    REFERENCES `tp.diseñoydefinicion`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_courses`
    FOREIGN KEY (`userId`)
    REFERENCES `tp.diseñoydefinicion`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
