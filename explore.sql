-- SQLite database exploration
-- Select the rows from the match table, according to the criteria
SELECT 
id, 
date, 
match_api_id, 
-- keep team ids to join with team attributes table later
home_team_api_id, 
away_team_api_id, 
-- keep the difference in goals as a feature
(home_team_goal - away_team_goal) as goal_diff,
-- create a column with the result of the match
 CASE 
    WHEN home_team_goal > away_team_goal THEN 'H'
    WHEN home_team_goal < away_team_goal THEN 'A' 
    ELSE 'D'
    END as win_lose_draw,
-- keep the odds given by the bookies as a feature (4 bookies) 
B365H, B365D, B365A, BWH, BWD, BWA, IWH, IWD, IWA, LBH, LBD, LBA
-- ,  WHH, WHD, WHA, SJH, SJD, SJA, VCH, VCD, VCA, GBH, GBD, GBA, BSH, BSD, BSA
FROM Match;

-- Select the team attributes, keep only the attributes we need
SELECT
id, team_api_id, date, buildUpPlaySpeed, buildUpPlayPassing, chanceCreationPassing, chanceCreationCrossing, chanceCreationShooting, defencePressure, defenceAggression, defenceTeamWidth
FROM Team_Attributes;

-- Count the number of different matches played and the date ranges of the matches, aka the number of seasons
SELECT
count(distinct(date)), min(date), max(date) FROM Match;

-- Check the number of dates we have for team attributes, aka the number of seasons.
SELECT
DISTINCT(date) FROM Team_Attributes;