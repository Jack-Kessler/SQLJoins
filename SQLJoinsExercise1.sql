/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name, categories.Name
 FROM Products
 INNER JOIN Categories 
 ON Products.CategoryID = Categories.CategoryID  
 WHERE Categories.Name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT Products.Name, Products.Price, Reviews.Rating FROM Products
 LEFT JOIN Reviews
 ON Products.ProductID = Reviews.ProductID
 WHERE Reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT Employees.*, SUM(Sales.Quantity) AS TQS FROM Sales
INNER JOIN Employees
ON Employees.EmployeeID = Sales.EmployeeID
GROUP BY Employees.EmployeeID 
ORDER BY TQS DESC
LIMIT 5;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT Departments.Name AS Department_Name, Categories.Name AS Category_Name FROM Departments
INNER JOIN Categories
ON Categories.DepartmentID = Departments.DepartmentID
WHERE Categories.Name = "Appliances" OR Categories.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 -- SELECT * FROM Products WHERE Name = "Eagles: Hotel California";
 -- From code above, we know product ID = 97
SELECT Products.Name AS Product_Name, SUM(Sales.Quantity) AS Total_Num_Sold, 
		SUM(Sales.Quantity * Sales.PricePerUnit) AS Total_Price_Sold
FROM Products INNER JOIN Sales
ON Products.ProductID = Sales.ProductID
WHERE Products.Name = "Eagles: Hotel California";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT Products.Name, Reviews.Reviewer, Reviews.Rating, Reviews.Comment 
FROM Products
INNER JOIN Reviews
ON Products.ProductID = Reviews.ProductID
WHERE Products.Name = "Visio TV" AND Reviews.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name as Product_Name, Sum(s.Quantity) as Total_Product_Sold
From Sales as s
INNER JOIN Employees as e ON e.EmployeeID = s.EmployeeID
INNER JOIN Products as p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
Order By e.FirstName, e.LastName;