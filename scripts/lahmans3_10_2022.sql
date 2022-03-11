select *
from batting;

select homegames
From Year;

/* 1. What range of years for baseball games played does the provided database cover? Answer: 1871 -2016 */ 

select min(yearid), max(yearid)
from teams;

/* 2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played? Edward Carl, 1, St. Louis Browns */ 

Select p.playerid, p.namegiven AS name, p.height, 
	a.g_all AS games_played, a.teamid,
	t.name
From people AS p
Left Join appearances AS a
On p.playerid = a.playerid
Left Join teams AS t
On a.teamid = t.teamid
Where p.height is not null
Group By p.playerid,p.height, a.g_all, a.teamid, t.name
Order By p.height ASC;

/* 3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors? David Price, $245 Mn, Vandy */ 

SELECT DISTINCT CONCAT(cast(p.namefirst as text), ' ', cast(p.namelast as text)) AS full_name,
	   SUM(s.salary) AS total_salary,
	   LOWER(c.schoolid)
FROM people as p
LEFT JOIN salaries as s
ON p.playerid = s.playerid
LEFT JOIN collegeplaying as c
ON s.playerid = c.playerid
WHERE s.salary IS NOT NULL AND c.schoolid IS NOT NULL AND LOWER(C.schoolid) LIKE 'vand%'
GROUP BY full_name, c.schoolid
ORDER BY total_salary DESC;

/* 4. Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these three groups in 2016. */

Select p.namegiven AS name, f.yearid AS year,f.pos AS position
From people AS p
Left join fielding AS f
On p.playerid = f.playerid
Where yearid = '2016'

/* 5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. Do the same for home runs per game. Do you see any trends? */

Select yearid, so, hr
From pitching

/* 6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases. */

