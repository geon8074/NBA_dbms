USE `nba` ;

CREATE TABLE IF NOT EXISTS `nba`.`team` (
  `Team_name` VARCHAR(45) NOT NULL,
  `Years` INT NULL,
  `Game` INT NULL,
  `Win` INT NULL,
  `Lose` INT NULL,
  `Win_rate` VARCHAR(45) NULL,
  `Playoffs` INT NULL,
  `Division` INT NULL,
  `Conference` INT NULL,
  `Champ` INT NULL,
  PRIMARY KEY (`Team_name`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `nba`.`manager` (
  `manager_id` INT NOT NULL AUTO_INCREMENT,
  `Full_name` VARCHAR(45) NOT NULL,
  `team_Team_name` VARCHAR(45) NOT NULL,
  `Current_regular_game` INT NULL,
  `Current_regular_win` INT NULL,
  `Current_regular_lose` INT NULL,
  `Total_regular_game` INT NULL,
  `Total_regular_win` INT NULL,
  `Total_regular_lose` INT NULL,
  `Current_playoffs_game` INT NULL,
  `Current_playoffs_win` INT NULL,
  `Current_playoffs_lose` INT NULL,
  `Total_playoffs_game` INT NULL,
  `Total_playoffs_win` INT NULL,
  `Total_playoffs_lose` INT NULL,
  PRIMARY KEY (`manager_id`),
  UNIQUE INDEX `Full name_UNIQUE` (`Full_name` ASC) VISIBLE,
  INDEX `fk_manager_team1_idx` (`team_Team_name` ASC) VISIBLE,
  CONSTRAINT `fk_manager_team1`
    FOREIGN KEY (`team_Team_name`)
    REFERENCES `nba`.`team` (`Team_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `nba`.`coach` (
  `coach_id` INT NOT NULL AUTO_INCREMENT,
  `Full_name` VARCHAR(45) NOT NULL,
  `team_Team_name` VARCHAR(45) NOT NULL,
  `Coach type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`coach_id`),
  UNIQUE INDEX `Full name_UNIQUE` (`Full_name` ASC) VISIBLE,
  INDEX `fk_coach_team1_idx` (`team_Team_name` ASC) VISIBLE,
  CONSTRAINT `fk_coach_team1`
    FOREIGN KEY (`team_Team_name`)
    REFERENCES `nba`.`team` (`Team_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `nba`.`general manager` (
  `general_manager_id` INT NOT NULL AUTO_INCREMENT,
  `Full_name` VARCHAR(45) NOT NULL,
  `team_Team_name` VARCHAR(45) NOT NULL,
  `Years_In_Role` INT NULL,
  `Nationality` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`general_manager_id`),
  UNIQUE INDEX `Full name_UNIQUE` (`Full_name` ASC) VISIBLE,
  INDEX `fk_general manager_team1_idx` (`team_Team_name` ASC) VISIBLE,
  CONSTRAINT `fk_general manager_team1`
    FOREIGN KEY (`team_Team_name`)
    REFERENCES `nba`.`team` (`Team_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `nba`.`player` (
  `Full_Name` VARCHAR(45) NOT NULL,
  `team_Team_name` VARCHAR(45) NOT NULL,
  `Pos` VARCHAR(45) NOT NULL,
  `Age` INT NOT NULL,
  PRIMARY KEY (`Full_Name`),
  INDEX `fk_player_team1_idx` (`team_Team_name` ASC) VISIBLE,
  CONSTRAINT `fk_player_team1`
    FOREIGN KEY (`team_Team_name`)
    REFERENCES `nba`.`team` (`Team_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `nba`.`player_stat` (
  `player_Full_Name` VARCHAR(45) NOT NULL,
  `G` INT NULL,
  `MP` INT NULL,
  `FG` INT NULL,
  `FGA` INT NULL,
  `FT` INT NULL,
  `FTA` INT NULL,
  `TRB` INT NULL,
  `AST` INT NULL,
  `STL` INT NULL,
  `BLK` INT NULL,
  `TOV` INT NULL,
  `PF` INT NULL,
  `PTS` INT NULL,
  INDEX `fk_player_stat_player1_idx` (`player_Full_Name` ASC) VISIBLE,
  PRIMARY KEY (`player_Full_Name`),
  CONSTRAINT `fk_player_stat_player1`
    FOREIGN KEY (`player_Full_Name`)
    REFERENCES `nba`.`player` (`Full_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;