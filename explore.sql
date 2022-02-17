-- SQLite
SELECT 
id, date, match_api_id, 
home_team_api_id, away_team_api_id, 
(home_team_goal - away_team_goal) as goal_diff,
 CASE 
    WHEN home_team_goal > away_team_goal THEN 'H'
    WHEN home_team_goal < away_team_goal THEN 'A' 
    ELSE 'D'
    END as win_lose_draw,
 B365H, B365D, B365A, BWH, BWD, BWA, IWH, IWD, IWA, LBH, LBD, LBA
 -- ,  WHH, WHD, WHA, SJH, SJD, SJA, VCH, VCD, VCA, GBH, GBD, GBA, BSH, BSD, BSA
 -- join with team_attributes and keep only the attributes we need
FROM Match;

SELECT
id, team_api_id, date, buildUpPlaySpeed, buildUpPlayPassing, chanceCreationPassing, chanceCreationCrossing, chanceCreationShooting, defencePressure, defenceAggression, defenceTeamWidth
FROM Team_Attributes;

SELECT
count(distinct(date)), min(date), max(date) FROM Match;

SELECT
DISTINCT(date) FROM Team_Attributes;