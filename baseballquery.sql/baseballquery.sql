/*
Heaviest Hitters
WITH weights AS (SELECT batting.yearid, teams.name, AVG(weight) AS average FROM people JOIN batting ON batting.playerid = people.playerid JOIN teams ON batting.teamid = teams.teamid
GROUP BY 1, 2)
SELECT * FROM weights tw1 WHERE average = (SELECT MAX(average)
    FROM weights tw2
    WHERE tw2.yearid = tw1.yearid) ORDER BY yearid;
Shortest Sluggers
WITH heights AS (SELECT batting.yearid, teams.name, AVG(height) AS average FROM people JOIN batting ON batting.playerid = people.playerid JOIN teams ON batting.teamid = teams.teamid
GROUP BY 1, 2)
SELECT * FROM heights tw1 WHERE average = (SELECT MIN(average)
    FROM heights tw2
    WHERE tw2.yearid = tw1.yearid) ORDER BY yearid;
    
Biggest Spenders
WITH yearSalary AS(SELECT SUM(salary) AS total, salaries.yearid, teams.name
                   FROM salaries JOIN teams ON salaries.teamid = teams.teamid GROUP BY teams.name, salaries.yearid)
SELECT * FROM yearSalary ys1 WHERE total = (
  SELECT MAX(total) FROM yearSalary ys2 WHERE ys1.yearid = ys2.yearid)ORDER BY yearid;
Most bang for their buck  
  
SELECT SUM(salary)/ teams.w  AS total, teams.name FROM salaries JOIN teams ON salaries.teamid = teams.teamid WHERE teams.yearid = 2010 GROUP BY teams.name, teams.w ORDER BY total DESC;

Priciest Starter

WITH jeer AS (SELECT ROUND(
    MAX((salaries.salary / pitching.gs)::numeric),
    1
)  AS costPer, salaries.yearid, salaries.playerid  FROM salaries JOIN pitching ON salaries.playerid = pitching.playerid
WHERE gs > 10 GROUP BY salaries.playerid, salaries.yearid ORDER BY 2 DESC)

SELECT MAX(costper), yearid FROM jeer  GROUP BY jeer.yearid ORDER BY 2;

Tallest sluggers
*/
WITH heights AS (SELECT batting.yearid, teams.name, AVG(height) AS average FROM people JOIN batting ON batting.playerid = people.playerid JOIN teams ON batting.teamid = teams.teamid
GROUP BY 1, 2)
SELECT * FROM heights tw1 WHERE average = (SELECT MAX(average)
    FROM heights tw2
    WHERE tw2.yearid = tw1.yearid) ORDER BY yearid;
