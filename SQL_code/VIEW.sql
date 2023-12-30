# 전 경기 출장중인 선수 (현재 진행경기가 19경기)
CREATE VIEW AllgamePlayer AS
	  SELECT Full_name, team_Team_name, Pos, Age, player_Full_name, G, MP, FG, FGA, FT, FTA, TRB, AST, STL, BLK, TOV, PF ,PTS
      FROM player 
      JOIN  (SELECT player_Full_name, G, MP, FG, FGA, FT, FTA, TRB, AST, STL, BLK, TOV, PF ,PTS
	  FROM	player_stat WHERE G = 19) AS pa
      ON player.Full_name = pa.player_Full_name;
# 총 득점 상위권 10인 
CREATE VIEW PointRank AS
	  SELECT Full_name, team_Team_name, Pos, Age, player_Full_name, G, MP, FG, FGA, FT, FTA, TRB, AST, STL, BLK, TOV, PF ,PTS
      FROM player 
      JOIN  (SELECT player_Full_name, G, MP, FG, FGA, FT, FTA, TRB, AST, STL, BLK, TOV, PF ,PTS FROM player_stat) AS pa
      ON player.Full_name = pa.player_Full_name
      ORDER BY PTS DESC
      LIMIT 0, 10;
# 어시스트 상위권 10인
CREATE VIEW AssistRank AS
	  SELECT Full_name, team_Team_name, Pos, Age, player_Full_name, G, MP, FG, FGA, FT, FTA, TRB, AST, STL, BLK, TOV, PF ,PTS
      FROM player 
      JOIN  (SELECT player_Full_name, G, MP, FG, FGA, FT, FTA, TRB, AST, STL, BLK, TOV, PF ,PTS FROM player_stat) AS pa
      ON player.Full_name = pa.player_Full_name
      ORDER BY AST DESC
      LIMIT 0, 10;
# 리바운드 상위권 10인
CREATE VIEW ReboundRank AS
	  SELECT Full_name, team_Team_name, Pos, Age, player_Full_name, G, MP, FG, FGA, FT, FTA, TRB, AST, STL, BLK, TOV, PF ,PTS
      FROM player 
      JOIN  (SELECT player_Full_name, G, MP, FG, FGA, FT, FTA, TRB, AST, STL, BLK, TOV, PF ,PTS FROM player_stat) AS pa
      ON player.Full_name = pa.player_Full_name
      ORDER BY TRB DESC
      LIMIT 0, 10;
# 블락 상위권 10인
CREATE VIEW BlockRank AS
	  SELECT Full_name, team_Team_name, Pos, Age, player_Full_name, G, MP, FG, FGA, FT, FTA, TRB, AST, STL, BLK, TOV, PF ,PTS
      FROM player 
      JOIN  (SELECT player_Full_name, G, MP, FG, FGA, FT, FTA, TRB, AST, STL, BLK, TOV, PF ,PTS FROM player_stat) AS pa
      ON player.Full_name = pa.player_Full_name
      ORDER BY BLK DESC
      LIMIT 0, 10;

# 포지션이 Center
CREATE VIEW Center AS
	  SELECT *
	  FROM	 player 
	  WHERE Pos = 'C' ;

# 포지션이 Power Forward
CREATE VIEW PowerForward AS
	  SELECT *
	  FROM	 player 
	  WHERE Pos = 'PF' ;

# 포지션이 PointGuard
CREATE VIEW PointGuard AS
	  SELECT *
	  FROM	 player 
	  WHERE Pos = 'PG' ;

# 포지션이 Small Forward
CREATE VIEW SmallForward AS
	  SELECT *
	  FROM	 player 
	  WHERE Pos = 'SF' ;

# 포지션이 Small Power Forward (특이 포지션, NBA에도 1명만 존재)
CREATE VIEW Small_Power_Forward AS
	  SELECT *
	  FROM	 player 
	  WHERE Pos = 'SF-PF' ;

# 포지션이 Shooting Guard
CREATE VIEW ShootingGuard AS
	  SELECT *
	  FROM	 player 
	  WHERE Pos = 'SG' ;
      