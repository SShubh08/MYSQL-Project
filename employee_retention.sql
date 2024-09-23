use `world`;
show tables;
select * from hr_1;
 select* from hr_2;

#count of employees
select count(employeeid) as Total_employees from hr_2; 

#WorkLife Balance Distribution:
 SELECT
HR_2.WorkLifeBalance,
COUNT(*) AS EmployeeCount
FROM
HR_2
GROUP BY
HR_2.WorkLifeBalance
ORDER BY
HR_2.WorkLifeBalance;

#Average Work-Life Balance by Job Role
 SELECT
HR_1.JobRole,
AVG(HR_2.WorkLifeBalance) AS AvgWorkLifeBalance
FROM
HR_1
JOIN
HR_2 ON HR_1.Employeenumber = HR_2.EmployeeID
GROUP BY
HR_1.JobRole;

#Attrition Rate by Marital Status
SELECT
HR_1.MaritalStatus,
COUNT(*) AS TotalEmployees,
SUM(CASE WHEN HR_1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
(SUM(CASE WHEN HR_1.Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AttritionRate
FROM
HR_1
GROUP BY
HR_1.MaritalStatus;
    
    #Employee Count by Department and Gender
SELECT
HR_1.Department,
HR_1.Gender,
COUNT(*) AS EmployeeCount
FROM
HR_1
GROUP BY
HR_1.Department, HR_1.Gender;
 