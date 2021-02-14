SELECT *
FROM [Case]
ORDER BY CaseID


SELECT *
FROM [Employee]
ORDER BY EmployeeID


BEGIN TRANSACTION

UPDATE c
SET c.FirstName = e.FirstName, c.LastName = e.LastName
FROM [Case] AS c
INNER JOIN [Employee] AS e ON c.EmployeeID = e.EmployeeID

SELECT *
FROM [Case]
ORDER BY CaseID

ROLLBACK TRANSACTION
