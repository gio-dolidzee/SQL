# სტუდენტების ცხრილი
drop table if exists Students;

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
    PRIMARY KEY (ID)

);

INSERT INTO Students(FirstName, LastName, PersonID, Email, Address, DateOfBirth, Sex, Address2, FlatNumber)
VALUES ('Tata', 'Devdariani', '111', 'mariami@gmail.com', 'Rustaveli.1', '2000-10-10', 'Female', 'Chavchavadze.1', 11),
       ('Nana', 'Abutidze', '222', 'nan@gmail.com', 'Rustaveli.2', '2000-10-12', 'Female', 'Chavchavadze.2', 22),
       ('Vitali', 'Daraselia', '333', 'vitali@gmail.com', 'Rustaveli.3', '2000-10-15', 'Mmale', 'Chavchavadze.3', 33),
       ('Vaja', 'Daraselia', '444', 'vaja@gmail.com', 'Rustaveli.4', '2000-10-20', 'Male', 'Chavchavadze.4', 44),
       ('Tornike', 'Kakachia', '555', 'tornike@gmail.com', 'Rustaveli.5', '2000-10-1', 'Male', 'Chavchavadze.5', 55),
       ('Natia', 'Vakhania', '666', 'natia@gmail.com', 'Rustaveli.6', '2000-10-2', 'Female', 'Chavchavadze.6', 66),
       ('Gela', 'Bagaturia', '777', 'gela@gmail.com', 'Rustaveli.7', '2000-10-3', 'Male', 'Chavchavadze.7', 77),
       ('Nita', 'Tatoshvili', '888', 'nita@gmail.com', 'Rustaveli.8', '2000-10-4', 'Female', 'Chavchavadze.8', 88),
       ('Giorgi', 'Gegiadze', '999', 'giorgi@gmail.com', 'Rustaveli.9', '2000-10-5', 'Male', 'Chavchavadze.9', 99),
       ('Nato', 'Dolidze', '101', 'Nato@gmail.com', 'Rustaveli.10', '2000-10-6', 'Female', 'Chavchavadze.10', 1010);
       
 #ლექტორებიs ცხრილი
drop table if exists Teachers;

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
    Rankk           varchar(255) not null,
    PRIMARY KEY (ID)

);

INSERT INTO Teachers (FirstName, LastName, PersonID, Email, Address, DateOfBirth, Sex, Address2, FlatNumber, BankAccountNumber,Rankk )
VALUES ('Natia', 'Vadachkoria', '102', 'natia1@gmail.com', 'Rustaveli.11', '1990-10-10', 'Female', 'Chavchavadze.11', 51, 'TB12423424', 'AssociateProfessor'),
       ('Gela', 'Vadachkoria', '103', 'Gela1@gmail.com', 'Rustaveli.12', '1990-10-11', 'Male', 'Chavchavadze.12', 52, 'TB12423425', 'AssociateProfessor'),
       ('Nana', 'Vadachkoria', '104', 'Nana1@gmail.com', 'Rustaveli.13', '1990-10-12', 'Female', 'Chavchavadze.13', 53, 'TB12423426', 'SeniorAssistant'),
       ('Nato', 'Vadachkoria', '105', 'Nato1@gmail.com', 'Rustaveli.14', '1990-10-13', 'Female', 'Chavchavadze.14', 54, 'TB12423427', 'SeniorAssistant'),
       ('Goga', 'Vadachkoria', '106', 'Goga1@gmail.com', 'Rustaveli.15', '1990-10-14', 'Male', 'Chavchavadze.15', 55, 'TB12423428', 'AssociateProfessor');
      
