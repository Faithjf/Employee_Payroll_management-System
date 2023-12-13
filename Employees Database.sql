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

-- Leave
CREATE TABLE Leave (
  Leave_Id SERIAL PRIMARY KEY,
  Employee_Id INTEGER REFERENCES Employee(Employee_Id),
  Leave_date DATE
);

-- Work_Location
CREATE TABLE Work_Location (
  Location_Id SERIAL PRIMARY KEY,
  Location VARCHAR(25),
  Number_Of_Employees INTEGER,
  City VARCHAR(25),
  State VARCHAR(25)
);

-- AccountDetails
CREATE TABLE AccountDetails (
  Account_Id SERIAL PRIMARY KEY,
  Bank_Name VARCHAR(50),
  Account_Number VARCHAR(50),
  Employee_Id INTEGER REFERENCES Employee(Employee_Id)
);

-- Education
CREATE TABLE Education (
  Education_Id SERIAL PRIMARY KEY,
  Employee_Id INTEGER REFERENCES Employee(Employee_Id),
  Degree VARCHAR(30),
  Graduation_Year INTEGER
);

-- DepartmentProject Bridge
CREATE TABLE DepartmentProject (
  Department_Id INTEGER REFERENCES Department(Department_Id),
  Project_Id INTEGER REFERENCES Project(Project_Id),
  PRIMARY KEY (Department_Id, Project_Id)
);

-- Project
CREATE TABLE Project (
  Project_Id SERIAL PRIMARY KEY,
  Project_Name VARCHAR(50),
  Project_Description VARCHAR(50)
);

-- Attendance
CREATE TABLE Attendance (
  Attendance_Id SERIAL PRIMARY KEY,
  Hours_Worked NUMERIC
);

-- EmployeeAttendance Bridge
CREATE TABLE Employee_Attendance (
  Employee_Id INTEGER REFERENCES Employee(Employee_Id),
  Attendance_Id INTEGER REFERENCES Attendance(Attendance_Id),
  PRIMARY KEY (Employee_Id, Attendance_Id)
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


