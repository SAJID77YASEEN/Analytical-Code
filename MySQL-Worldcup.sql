DESCRIBE worldcupdata;
SELECT COUNT(*) as total_records FROM worldcupdata;
SELECT DISTINCT year FROM worldcupdata ORDER BY year;
SELECT 
    year,
    COUNT(DISTINCT game_id) as total_matches,
    SUM(goals) as total_goals,
    ROUND(SUM(goals) / COUNT(DISTINCT game_id), 2) as avg_goals_per_match,
    MAX(goals) as highest_goals_in_match,
    MIN(goals) as lowest_goals_in_match
FROM worldcupdata 
GROUP BY year 
ORDER BY year;
SELECT 
    year,
    team,
    SUM(goals) as total_goals,
    COUNT(*) as matches_played,
    ROUND(AVG(goals), 2) as avg_goals_per_match
FROM worldcupdata 
GROUP BY year, team
HAVING matches_played >= 3
ORDER BY year, total_goals DESC;
SELECT 
    year,
    date,
    stadium,
    MAX(CASE WHEN team_num = 1 THEN team END) as team1,
    MAX(CASE WHEN team_num = 1 THEN goals END) as team1_goals,
    MAX(CASE WHEN team_num = 2 THEN team END) as team2,
    MAX(CASE WHEN team_num = 2 THEN goals END) as team2_goals,
    (MAX(CASE WHEN team_num = 1 THEN goals END) + 
     MAX(CASE WHEN team_num = 2 THEN goals END)) as total_goals
FROM worldcupdata
GROUP BY year, date, stadium, game_id
ORDER BY total_goals DESC
LIMIT 20;
SELECT 
    CASE 
        WHEN year BETWEEN 1930 AND 1939 THEN '1930s'
        WHEN year BETWEEN 1940 AND 1949 THEN '1940s'
        WHEN year BETWEEN 1950 AND 1959 THEN '1950s'
        WHEN year BETWEEN 1960 AND 1969 THEN '1960s'
        WHEN year BETWEEN 1970 AND 1979 THEN '1970s'
        WHEN year BETWEEN 1980 AND 1989 THEN '1980s'
        WHEN year BETWEEN 1990 AND 1999 THEN '1990s'
        WHEN year BETWEEN 2000 AND 2009 THEN '2000s'
        WHEN year BETWEEN 2010 AND 2019 THEN '2010s'
        ELSE '2020s'
    END as decade,
    COUNT(DISTINCT year) as tournaments,
    COUNT(DISTINCT game_id) as total_matches,
    SUM(goals) as total_goals,
    ROUND(AVG(goals), 2) as avg_goals_per_team_per_match
FROM worldcupdata
GROUP BY decade
ORDER BY decade;
SELECT 
    team,
    COUNT(DISTINCT year) as tournaments_played,
    COUNT(*) as total_matches,
    SUM(goals) as total_goals_scored,
    ROUND(AVG(goals), 2) as avg_goals_per_match,
    COUNT(CASE WHEN stage = 'FINAL ROUND' THEN 1 END) as final_appearances,
    COUNT(CASE WHEN stage = '1/2 FINAL' THEN 1 END) as semifinal_appearances
FROM worldcupdata
GROUP BY team
HAVING tournaments_played >= 5
ORDER BY tournaments_played DESC, total_goals_scored DESC;
SELECT 
    stage,
    COUNT(DISTINCT game_id) as matches,
    COUNT(DISTINCT team) as teams_involved,
    SUM(goals) as total_goals,
    ROUND(AVG(goals), 2) as avg_goals_per_team,
    MAX(goals) as highest_individual_score
FROM worldcupdata
WHERE stage IS NOT NULL
GROUP BY stage
ORDER BY avg_goals_per_team DESC;
SELECT 
    CASE 
        WHEN team = home THEN 'Home Team'
        ELSE 'Away Team'
    END as team_status,
    COUNT(*) as matches,
    SUM(goals) as total_goals,
    ROUND(AVG(goals), 2) as avg_goals_per_match,
    COUNT(CASE WHEN goals >= 2 THEN 1 END) as high_scoring_matches
FROM worldcupdata
WHERE home IS NOT NULL
GROUP BY team_status;
SELECT 
    year,
    MAX(CASE WHEN stage = 'FINAL ROUND' AND team_num = 1 THEN team END) as team1,
    MAX(CASE WHEN stage = 'FINAL ROUND' AND team_num = 1 THEN goals END) as team1_goals,
    MAX(CASE WHEN stage = 'FINAL ROUND' AND team_num = 2 THEN team END) as team2,
    MAX(CASE WHEN stage = 'FINAL ROUND' AND team_num = 2 THEN goals END) as team2_goals,
    CASE 
        WHEN MAX(CASE WHEN stage = 'FINAL ROUND' AND team_num = 1 THEN goals END) > 
             MAX(CASE WHEN stage = 'FINAL ROUND' AND team_num = 2 THEN goals END)
        THEN MAX(CASE WHEN stage = 'FINAL ROUND' AND team_num = 1 THEN team END)
        ELSE MAX(CASE WHEN stage = 'FINAL ROUND' AND team_num = 2 THEN team END)
    END as winner,
    stadium as final_venue
FROM worldcupdata
WHERE stage = 'FINAL ROUND'
GROUP BY year, stadium
ORDER BY year;
SELECT 
    year,
    COUNT(DISTINCT game_id) as total_matches,
    SUM(attendance) / COUNT(DISTINCT game_id) as avg_attendance_per_match,
    MAX(attendance) as highest_attendance,
    MIN(attendance) as lowest_attendance,
    STDDEV(attendance) as attendance_std_dev
FROM worldcupdata
GROUP BY year
ORDER BY year;
SELECT 
    stadium,
    COUNT(DISTINCT game_id) as matches_hosted,
    AVG(attendance) as avg_attendance,
    MAX(attendance) as max_attendance,
    MIN(attendance) as min_attendance,
    year
FROM worldcupdata
GROUP BY stadium, year
HAVING matches_hosted >= 3
ORDER BY avg_attendance DESC
LIMIT 20;
SELECT 
    stage,
    COUNT(DISTINCT game_id) as matches,
    ROUND(AVG(attendance), 0) as avg_attendance,
    MAX(attendance) as peak_attendance,
    MIN(attendance) as min_attendance
FROM worldcupdata
WHERE stage IS NOT NULL
GROUP BY stage
ORDER BY avg_attendance DESC;
SELECT 
    year,
    home as host_country,
    COUNT(DISTINCT game_id) as total_matches,
    ROUND(AVG(attendance), 0) as avg_attendance,
    SUM(attendance) as total_attendance,
    MAX(attendance) as peak_single_match
FROM worldcupdata
GROUP BY year, home
ORDER BY year;
SELECT 
    CASE 
        WHEN stage LIKE '%FINAL%' THEN 'Finals'
        WHEN stage LIKE '%1/2%' THEN 'Semi-Finals'
        WHEN stage LIKE '%1/4%' THEN 'Quarter-Finals'
        WHEN stage LIKE '%1/8%' THEN 'Round of 16'
        WHEN stage LIKE '%GROUP%' THEN 'Group Stage'
        ELSE 'Other'
    END as match_importance,
    COUNT(DISTINCT game_id) as matches,
    ROUND(AVG(attendance), 0) as avg_attendance,
    MAX(attendance) as highest_attendance
FROM worldcupdata
GROUP BY match_importance
ORDER BY avg_attendance DESC;
SELECT 
    home as host_country,
    year,
    COUNT(DISTINCT game_id) as matches_hosted,
    COUNT(DISTINCT stadium) as venues_used,
    ROUND(AVG(attendance), 0) as avg_attendance,
    SUM(goals) as total_goals_in_country
FROM worldcupdata
GROUP BY home, year
ORDER BY year, matches_hosted DESC;
SELECT 
    stadium,
    home as country,
    COUNT(DISTINCT year) as different_tournaments,
    COUNT(DISTINCT game_id) as total_matches,
    ROUND(AVG(attendance), 0) as avg_attendance,
    SUM(goals) as total_goals_witnessed
FROM world_cup_data
GROUP BY stadium, home
HAVING total_matches >= 5
ORDER BY total_matches DESC;SELECT 
    stadium,
    home as country,
    COUNT(DISTINCT year) as different_tournaments,
    COUNT(DISTINCT game_id) as total_matches,
    ROUND(AVG(attendance), 0) as avg_attendance,
    SUM(goals) as total_goals_witnessed
FROM world_cup_data
GROUP BY stadium, home
HAVING total_matches >= 5
ORDER BY total_matches DESC;
SELECT 
    stadium,
    home as country,
    COUNT(DISTINCT year) as different_tournaments,
    COUNT(DISTINCT game_id) as total_matches,
    ROUND(AVG(attendance), 0) as avg_attendance,
    SUM(goals) as total_goals_witnessed
FROM worldcupdata
GROUP BY stadium, home
HAVING total_matches >= 5
ORDER BY total_matches DESC;
SELECT 
    CASE 
        WHEN home IN ('Brazil', 'Argentina', 'Chile', 'Uruguay', 'Mexico', 'USA') THEN 'Americas'
        WHEN home IN ('Italy', 'France', 'Germany', 'England', 'Spain', 'Sweden', 'Switzerland') THEN 'Europe'
        WHEN home IN ('Japan', 'South Korea') THEN 'Asia'
        ELSE 'Other'
    END as continent,
    COUNT(DISTINCT year) as tournaments_hosted,
    COUNT(DISTINCT game_id) as total_matches,
    ROUND(AVG(attendance), 0) as avg_attendance
FROM worldcupdata
GROUP BY continent
ORDER BY tournaments_hosted DESC;
SELECT 
    stadium,
    home as country,
    year,
    COUNT(DISTINCT game_id) as matches,
    SUM(goals) as total_goals,
    SUM(attendance) as total_attendance,
    ROUND(SUM(goals) / SUM(attendance) * 1000, 3) as goals_per_1000_spectators
FROM worldcupdata
GROUP BY stadium, home, year
HAVING matches >= 3
ORDER BY goals_per_1000_spectators DESC
LIMIT 20;
SELECT 
    referee,
    COUNT(DISTINCT year) as tournaments_officiated,
    COUNT(DISTINCT game_id) as matches_officiated,
    ROUND(AVG(goals), 2) as avg_goals_per_match,
    SUM(goals) as total_goals_in_matches,
    COUNT(CASE WHEN booked IS NOT NULL THEN 1 END) as matches_with_bookings
FROM worldcupdata
WHERE referee IS NOT NULL AND referee != ''
GROUP BY referee
HAVING matches_officiated >= 5
ORDER BY matches_officiated DESC
SELECT 
    SUBSTRING_INDEX(referee, '(', -1) as referee_country,
    COUNT(DISTINCT referee) as number_of_referees,
    COUNT(DISTINCT game_id) as matches_officiated,
    ROUND(AVG(goals), 2) as avg_goals_per_match
FROM worldcupdata
WHERE referee IS NOT NULL 
    AND referee != '' 
    AND referee LIKE '%(%'
GROUP BY referee_country
HAVING matches_officiated >= 10
ORDER BY matches_officiated DESC;
SELECT 
    referee,
    year,
    date,
    stadium,
    MAX(CASE WHEN team_num = 1 THEN team END) as team1,
    MAX(CASE WHEN team_num = 1 THEN goals END) as goals1,
    MAX(CASE WHEN team_num = 2 THEN team END) as team2,
    MAX(CASE WHEN team_num = 2 THEN goals END) as goals2,
    (MAX(CASE WHEN team_num = 1 THEN goals END) + 
     MAX(CASE WHEN team_num = 2 THEN goals END)) as total_goals
FROM worldcupdata
WHERE referee IS NOT NULL
GROUP BY referee, year, date, stadium, game_id
HAVING total_goals >= 5
ORDER BY total_goals DESC;
SELECT 
    referee,
    stage,
    COUNT(DISTINCT game_id) as matches,
    ROUND(AVG(goals), 2) as avg_goals,
    COUNT(CASE WHEN booked IS NOT NULL THEN 1 END) as matches_with_cards
FROM worldcupdata
WHERE referee IS NOT NULL 
    AND stage IN ('FINAL ROUND', '1/2 FINAL', '1/4 FINAL')
GROUP BY referee, stage
ORDER BY stage, matches DESC;
SELECT 
    year,
    COUNT(DISTINCT team) as participating_teams,
    COUNT(DISTINCT game_id) as total_matches,
    COUNT(DISTINCT stage) as tournament_stages,
    ROUND(COUNT(DISTINCT game_id) / COUNT(DISTINCT team), 2) as matches_per_team_avg
FROM worldcupdata
GROUP BY year
ORDER BY year;
SELECT 
    year,
    stage,
    COUNT(DISTINCT game_id) as matches_in_stage,
    COUNT(DISTINCT team) as teams_in_stage
FROM worldcupdata
WHERE stage IS NOT NULL
GROUP BY year, stage
ORDER BY year, matches_in_stage DESC;
SELECT 
    year,
    MIN(STR_TO_DATE(SUBSTRING(date, 1, 10), '%d-%m-%Y')) as tournament_start,
    MAX(STR_TO_DATE(SUBSTRING(date, 1, 10), '%d-%m-%Y')) as tournament_end,
    DATEDIFF(
        MAX(STR_TO_DATE(SUBSTRING(date, 1, 10), '%d-%m-%Y')),
        MIN(STR_TO_DATE(SUBSTRING(date, 1, 10), '%d-%m-%Y'))
    ) as tournament_duration_days,
    COUNT(DISTINCT game_id) as total_matches
FROM worldcupdata
GROUP BY year
ORDER BY year;
SELECT 
    year,
    COUNT(DISTINCT team) as teams,
    ROUND(STDDEV(goals), 3) as goal_variance,
    ROUND(AVG(goals), 2) as avg_goals,
    COUNT(CASE WHEN goals = 0 THEN 1 END) as shutouts,
    ROUND(
        COUNT(CASE WHEN goals = 0 THEN 1 END) / COUNT(*) * 100, 2
    ) as shutout_percentage,
    -- Competitiveness score (lower variance = more competitive)
    ROUND(STDDEV(goals) / AVG(goals), 3) as competitiveness_ratio
FROM worldcupdata
GROUP BY year
ORDER BY year;
SELECT 
    stadium,
    year,
    COUNT(DISTINCT game_id) as matches_hosted,
    SUM(attendance) as total_spectators,
    SUM(goals) as total_goals,
    ROUND(SUM(goals) / COUNT(DISTINCT game_id), 2) as goals_per_match,
    ROUND(SUM(attendance) / COUNT(DISTINCT game_id), 0) as avg_attendance,
    -- Entertainment value index
    ROUND(
        (SUM(goals) * 1000) / SUM(attendance), 3
    ) as entertainment_per_1000_fans
FROM worldcupdata
GROUP BY stadium, year
HAVING matches_hosted >= 3
ORDER BY entertainment_per_1000_fans DESC;
SELECT 
    year,
    home as host_country,
    COUNT(DISTINCT game_id) as total_matches,
    ROUND(AVG(attendance), 0) as avg_attendance,
    SUM(goals) as total_goals,
    COUNT(CASE WHEN goals >= 3 THEN 1 END) as high_scoring_performances,
    -- Quality indicators
    ROUND(AVG(goals), 2) as goals_per_team_match,
    ROUND(
        COUNT(CASE WHEN goals >= 3 THEN 1 END) / COUNT(*) * 100, 2
    ) as high_scoring_percentage,
    -- Overall tournament quality score
    ROUND(
        (AVG(goals) * 0.4) + 
        (AVG(attendance) / 1000 * 0.3) + 
        (COUNT(CASE WHEN goals >= 3 THEN 1 END) / COUNT(*) * 100 * 0.3), 2
    ) as quality_score
FROM worldcupdata
GROUP BY year, home
ORDER BY quality_score DESC;
