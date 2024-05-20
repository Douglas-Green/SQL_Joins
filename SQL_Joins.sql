/* SELECT ALL THE COMPUTERS FROM THE PRODUCTS TABLE: USING THE PRODUCTS
TABLE AND THE CATEGORIES TABLE, RETURN THE PRODUCT NAME AND THE CATEGORY NAME  */
SELECT
  p.Name,
  c.Name AS CategoryName
FROM
  Products p
  JOIN Categories c ON p.CategoryId = c.CategoryId
WHERE
  c.Name = 'Computers';

/* FIND ALL PRODUCT NAMES, PRODUCT PRICES, AND PRODUCTS RATINGS THAT HAVE A RATING OF 5 */
SELECT
  p.Name,
  p.Price,
  r.Rating
FROM
  Products p
  JOIN Reviews r ON p.ProductId = r.ProductId
WHERE
  r.Rating = 5;

/* find the employee with the most total quantity sold. Usse the sum() function and group by */
SELECT
  e.EmployeeId,
  e.FirstName,
  e.LastName,
  SUM(s.Quantity) AS TotalSold
FROM
  Employees e
  JOIN Sales s ON e.EmployeeId = s.EmployeeId
GROUP BY
  e.EmployeeId,
  e.FirstName,
  e.LastName
ORDER BY
  TotalSold DESC
LIMIT
  1;

/* FIND THE NAME OF THE DEPARTMENT, AND THE NAME OF THE CATEGORY FOR APPLIANCES AND GAMES */
SELECT
  d.Name AS DepartmentName,
  c.Name AS CategoryName
FROM
  Departments d
  JOIN Categories c ON d.DepartmentId = c.DepartmentId
WHERE
  c.Name IN ('Appliances', 'Games');

/* find the product name, total # sold, and total price sold, for eagles: Hotel California. You may need sum() */
SELECT
  p.Name,
  SUM(s.Quantity) AS TotalSold,
  SUM(s.Quantity * s.PricePerUnit) AS TotalPrice
FROM
  Products p
  JOIN Sales s ON p.ProductId = s.ProductId
WHERE
  p.Name = 'Eagles: Hotel California'
GROUP BY
  p.Name;

/* FIND PRODUCT NAME, REVIEWER NAME, RATING, AND COMMENT ON THE VISIO TV. (ONLY RETURN FOR THE LOWEST RATING!) */
SELECT
  p.Name,
  r.Reviewer,
  r.Rating,
  r.Comment
FROM
  Products p
  JOIN Reviews r ON p.ProductId = r.ProductId
WHERE
  p.Name = 'Visio TV'
ORDER BY
  r.Rating ASC
LIMIT
  1;

/* YOUR GOAL IS TO WRITE A QUERY THAT SERVES AS AN EMPLOYEE SALES REPORT.
THIS QUERY SHOULD RETURN THE EMPLOYEE_ID, THE EMPLOYEE'S FIRST AND LAST NAME, THE NAME OF EACH PRODUCT, HOW MANY OF THAT PRODUCT THEY SOLD */
SELECT
  e.EmployeeId,
  e.FirstName,
  e.LastName,
  p.Name AS ProductName,
  COUNT(s.ProductId) AS TotalSold
FROM
  Employees e
  JOIN Sales s ON e.EmployeeId = s.EmployeeId
  JOIN Products p ON s.ProductId = p.ProductId
GROUP BY
  e.EmployeeId,
  e.FirstName,
  e.LastName,
  p.Name
ORDER BY
  e.EmployeeId,
  p.Name;