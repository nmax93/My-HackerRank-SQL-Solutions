--Type of Triangle:
SELECT CASE
WHEN (A = B AND B = C) THEN 'Equilateral'
WHEN ((A + B <= C) OR (B + C <= A) OR (C + A <= B)) THEN 'Not A Triangle'
WHEN ((A = B AND B != C) OR (B = C AND C != A) OR (C = A AND A != B)) THEN 'Isosceles'
WHEN (A != B AND B != C AND C != A) THEN 'Scalene'
END AS TRIANGLE_TYPE FROM TRIANGLES;

--The PADS:
SELECT CASE
WHEN Occupation='Actor' THEN CONCAT(Name, '(A)') 
WHEN Occupation='Doctor' THEN CONCAT(Name, '(D)') 
WHEN Occupation='Professor' THEN CONCAT(Name, '(P)') 
WHEN Occupation='Singer' THEN CONCAT(Name, '(S)')
END FROM OCCUPATIONS ORDER BY Name;
SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS GROUP BY Occupation ORDER BY COUNT(*), Occupation;

--Binary Tree Nodes:
SELECT N, CASE
WHEN P IS NULL THEN 'Root'
WHEN N IN (SELECT P FROM BST) THEN 'Inner'
ELSE 'Leaf'
END FROM BST ORDER BY N;