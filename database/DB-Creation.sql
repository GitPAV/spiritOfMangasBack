-- MySQL Script generated by MySQL Workbench
-- Wed May 29 11:42:32 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- HOW TO IMPORT FILE :
-- Open msql server : 
-- mysql -u root -p
-- Create the database :
-- CREATE SCHEMA IF NOT EXISTS `spiritofmanga` DEFAULT CHARACTER SET utf8 ;
-- Exit the database (ctrl+C)
-- Run this command :
-- mysql -u root -p spiritofmanga < DB-Creation.sql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `spiritofmanga`.`publics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`publics` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spiritofmanga`.`types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`types` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spiritofmanga`.`series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`series` (
  `id` INT NOT NULL,
  `nameSeries` VARCHAR(45) NOT NULL,
  `types_id` INT NOT NULL,
  `photoCover` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE INDEX `fk_Series_Type1_idx` ON `spiritofmanga`.`series` (`types_id` ASC);


-- -----------------------------------------------------
-- Table `spiritofmanga`.`mangas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`mangas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `series_id` INT NOT NULL,
  `publics_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `photoCover` VARCHAR(200) NOT NULL,
  `tome` INT NOT NULL,
  `auteur` VARCHAR(45) NOT NULL,
  `editeur` VARCHAR(45) NULL,
  `resume` VARCHAR(500) NOT NULL,
  `prixNeuf` INT NOT NULL,
  `stockTotal` INT NOT NULL,
  `weight` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = DEFAULT;

CREATE INDEX `fk_Mangas_Public1_idx` ON `spiritofmanga`.`mangas` (`publics_id` ASC);

CREATE INDEX `fk_Mangas_Series1_idx` ON `spiritofmanga`.`mangas` (`series_id` ASC);


-- -----------------------------------------------------
-- Table `spiritofmanga`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pseudo` VARCHAR(45) NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `password` VARCHAR(12) NOT NULL,
  `forgetPassword` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telephone` INT NULL,
  `numRue` INT NOT NULL,
  `rue` VARCHAR(45) NOT NULL,
  `cp` INT NOT NULL,
  `ville` VARCHAR(45) NOT NULL,
  `connaissance` VARCHAR(50) NOT NULL,
  `newsletter` TINYINT NOT NULL,
  `droits` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spiritofmanga`.`mangasOrders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`mangasOrders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `users_id` INT NOT NULL,
  `mangas_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `disponibilité` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE INDEX `fk_Commandes/Manga_Mangas1_idx` ON `spiritofmanga`.`mangasOrders` (`mangas_id` ASC);

CREATE INDEX `fk_Commandes/Manga_Users1_idx` ON `spiritofmanga`.`mangasOrders` (`users_id` ASC);


-- -----------------------------------------------------
-- Table `spiritofmanga`.`packs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`packs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `namePack` VARCHAR(80) NOT NULL,
  `photoPack` VARCHAR(200) NOT NULL,
  `resumePack` VARCHAR(800) NOT NULL,
  `stock` INT NOT NULL,
  `weight` INT NOT NULL,
  `prixHT` INT NOT NULL,
  `TVA` INT NOT NULL,
  `prixTTC` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spiritofmanga`.`packsMangas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`packsMangas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mangas_id` INT NOT NULL,
  `packs_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE INDEX `fk_Packs/Mangas_Mangas1_idx` ON `spiritofmanga`.`packsMangas` (`mangas_id` ASC);

CREATE INDEX `fk_Packs/Mangas_Packs1_idx` ON `spiritofmanga`.`packsMangas` (`packs_id` ASC);


-- -----------------------------------------------------
-- Table `spiritofmanga`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`genres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spiritofmanga`.`states`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`states` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spiritofmanga`.`packsOrders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`packsOrders` (
  `id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `packs_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `disponibility` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE INDEX `fk_Commandes/Pack_Packs1_idx` ON `spiritofmanga`.`packsOrders` (`packs_id` ASC);

CREATE INDEX `fk_Commandes/Pack_Users1_idx` ON `spiritofmanga`.`packsOrders` (`users_id` ASC);


-- -----------------------------------------------------
-- Table `spiritofmanga`.`packsAwaiting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`packsAwaiting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `packsOrders_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE INDEX `fk_Pack en attente_Commandes/Pack1_idx` ON `spiritofmanga`.`packsAwaiting` (`packsOrders_id` ASC);


-- -----------------------------------------------------
-- Table `spiritofmanga`.`mangasAwaiting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`mangasAwaiting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mangasOrders_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE INDEX `fk_Manga en attente_Commandes/Manga1_idx` ON `spiritofmanga`.`mangasAwaiting` (`mangasOrders_id` ASC);


-- -----------------------------------------------------
-- Table `spiritofmanga`.`genresMangas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`genresMangas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genres_id` INT NOT NULL,
  `mangas_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE INDEX `fk_Genre/Manga_Genres1_idx` ON `spiritofmanga`.`genresMangas` (`genres_id` ASC);

CREATE INDEX `fk_Genre/Manga_Mangas1_idx` ON `spiritofmanga`.`genresMangas` (`mangas_id` ASC);


-- -----------------------------------------------------
-- Table `spiritofmanga`.`statesMangas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spiritofmanga`.`statesMangas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `states_id` INT NOT NULL,
  `mangas_id` INT NOT NULL,
  `comment` VARCHAR(100) NULL,
  `stock` INT NOT NULL,
  `promo` TINYINT(1) NOT NULL,
  `promoValue` INT NULL,
  `prixHT` INT NOT NULL,
  `TVA` INT NOT NULL,
  `prixTTC` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE INDEX `fk_states_has_mangas_mangas1_idx` ON `spiritofmanga`.`statesMangas` (`mangas_id` ASC);

CREATE INDEX `fk_states_has_mangas_states1_idx` ON `spiritofmanga`.`statesMangas` (`states_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
