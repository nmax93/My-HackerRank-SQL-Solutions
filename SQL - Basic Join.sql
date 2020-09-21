--Asian Population:
SELECT SUM(CITY.POPULATION) FROM CITY
LEFT JOIN COUNTRY ON CITY.COUNTRYCODE=COUNTRY.CODE
WHERE COUNTRY.CONTINENT='Asia';

--African Cities:
SELECT CITY.NAME FROM CITY
LEFT JOIN COUNTRY ON CITY.COUNTRYCODE=COUNTRY.CODE
WHERE COUNTRY.CONTINENT='Africa';

--Average Population of Each Continent:
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION)) FROM CITY
INNER JOIN COUNTRY ON CITY.COUNTRYCODE=COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;

--The Report:
SELECT Students.Name, Grades.Grade, Students.Marks FROM Students
INNER JOIN Grades ON Students.Marks >= Grades.Min_Mark AND Students.Marks <= Grades.Max_Mark
WHERE Students.Marks >= 70 ORDER BY Grades.Grade DESC, Students.Name ASC;
SELECT NULL, Grades.Grade, Students.Marks FROM Students
INNER JOIN Grades ON Students.Marks >= Grades.Min_Mark AND Students.Marks <= Grades.Max_Mark
WHERE Students.Marks < 70 ORDER BY Grades.Grade DESC, Students.Marks ASC;

--Ollivander's Inventory:
SELECT Wands.id, Wands_Property.age, Wands.coins_needed, Wands.power FROM Wands
INNER JOIN Wands_Property ON Wands_Property.code=Wands.code
WHERE is_evil=0 AND coins_needed=(SELECT MIN(W.coins_needed) FROM Wands AS W
INNER JOIN Wands_Property AS WP ON W.code=WP.code
WHERE W.power=Wands.power AND WP.age=Wands_Property.age) ORDER BY power DESC, age DESC;