# Employee_Payroll_management-System
The Employee Payroll Management Database is a structured and relational database designed to facilitate the efficient management of employee-related information within an organization. Developed to support the Employee Payroll Management System, this database encompasses key aspects of HR and payroll functionalities.
# PURPOSE
The Employee Payroll Management Database serves as the backbone for the Employee Payroll Management System, enabling organizations to streamline HR processes, automate payroll calculations, and maintain accurate and up-to-date employee records. By organizing data into interconnected tables, the database facilitates efficient data retrieval, reporting, and analysis for informed decision-making within the realm of human resources and payroll management.

**Employee Payroll Management System Overview**

**Start:** 
- The system begins by capturing employee information.

**Employee Table:**
- Employees are entered into the system with details such as first name, last name, hire date, birth date, city, and state.

**EmployeeDepartment Table:**
- Employees are associated with departments using the EmployeeDepartment bridge table.
- This table establishes the relationships between employees and the departments they belong to.

**Department Table:**
- Departments are defined within the system.

**Salary Table:**
- The Salary table is linked to the Employee table through the Employee_Id foreign key.
- It captures key financial information, including gross salary, deductions, net salary, and the payroll date.

**Bonus Table:**
- Employee bonuses are recorded in the Bonus table.
- The table is connected to the Employee table via the Employee_Id foreign key.
- Bonus amounts and bonus dates are specified.

**Deduction Table:**
- Deductions made from employee salaries are documented in the Deduction table.
- Similar to Bonus, the Deduction table is associated with the Employee table through the Employee_Id foreign key.
- Deduction amounts and dates are recorded.

**End:**
- The system flow concludes.

**Key Takeaways:**
- Employee data is centralized in the Employee table.
- Relationships between employees and departments are managed through the EmployeeDepartment bridge table.
- Financial details, including salary, bonuses, and deductions, are tracked in separate tables.
- This structured approach allows for efficient management of employee payroll information.

  ![image text](https://github.com/Faithjf/Employee_Payroll_management-System/blob/main/Employee%20ERD.png)
