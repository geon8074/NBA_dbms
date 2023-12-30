DELIMITER //
CREATE PROCEDURE Player_check_by_team(

IN ClubName varchar(50))

BEGIN
SELECT * From player where team_Team_name = ClubName;

END //
DELIMITER ;

#실행코드
#call Player_check_by_team('Milwaukee Bucks');