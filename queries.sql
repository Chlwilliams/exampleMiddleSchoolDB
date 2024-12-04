DROP DATABASE IF EXISTS MiddleSchoolDB;
CREATE DATABASE MiddleSchoolDB;
USE MiddleSchoolDB;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT,
    student_fname VARCHAR(255) NOT NULL,
    student_lname VARCHAR(255) NOT NULL,
    student_dob DATE NOT NULL,
    grade INT NOT NULL CHECK (grade BETWEEN 6 AND 8),
    guardian_fname VARCHAR(255) NOT NULL,
    guardian_lname VARCHAR(255) NOT NULL,
    guardian_number VARCHAR(255),
    guardian_email VARCHAR(255),
    guardian_address VARCHAR(255) NOT NULL,
	PRIMARY KEY(student_id)
);

INSERT INTO Students (student_fname, student_lname, student_dob, grade, guardian_fname,
 guardian_lname, guardian_number, guardian_email,guardian_address)
 VALUES
 -- 8th Graders
 ("Jessica", "Jackson","2010-06-15", 8, "Alfonzo", "Jackson", "210-555-9821", "GravityJackson@fgmail.com", "1234 Elm Street" ), 
('Mason', 'Taylor', '2009-11-22', 8, 'Emily', 'Taylor', '210-555-1234', 'MasonTayloreight@fgmail.com', '4321 Maple Avenue'),
('Sophia', 'Williams', '2010-02-17', 8, 'Daniel', 'Williams', '210-555-2345', 'SophWill88@fgmail.com', '5678 Oak Drive'),
('Ethan', 'Harris', '2010-08-05', 8, 'Sarah', 'Harris', '210-555-8765', 'EthanHarris_123@fgmail.com', '3456 Pine Street'),
('Ava', 'Martinez', '2009-12-30', 8, 'Carlos', 'Martinez', '210-555-5678', 'AvaMartinez88@fgmail.com', '7890 Cedar Road'),
('Jessica', 'Jackson', '2010-06-15', 8, 'Alfonzo', 'Jackson', '210-555-9821', 'GravityJackson@fgmail.com', '1234 Elm Street'),
-- 7th Graders
('Liam', 'Garcia', '2011-03-14', 7, 'Elena', 'Garcia', '210-555-9012', 'LiamGarc7th@fgmail.com', '1234 Birch Avenue'),
('Olivia', 'Smith', '2011-07-25', 7, 'Michael', 'Smith', '210-555-1122', 'OliviaS7thGrade@fgmail.com', '9876 Pinewood Drive'),
('Lucas', 'Davis', '2011-01-02', 7, 'Grace', 'Davis', '210-555-2233', 'LucasDavis7th@fgmail.com', '1011 Red Oak Street'),
('Charlotte', 'Brown', '2011-09-16', 7, 'Richard', 'Brown', '210-555-3344', 'CharlotteBrown7@fgmail.com', '2345 Cherry Lane'),
('James', 'Wilson', '2011-05-09', 7, 'Patricia', 'Wilson', '210-555-4455', 'JamesWilson7th@fgmail.com', '6543 Maplewood Blvd.'),
-- 6th Graders
('Benjamin', 'Moore', '2012-08-21', 6, 'Clara', 'Moore', '210-555-5566', 'BenMoore6th@fgmail.com', '6789 Oakwood Avenue'),
('Ella', 'Johnson', '2012-03-09', 6, 'Samuel', 'Johnson', '210-555-6677', 'EllaJ6th@fgmail.com', '1122 Willow Street'),
('Aiden', 'Clark', '2012-10-05', 6, 'Olivia', 'Clark', '210-555-7788', 'AidenClark6th@fgmail.com', '2233 Birchwood Road'),
('Chloe', 'Lee', '2012-02-22', 6, 'Andrew', 'Lee', '210-555-8899', 'ChloeLee6th@fgmail.com', '3344 Sunset Drive'),
('Daniel', 'Martinez', '2012-06-11', 6, 'Maria', 'Martinez', '210-555-9900', 'DanielMartinez6th@fgmail.com', '4455 Highland Street');

CREATE TABLE Roles ( 
faculty_code INT PRIMARY KEY,
faculty_title VARCHAR(255) NOT NULL
);

INSERT INTO Roles(faculty_code, faculty_title)
VALUES
(1,"Adminstration"),
(2,"Teacher"),
(3, "Counselor"),
(4, "Janitor/Mainenance Staff");

CREATE TABLE ClassCode(
class_code INT AUTO_INCREMENT PRIMARY KEY,
class_title VARCHAR(255)
);

INSERT INTO ClassCode(class_title)
VALUES
("Science for 6th Grade"),
("Math for 6th Grade"),
("Literature for 6th Grade"),
("Science for 7th Grade"),
("Math for 7th Grade"),
("Literature for 7th Grade"),
("Science for 8th Grade"),
("Math for 8th Grade"),
("Literature for 8th Grade");

CREATE TABLE Room (
room_id INT AUTO_INCREMENT NOT NULL, 
room_number INT NOT NULL,
floor INT NOT NULL,
class_code INT,
PRIMARY KEY(room_id),
FOREIGN KEY(class_code) REFERENCES ClassCode(class_code)
);

INSERT INTO Room(room_number, floor, class_code)
VALUES
(101, 1, 1),
(102, 1, 2),
(103, 1, 3),
(104, 1, NULL),
(105, 1, NULL),
(201, 2, 4),
(202, 2, 5),
(203, 2, 6),
(204, 2, NULL),
(205, 2, NULL),
(301, 3, 7),
(302, 3, 8), 
(303, 3, 9),
(304, 3, NULL),
(305, 3, NULL);

CREATE TABLE Faculty (
    faculty_id INT AUTO_INCREMENT,
    faculty_fname VARCHAR(255) NOT NULL,
    faculty_lname VARCHAR(255) NOT NULL,
    faculty_code INT NOT NULL,
    faculty_email VARCHAR(255),
    faculty_phone VARCHAR(255),
    class_code INT,
    PRIMARY KEY(faculty_id),
    FOREIGN KEY(faculty_code) REFERENCES Roles(faculty_code),
    FOREIGN KEY(class_code) REFERENCES ClassCode(class_code),
    CONSTRAINT check_class_code CHECK ((faculty_code = 2
        AND class_code IS NOT NULL)
        OR (faculty_code != 2 AND class_code IS NULL))
);

INSERT INTO Faculty (faculty_fname, faculty_lname, faculty_code, faculty_email, faculty_phone, class_code)
VALUES
-- Adminstration
("Adrian", "Saldo","1","A-saldo@fgmail.com","210-555-2200",null),
("Sarah", "Johnson", 1, "s-johnson@fgmail.com", "210-555-2201", NULL),
-- Teachers
("John", "Doe", 2, "j-doe@fgmail.com", "210-555-2202", 1),
("Jane", "Smith", 2, "j-smith@fgmail.com", "210-555-2203", 2),
("Emily", "Davis", 2, "e-davis@fgmail.com", "210-555-2204", 3),
("Michael", "Brown", 2, "m-brown@fgmail.com", "210-555-2205", 4),
("Linda", "Williams", 2, "l-williams@fgmail.com", "210-555-2206", 5),
("David", "Taylor", 2, "d-taylor@fgmail.com", "210-555-2207", 6),
("Olivia", "Martinez", 2, "o-martinez@fgmail.com", "210-555-2213", 7),
("James", "Harris", 2, "j-harris@fgmail.com", "210-555-2214", 8),
("Sophia", "Clark", 2, "s-clark@fgmail.com", "210-555-2215", 9),
-- Counselors
("Alice", "Martinez", 3, "a-martinez@fgmail.com", "210-555-2208", NULL),
("Robert", "Garcia", 3, "r-garcia@fgmail.com", "210-555-2209", NULL),
-- Janitors
("George", "Wilson", 4, "g-wilson@fgmail.com", "210-555-2210", NULL),
("Nancy", "Lee", 4, "n-lee@fgmail.com", "210-555-2211", NULL),
("Steven", "White", 4, "s-white@fgmail.com", "210-555-2212", NULL);


CREATE TABLE Enroll (
enrollment_id INT AUTO_INCREMENT,
student_id INT,
class_code INT,
room_number INT,
faculty_id INT,
PRIMARY KEY(enrollment_id),
FOREIGN KEY(student_id) REFERENCES Students(student_id),
FOREIGN KEY(class_code) REFERENCES ClassCode(class_code),
FOREIGN KEY(faculty_id) REFERENCES Faculty(faculty_id)
);




SELECT * FROM Students;