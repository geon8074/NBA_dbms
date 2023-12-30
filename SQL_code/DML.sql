# 시카고 불스의 잭 라빈과 LA 레이커스의 오스틴 리브스를 1대1 트레이드 할 경우
UPDATE player
SET team_Team_Name = 'Los Angeles Lakers'
WHERE Full_Name = 'Zach Lavine';

UPDATE player
SET team_Team_Name = 'Chicago Bulls'
WHERE Full_Name = 'Austin Reaves';

# G리그에서 데이먼드 그린의 무기한 출장 정지로 로스터로 PF 신인 선수를 콜업할 경우
# NBA 특성상 1군 로스터에 부상당하거나 시즌아웃 당한 선수도 계속 유지
INSERT 
INTO player(Full_name, Pos, Age, team_Team_Name)
VALUES('Usman Garuba', 'PF', 21, 'Golden State Warriors'); 

# 선수 스탯에도 등록 ,신인이라 스탯이 전부 0으로 시작
INSERT
INTO player_stat(player_Full_name, G, MP, FG, FGA, FT, FTA, TRB, AST, STL, BLK, TOV, PF ,PTS)
VALUES ('Usman Garuba', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
