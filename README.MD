# Student Records Management System

## Description
The **Student Records Management System** is a relational database designed to manage student information, courses, enrollments, departments, and instructors. It provides a structured way to store and retrieve data for educational institutions. The database includes relationships between students, courses, instructors, and departments, ensuring data integrity and consistency.

## Features
- Manage student details such as name, gender, address, email, phone number, and enrollment date.
- Store course information, including course name, description, credit hours, and associated departments.
- Track enrollments with grades, semesters, and course details.
- Maintain department information and faculty heads.
- Manage instructor details and their association with departments.

## How to Run/Setup the Project

### Prerequisites
- MySQL Server installed on your system.
- A MySQL client (e.g., MySQL Workbench, phpMyAdmin, or command-line interface).

### Steps
1. Open your MySQL client and connect to your MySQL server.
2. Create a new database by running the SQL script:
   ```sql
   CREATE DATABASE students_records;