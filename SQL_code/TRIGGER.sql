DELIMITER //

CREATE TRIGGER update_manager_stats
AFTER UPDATE ON team
FOR EACH ROW
BEGIN
  IF NEW.Win > OLD.Win THEN
    -- Update manager table
    UPDATE manager
    SET
      Current_regular_game = Current_regular_game + (NEW.Win- OLD.Win),
      Current_regular_win = Current_regular_win + (NEW.Win - OLD.Win)
    WHERE team_Team_name = NEW.Team_name;
  END IF;
END //

DELIMITER ;

UPDATE team
SET Win = Win + 3
WHERE Team_name = 'Atlanta Hawks';