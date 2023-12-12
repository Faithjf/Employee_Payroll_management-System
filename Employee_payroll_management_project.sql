-- CREATE TABLES --

-- Employee
CREATE TABLE Employee (
  Employee_Id SERIAL PRIMARY KEY,
  First_Name VARCHAR(50),
  Last_Name VARCHAR(50),
  Hire_Date DATE,
  Birth_Date DATE,
  City VARCHAR(50),
  State VARCHAR(50)
);

-- Salary
CREATE TABLE Salary (
  Salary_Id SERIAL PRIMARY KEY,
  Employee_Id INTEGER REFERENCES Employee(Employee_Id),
  Gross_Salary NUMERIC,
  Deductions NUMERIC,
  Net_Salary NUMERIC,
  Payroll_Date DATE
);

-- Department
CREATE TABLE Department (
  Department_Id SERIAL PRIMARY KEY,
  Department_Name VARCHAR(50)
);

-- EmployeeDepartment Bridge
CREATE TABLE EmployeeDepartment (
  Employee_Id INTEGER REFERENCES Employee(Employee_Id),
  Department_Id INTEGER REFERENCES Department(Department_Id),
  PRIMARY KEY (Employee_Id, Department_Id)
);

-- Bonus
CREATE TABLE Bonus (
  Bonus_Id SERIAL PRIMARY KEY,
  Employee_Id INTEGER REFERENCES Employee(Employee_Id),
  Bonus_Amount NUMERIC,
  Bonus_Date DATE
);

-- Deduction
CREATE TABLE Deduction (
  Deduction_Id SERIAL PRIMARY KEY,
  Employee_Id INTEGER REFERENCES Employee(Employee_Id),
  Deduction_Amount NUMERIC,
  Deduction_Date DATE
);

-- CREATE INDEXES FOR FOREIGN KEY PERFORMANCE OPTIMIZATION --

-- Index on Employee_Id in Salary table
CREATE INDEX idx_salary_employee_id ON Salary(Employee_Id);

-- Indexes on Employee_Id and Department_Id in EmployeeDepartment table
CREATE INDEX idx_empdept_employee_id ON EmployeeDepartment(Employee_Id);
CREATE INDEX idx_empdept_department_id ON EmployeeDepartment(Department_Id);

-- Index on Employee_Id in Bonus table
CREATE INDEX idx_bonus_employee_id ON Bonus(Employee_Id);

-- Index on Employee_Id in Deduction table
CREATE INDEX idx_deduction_employee_id ON Deduction(Employee_Id);




--------------------------
--insert data into the tables

-- INSERT DATA INTO EMPLOYEE TABLE
INSERT INTO Employee (First_Name, Last_Name, Hire_Date, Birth_Date, City, State)
VALUES
  ('John', 'Doe', '2022-01-01', '1990-05-15', 'New York', 'NY'),
  ('Jane', 'Smith', '2022-02-15', '1985-08-22', 'Los Angeles', 'CA'),
  ('Mike', 'Johnson', '2022-03-10', '1992-11-03', 'Chicago', 'IL'),
  ('Emily', 'Williams', '2022-04-20', '1988-07-12', 'San Francisco', 'CA'),
  ('David', 'Brown', '2022-05-05', '1995-02-28', 'Seattle', 'WA');

-- INSERT DATA INTO SALARY TABLE
INSERT INTO Salary (Employee_Id, Gross_Salary, Deductions, Net_Salary, Payroll_Date)
VALUES
  (1, 60000, 5000, 55000, '2022-06-01'),
  (2, 75000, 6000, 69000, '2022-06-01'),
  (3, 50000, 4500, 45500, '2022-06-01'),
  (4, 80000, 7000, 73000, '2022-06-01'),
  (5, 65000, 5500, 59500, '2022-06-01');

-- INSERT DATA INTO DEPARTMENT TABLE
INSERT INTO Department (Department_Name)
VALUES
  ('Human Resources'),
  ('Finance'),
  ('IT'),
  ('Marketing'),
  ('Operations');

-- INSERT DATA INTO EMPLOYEEDEPARTMENT TABLE
INSERT INTO EmployeeDepartment (Employee_Id, Department_Id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);

-- INSERT DATA INTO BONUS TABLE
INSERT INTO Bonus (Employee_Id, Bonus_Amount, Bonus_Date)
VALUES
  (1, 2000, '2022-07-01'),
  (2, 1500, '2022-07-01'),
  (3, 1000, '2022-07-01'),
  (4, 2500, '2022-07-01'),
  (5, 1800, '2022-07-01');

-- INSERT DATA INTO DEDUCTION TABLE
INSERT INTO Deduction (Employee_Id, Deduction_Amount, Deduction_Date)
VALUES
  (1, 1000, '2022-07-01'),
  (2, 800, '2022-07-01'),
  (3, 500, '2022-07-01'),
  (4, 1200, '2022-07-01'),
  (5, 1000, '2022-07-01');
