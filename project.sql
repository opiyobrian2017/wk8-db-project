-- Create the database
CREATE DATABASE students_records;
USE students_records;

-- Create the students table
CREATE TABLE students (
    student_id CHAR(8) PRIMARY KEY NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    address VARCHAR(255),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    enrollment_date DATE NOT NULL
);

-- Insert sample data into students
INSERT INTO students (student_id, student_name, gender, address, email, phone_number, enrollment_date)
VALUES
('S0000001', 'John Otieno', 'Male', 'Namibia', 'john@elearn.com', '+1234567890', '2023-01-15'),
('S0000002', 'Joyleen Mwendwa', 'Female', 'Kenya', 'joy@elearn.com', '+254798765432', '2023-02-20'),
('S0000005', 'Shukri Maaw', 'Female', 'Somalia', 'maaw@elearn.com', '+2134567890', '2023-01-15'),
('S0000006', 'Eiden Dolly', 'Male', 'Kenya', 'dolly@elearn.com', '+25413456789', '2023-01-15'),
('S0000007', 'Alvin Nolan', 'Female', 'Tanzania', 'alvin@elearn.com', '1234567890', '2023-01-15'),
('S0000003', 'Arnold Nyisaka', 'Male', 'Rwanda', 'arnold@elearn.com', '+233287654321', '2023-02-20'),
('S0000004', 'Kerry Wahu', 'Male', 'Djibouti', 'kerry@elearn.com', '+22187654321', '2023-02-20');

-- Create the departments table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    faculty_head VARCHAR(100) NOT NULL
);

-- Insert sample data into departments
INSERT INTO departments (department_name, faculty_head)
VALUES
('Computer Science', 'Dr. Alice Johnson'),
('Mathematics', 'Dr. Bob Smith'),
('Physics', 'Dr. Carol Lee');

-- Create the instructors table
CREATE TABLE instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert sample data into instructors
INSERT INTO instructors (instructor_name, email, phone_number, department_id)
VALUES
('Dr. Emily Brown', 'emily.brown@@elearn.com', '+1122334455', 1),
('Dr. Michael Green', 'michael.@elearn.com', '+2233445566', 2);

-- Create the courses table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT,
    credit_hours INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert sample data into courses
INSERT INTO courses (course_name, course_description, credit_hours, department_id)
VALUES
('Database Systems', 'Introduction to relational databases', 3, 1),
('Calculus I', 'Differential and integral calculus', 4, 2);


-- Create the enrollments table
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id CHAR(8) NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    grade CHAR(2),
    semester_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert sample data into enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date, grade, semester_id)
VALUES
('S0000001', 1, '2023-03-01', 'A', 1),
('S0000002', 2, '2023-03-01', 'B', 2),
('S0000003', 1, '2023-03-01', 'C', 1),
('S0000004', 1, '2023-03-01', 'A', 1),
('S0000001', 2, '2023-03-01', 'D', 2),
('S0000002', 1, '2023-03-01', 'A', 2),
('S0000002', 2, '2023-03-05', 'B', 1);