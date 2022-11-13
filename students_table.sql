create database if not exists LessonDB;
use LessonDB;

drop table if exists Students_Subjects_schedules_rel;
drop table if exists subjects_schedules_rel;
drop table if exists Students;
drop table if exists Faculties;
drop table if exists Subjects;
drop table if exists Teachers;
drop table if exists Managers;
drop table if exists Schedules;
drop table if exists Courses;


# დამხმარე მენეჯერების ცხრილი
CREATE TABLE Managers
(
    ID                bigint auto_increment,
    FirstName         varchar(255) not null,
    LastName          varchar(255) not null,
    PersonID          varchar(11)  not null unique,
    Email             varchar(255) not null unique,
    Address           varchar(255) not null,
    DateOfBirth       DATE         not null,
    Sex               varchar(255) not null,
    Address2          varchar(255),
    FlatNumber        int,
    BankAccountNumber varchar(255) not null unique,
    PRIMARY KEY (ID)

);

# ფაკულტეტების ცხრილი
CREATE TABLE Faculties
(
    ID         bigint auto_increment,
    Name       varchar(255) not null,
    Manager_id bigint       not null,
    PRIMARY KEY (ID),
    CONSTRAINT `faculties_managers_fk`
        FOREIGN KEY (Manager_id) REFERENCES Managers (Id)
            ON DELETE CASCADE ON UPDATE CASCADE
);

#კურსების ცხრილი
CREATE TABLE Courses
(
    ID   bigint auto_increment,
    Name varchar(255) not null,
    PRIMARY KEY (ID)

);
#ლექტორების ცხრილი
CREATE TABLE Teachers
(
    ID                bigint auto_increment,
    FirstName         varchar(255) not null,
    LastName          varchar(255) not null,
    PersonID          varchar(11)  not null unique,
    Email             varchar(255) not null unique,
    Address           varchar(255) not null,
    DateOfBirth       DATE         not null,
    Sex               varchar(255) not null,
    Address2          varchar(255),
    FlatNumber        int,
    BankAccountNumber varchar(255) not null unique,
    Rankk             varchar(255) not null,
    PRIMARY KEY (ID)

);

#საგნების ცხრილი
CREATE TABLE Subjects
(
    ID          bigint auto_increment,
    Name        varchar(255) not null,
    Course_id   bigint       not null,
    Teachers_id bigint       not null,
    PRIMARY KEY (ID),
    CONSTRAINT `subjects_courses_fk`
        FOREIGN KEY (Course_id) REFERENCES Courses (Id)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `subjects_teachers_fk`
        FOREIGN KEY (Teachers_id) REFERENCES Teachers (Id)
            ON DELETE CASCADE ON UPDATE CASCADE
);


# სტუდენტების ცხრილი
CREATE TABLE Students
(
    ID          bigint auto_increment,
    FirstName   varchar(255) not null,
    LastName    varchar(255) not null,
    PersonID    varchar(11)  not null unique,
    Email       varchar(255) not null unique,
    Address     varchar(255) not null,
    DateOfBirth DATE         not null,
    Sex         varchar(255) not null,
    Address2    varchar(255),
    FlatNumber  int,
    Faculty_id  bigint       not null,
    Course_id   bigint       not null,
    PRIMARY KEY (ID),
    CONSTRAINT `students_faculties_fk`
        FOREIGN KEY (Faculty_id) REFERENCES Faculties (Id)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `students_course_fk`
        FOREIGN KEY (Course_id) REFERENCES Courses (Id)
            ON DELETE CASCADE ON UPDATE CASCADE
);


# განრიგის ცხრილი
CREATE TABLE Schedules
(
    ID      bigint auto_increment,
    Weekday VARCHAR(20) not null,
    Time    TIME        not null,
    PRIMARY KEY (ID)
);


# საგნებისა და განრიგის რელაცია
create table subjects_schedules_rel
(
    ID           bigint auto_increment,
    Subject_id   bigint not null,
    Schedules_id bigint not null,
    primary key (ID),
    CONSTRAINT `subject_id_schedules_rel_fk`
        FOREIGN KEY (Subject_id) REFERENCES Subjects (ID)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `schedules_id_subject_rel_fk`
        FOREIGN KEY (Schedules_id) REFERENCES Schedules (ID)
            ON DELETE CASCADE ON UPDATE CASCADE
);


# სტუდენტებისა და ლექციების რელაცია
create table Students_Subjects_schedules_rel
(
    ID                  bigint AUTO_INCREMENT not null,
    Student_id          bigint                not null,
    Subject_Schedule_id bigint                not null,
    primary key (ID),
    CONSTRAINT `students_id_subject_id_schedules_rel_fk`
        FOREIGN KEY (Student_id) REFERENCES Students (ID)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `students_schedules_id_subject_rel_fk`
        FOREIGN KEY (Subject_Schedule_id) REFERENCES Subjects_schedules_rel (ID)
            ON DELETE CASCADE ON UPDATE CASCADE
);

# -------------

INSERT INTO Managers (FirstName, LastName, PersonID, Email, Address, DateOfBirth, Sex, Address2, FlatNumber,
                      BankAccountNumber)
VALUES ('Tatia', 'Imerlishvili', '107', 'Tatia2@gmail.com', 'Rustaveli.16', '1995-10-10', 'Female', 'Chavchavadze.16',
        56, 'TB12423429'),
       ('Eka', 'Imerlishvili', '108', 'Eka2@gmail.com', 'Rustaveli.17', '1995-10-11', 'Female', 'Chavchavadze.17', 57,
        'TB12423419'),
       ('Nini', 'Imerlishvili', '109', 'Nini2@gmail.com', 'Rustaveli.18', '1995-10-12', 'Female', 'Chavchavadze.18', 58,
        'TB12423439'),
       ('Keta', 'Imerlishvili', '207', 'Keta2@gmail.com', 'Rustaveli.19', '1995-10-13', 'Female', 'Chavchavadze.19', 59,
        'TB12423449');

INSERT INTO Faculties (Name, Manager_id)
VALUES ('Computer science', 1),
       ('Mathematics', 2),
       ('Philosophy', 3),
       ('Biology', 4);


INSERT INTO Courses (Name)
VALUES ('I'),
       ('II'),
       ('III'),
       ('IV');

INSERT INTO Teachers (FirstName, LastName, PersonID, Email, Address, DateOfBirth, Sex, Address2, FlatNumber,
                      BankAccountNumber, Rankk)
VALUES ('Natia', 'Vadachkoria', '102', 'natia1@gmail.com', 'Rustaveli.11', '1990-10-10', 'Female', 'Chavchavadze.11',
        51, 'TB12423424', 'AssociateProfessor'),
       ('Gela', 'Vadachkoria', '103', 'Gela1@gmail.com', 'Rustaveli.12', '1990-10-11', 'Male', 'Chavchavadze.12', 52,
        'TB12423425', 'AssociateProfessor'),
       ('Nana', 'Vadachkoria', '104', 'Nana1@gmail.com', 'Rustaveli.13', '1990-10-12', 'Female', 'Chavchavadze.13', 53,
        'TB12423426', 'SeniorAssistant'),
       ('Nato', 'Vadachkoria', '105', 'Nato1@gmail.com', 'Rustaveli.14', '1990-10-13', 'Female', 'Chavchavadze.14', 54,
        'TB12423427', 'SeniorAssistant'),
       ('Goga', 'Vadachkoria', '106', 'Goga1@gmail.com', 'Rustaveli.15', '1990-10-14', 'Male', 'Chavchavadze.15', 55,
        'TB12423428', 'AssociateProfessor');

INSERT INTO Subjects (Name, Course_id, Teachers_id)
VALUES ('C++', 1, 1),
       ('Python', 1, 2),
       ('Java', 1, 3),
       ('Algorithms', 1, 4),
       ('Matlab', 2, 5),
       ('Calculus', 1, 1),
       ('Algebra', 4, 2),
       ('Geometry', 3, 4),
       ('Mathematical Logic', 4, 5),
       ('Martingales', 1, 5),
       ('Ethics', 2, 2),
       ('Aesthetics', 3, 2),
       ('Logic', 3, 1),
       ('Political Philosophy', 4, 4),
       ('Ontology', 1, 5),
       ('Anatomy', 3, 4),
       ('Genetics', 2, 2),
       ('Chemistry', 3, 1),
       ('Botanics', 4, 1),
       ('Physics', 2, 1);

INSERT INTO Students(FirstName, LastName, PersonID, Email, Address, DateOfBirth, Sex, Address2, FlatNumber, Faculty_id,
                     Course_id)
VALUES ('Tata', 'Devdariani', '111', 'mariami@gmail.com', 'Rustaveli.1', '2000-10-10', 'Female', 'Chavchavadze.1', 11,
        1, 2),
       ('Nana', 'Abutidze', '222', 'nan@gmail.com', 'Rustaveli.2', '2000-10-12', 'Female', 'Chavchavadze.2', 22, 1, 3),
       ('Vitali', 'Daraselia', '333', 'vitali@gmail.com', 'Rustaveli.3', '2000-10-15', 'Mmale', 'Chavchavadze.3', 33, 2,
        1),
       ('Vaja', 'Daraselia', '444', 'vaja@gmail.com', 'Rustaveli.4', '2000-10-20', 'Male', 'Chavchavadze.4', 44, 3, 1),
       ('Tornike', 'Kakachia', '555', 'tornike@gmail.com', 'Rustaveli.5', '2000-10-1', 'Male', 'Chavchavadze.5', 55, 4,
        4),
       ('Natia', 'Vakhania', '666', 'natia@gmail.com', 'Rustaveli.6', '2000-10-2', 'Female', 'Chavchavadze.6', 66, 3,
        3),
       ('Gela', 'Bagaturia', '777', 'gela@gmail.com', 'Rustaveli.7', '2000-10-3', 'Male', 'Chavchavadze.7', 77, 3, 2),
       ('Nita', 'Tatoshvili', '888', 'nita@gmail.com', 'Rustaveli.8', '2000-10-4', 'Female', 'Chavchavadze.8', 88, 2,
        4),
       ('Giorgi', 'Gegiadze', '999', 'giorgi@gmail.com', 'Rustaveli.9', '2000-10-5', 'Male', 'Chavchavadze.9', 99, 3,
        1),
       ('Nato', 'Dolidze', '101', 'Nato@gmail.com', 'Rustaveli.10', '2000-10-6', 'Female', 'Chavchavadze.10', 1010, 1,
        1);

INSERT INTO Schedules (Weekday, Time)
VALUES ('Monday', '10:00:00'),
       ('Monday', '11:00:00'),
       ('Monday', '12:00:00'),
       ('Tuesday', '10:00:00'),
       ('Tuesday', '11:00:00'),
       ('Tuesday', '12:00:00'),
       ('Wednesday', '10:00:00'),
       ('Wednesday', '11:00:00'),
       ('Wednesday', '12:00:00'),
       ('Thursday', '10:00:00'),
       ('Thursday', '11:00:00'),
       ('Thursday', '12:00:00'),
       ('Friday', '10:00:00'),
       ('Friday', '11:00:00'),
       ('Friday', '12:00:00'),
       ('Saturday', '10:00:00'),
       ('Saturday', '11:00:00'),
       ('Saturday', '12:00:00');



INSERT INTO subjects_schedules_rel (Subject_id, Schedules_id)
VALUES (6, 1),
       (6, 7),
       (6, 13),
       (2, 1),
       (2, 7),
       (2, 13),
       (3, 1),
       (3, 7),
       (3, 13);

INSERT INTO Students_Subjects_schedules_rel (Student_id, Subject_Schedule_id)
VALUES (1, 3),
       (2, 2),
       (3, 4),
       (2, 2);
