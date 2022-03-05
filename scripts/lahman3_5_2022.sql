select *
from batting;

select homegames
From Year;

/* 1. What range of years for baseball games played does the provided database cover? Answer: 1871 -2016 */ 

select min(yearid), max(yearid)
from teams;

/* 2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played? */ 

select namegiven, min(height)
From people;

/* 3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors? */ 

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
ORDER BY total_salary DESC

