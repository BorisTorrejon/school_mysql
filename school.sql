CREATE DATABASE school;
use school;
CREATE table school.users (
    user_id int not null,
    user_email varchar(50) not null,
    user_password varchar(20) not null,
    user_name varchar (20) not null,
    user_surname varchar (20) not null,
    user_address varchar (20),
    user_dni varchar (8) not null,
    PRIMARY key(user_id)
);
create table school.phones (
    phone_id int not null,
    phone_user int not null,
    phone_number varchar (20) not null,
    phone_detail varchar (20),
    PRIMARY key(phone_id),
    FOREIGN key(phone_user) REFERENCES school.users (user_id)
);
create table careers(
    career_id int not null,
    career_name varchar(20),
    career_detail varchar(50),
    PRIMARY key (career_id)
);
create table students (
    student_id int not null,
    student_user int not null,
    student_discount VARCHAR(10),
    student_career int not null,
    PRIMARY key (student_id),
    FOREIGN key (student_user) REFERENCES school.users (user_id),
    FOREIGN key (student_career) REFERENCES school.careers (career_id)
);
create table teachers (
    teacher_id int not null,
    teacher_user int not null,
    teacher_salary int,
    PRIMARY key (teacher_id),
    FOREIGN key (teacher_user) REFERENCES school.users (user_id)
);