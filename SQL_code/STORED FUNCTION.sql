DELIMITER //

CREATE FUNCTION calculate_fg_success_rate(FG INT, FGA INT) RETURNS DECIMAL(5, 2) Deterministic

BEGIN
    DECLARE fg_success_rate DECIMAL(5, 2);

    IF FGA > 0 THEN
        SET fg_success_rate = (FG / FGA) ;
    ELSE
        SET fg_success_rate = 0;
    END IF;

    RETURN fg_success_rate;
END //

DELIMITER ;

# calculate_fg_success_rate 함수를 이용해 모든 선수의 야투 성공율 계산 
SELECT player_Full_Name, G, MP, FG, FGA, calculate_fg_success_rate(FG, FGA) AS FGPER, FT, FTA, TRB, AST, STL,BLK, TOV, PF, PTS
FROM player_stat ;