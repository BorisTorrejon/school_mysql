CREATE DATABASE school;
USE school;
CREATE TABLE school.users (
    user_id INT NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    user_password VARCHAR(20) NOT NULL,
    user_name VARCHAR (20) NOT NULL,
    user_surname VARCHAR (20) NOT NULL,
    user_address VARCHAR (20),
    user_dni VARCHAR (8) NOT NULL,
    PRIMARY KEY(user_id)
);
CREATE TABLE school.phones (
    phone_id INT NOT NULL,
    phone_user INT NOT NULL,
    phone_number VARCHAR (20) NOT NULL,
    phone_detail VARCHAR (20),
    PRIMARY KEY(phone_id),
    FOREIGN KEY(phone_user) REFERENCES school.users (user_id)
);
CREATE TABLE careers(
    career_id INT NOT NULL,
    career_name VARCHAR(20),
    career_detail VARCHAR(50),
    PRIMARY KEY (career_id)
);
CREATE TABLE students (
    student_id INT NOT NULL,
    student_user INT NOT NULL,
    student_discount VARCHAR(10),
    student_career INT NOT NULL,
    PRIMARY KEY (student_id),
    FOREIGN KEY (student_user) REFERENCES school.users (user_id),
    FOREIGN KEY (student_career) REFERENCES school.careers (career_id)
);
CREATE TABLE teachers (
    teacher_id INT NOT NULL,
    teacher_user INT NOT NULL,
    teacher_salary INT,
    PRIMARY KEY (teacher_id),
    FOREIGN KEY (teacher_user) REFERENCES school.users (user_id)
);
CREATE TABLE courses (
    course_id INT NOT NULL,
    course_teacher INT NOT NULL,
    course_name VARCHAR(20) NOT NULL,
    course_detail VARCHAR(50),
    course_correlative INT,
    PRIMARY KEY (course_id),
    FOREIGN KEY (course_teacher) REFERENCES school.teachers (teacher_id)
);
CREATE TABLE student_course (
    student_course_id int not null,
    course int not null,
    student int not null,
    PRIMARY KEY (student_course_id),
    FOREIGN KEY (course) REFERENCES school.courses(course_id),
    FOREIGN KEY (student) REFERENCES school.students(student_id)
);
CREATE TABLE career_course (
    career_course_id int not null,
    career int not null,
    course int not null,
    PRIMARY KEY (career_course_id),
    FOREIGN KEY (career) REFERENCES school.careers(career_id),
    FOREIGN KEY (course) REFERENCES school.courses(course_id)
);