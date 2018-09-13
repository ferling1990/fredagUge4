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
-- -----------------------------------------------------
-- Schema fredagsOpgaver
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`zipcodes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`zipcodes` (
  `zip` INT NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`zip`));


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employees` (
  `eno` INT NOT NULL,
  `ename` VARCHAR(255) NOT NULL,
  `hdate` DATETIME NULL,
  `zip` INT NOT NULL,
  PRIMARY KEY (`eno`, `zip`),
  INDEX `fk_employees_zipcodes_idx` (`zip` ASC),
  CONSTRAINT `fk_employees_zipcodes`
    FOREIGN KEY (`zip`)
    REFERENCES `mydb`.`zipcodes` (`zip`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);


-- -----------------------------------------------------
-- Table `mydb`.`parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`parts` (
  `pno` INT NOT NULL,
  `pname` VARCHAR(255) NOT NULL,
  `qoh` INT NULL,
  `price` INT NOT NULL,
  `olevel` INT NULL,
  PRIMARY KEY (`pno`));


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `cno` INT NOT NULL,
  `cname` VARCHAR(255) NOT NULL,
  `street` VARCHAR(45) NULL,
  `phone` INT NULL,
  `zip` INT NOT NULL,
  PRIMARY KEY (`cno`, `zip`),
  INDEX `fk_customers_zipcodes1_idx` (`zip` ASC),
  CONSTRAINT `fk_customers_zipcodes1`
    FOREIGN KEY (`zip`)
    REFERENCES `mydb`.`zipcodes` (`zip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `ono` INT NOT NULL,
  `recieved` DATETIME NOT NULL,
  `shipped` DATETIME NOT NULL,
  `cno` INT NOT NULL,
  `eno` INT NOT NULL,
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
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`odetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`odetails` (
  `ono` INT NOT NULL,
  `qty` INT NULL,
  `pno` INT NOT NULL,
  PRIMARY KEY (`ono`, `pno`),
  INDEX `fk_odetails_parts1_idx` (`pno` ASC),
  CONSTRAINT `fk_odetails_parts1`
    FOREIGN KEY (`pno`)
    REFERENCES `mydb`.`parts` (`pno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_odetails_orders1`
    FOREIGN KEY (`ono`)
    REFERENCES `mydb`.`orders` (`ono`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
