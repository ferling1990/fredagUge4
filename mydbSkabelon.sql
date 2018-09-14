-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`zipcodes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`zipcodes` (
  `zip` INT(11) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`zip`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `cno` INT(11) NOT NULL,
  `cname` VARCHAR(255) NOT NULL,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `zip` INT(11) NOT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cno`, `zip`),
  INDEX `fk_customers_zipcodes1_idx` (`zip` ASC),
  CONSTRAINT `fk_customers_zipcodes1`
    FOREIGN KEY (`zip`)
    REFERENCES `mydb`.`zipcodes` (`zip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employees` (
  `eno` INT(11) NOT NULL,
  `ename` VARCHAR(255) NOT NULL,
  `zip` INT(11) NOT NULL,
  `hdate` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`eno`, `zip`),
  INDEX `fk_employees_zipcodes_idx` (`zip` ASC),
  CONSTRAINT `fk_employees_zipcodes`
    FOREIGN KEY (`zip`)
    REFERENCES `mydb`.`zipcodes` (`zip`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `ono` INT(11) NOT NULL,
  `cno` INT(11) NOT NULL,
  `eno` INT(11) NOT NULL,
  `recieved` DATETIME NOT NULL,
  `shipped` DATETIME NOT NULL,
  PRIMARY KEY (`ono`, `cno`, `eno`),
  INDEX `fk_orders_customers1_idx` (`cno` ASC),
  INDEX `fk_orders_employees1_idx` (`eno` ASC),
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`cno`)
    REFERENCES `mydb`.`customers` (`cno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_employees1`
    FOREIGN KEY (`eno`)
    REFERENCES `mydb`.`employees` (`eno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`parts` (
  `pno` INT(11) NOT NULL,
  `pname` VARCHAR(255) NOT NULL,
  `qoh` INT(11) NULL DEFAULT NULL,
  `price` INT(11) NOT NULL,
  `olevel` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`odetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`odetails` (
  `ono` INT(11) NOT NULL,
  `pno` INT(11) NOT NULL,
  `qty` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ono`, `pno`),
  INDEX `fk_odetails_parts1_idx` (`pno` ASC),
  CONSTRAINT `fk_odetails_orders1`
    FOREIGN KEY (`ono`)
    REFERENCES `mydb`.`orders` (`ono`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_odetails_parts1`
    FOREIGN KEY (`pno`)
    REFERENCES `mydb`.`parts` (`pno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
