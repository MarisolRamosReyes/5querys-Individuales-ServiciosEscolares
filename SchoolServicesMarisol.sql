USE master;
GO
IF DB_ID(N'SchoolServicesMarisol')IS NOT NULL
DROP DATABASE SchoolServicesMarisol;
GO
CREATE DATABASE SchoolServicesMarisol
ON
(NAME = SchoolServicesMarisol_dat,
FILENAME= 'C:\BaseDatos\SchoolServicesMarisol.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME =SchoolServicesMarisol_log,
FILENAME = 'C:\BaseDatos\SchoolServicesMarisol.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE SchoolServicesMarisol;
GO
-- Student
CREATE TABLE Student (
    idStudent INT PRIMARY KEY IDENTITY(1,1),
    idStudyPlan INT NOT NULL,
    registrationNumber VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    curp CHAR(18) UNIQUE NOT NULL,
    rfc CHAR(13) UNIQUE NOT NULL,
    nss CHAR(11) UNIQUE NOT NULL,
    idLifeInsurance INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);
-- Career
CREATE TABLE Career (
    idCareer INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100) NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- StudyPlan
CREATE TABLE StudyPlan (
    idStudyPlan INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    code VARCHAR(10) NOT NULL,
    duration INT NOT NULL,
    credits INT NOT NULL,
    idCareer INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);
-- InstitutionalScholarship
CREATE TABLE InstitutionalScholarship (
    idInstitutionalScholarship INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    percentage DECIMAL(5, 2) NOT NULL,
    requirements VARCHAR(100) NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- InternalScholarshipDetails
CREATE TABLE InternalScholarshipDetails (
    idInternalScholarshipDetails INT PRIMARY KEY IDENTITY(1,1),
    idInstitutionalScholarship INT NOT NULL,
    idStudent INT NOT NULL,
    semester INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- ExternalScholarshipDetails
CREATE TABLE ExternalScholarshipDetails (
    idExternalScholarshipDetails INT PRIMARY KEY IDENTITY(1,1),
    idStudent INT NOT NULL,
    idExternalScholarship INT NOT NULL,
    institution VARCHAR(50) NOT NULL,
    campus VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL,
    semester INT NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);

-- ExternalScholarship
CREATE TABLE ExternalScholarship (
    idExternalScholarship INT PRIMARY KEY IDENTITY(1,1),
    scholarshipName VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    paymentDate DATE NOT NULL,
    status BIT DEFAULT 1 NOT NULL,
    idUserCreate INT NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);
GO
CREATE INDEX IX_InstitutionalScholarship ON InstitutionalScholarship (idInstitutionalScholarship);
CREATE INDEX IX_InternalScholarshipDetails ON InternalScholarshipDetails (idInternalScholarshipDetails);
CREATE INDEX IX_ExternalScholarshipDetails ON ExternalScholarshipDetails (idExternalScholarshipDetails);
CREATE INDEX IX_ExternalScholarship ON ExternalScholarship (idExternalScholarship);
CREATE INDEX IX_Student ON Student (idStudent);

ALTER TABLE InternalScholarshipDetails
ADD CONSTRAINT FK_InternalScholarshipDetailsStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);
ALTER TABLE InternalScholarshipDetails
ADD CONSTRAINT FK_InternalScholarshipDetailsInstitutionalScholarship FOREIGN KEY (idInstitutionalScholarship) REFERENCES InstitutionalScholarship (idInstitutionalScholarship);

ALTER TABLE ExternalScholarshipDetails
ADD CONSTRAINT FK_ExternalScholarshipDetailsStudent FOREIGN KEY (idStudent) REFERENCES Student (idStudent);
ALTER TABLE ExternalScholarshipDetails
ADD CONSTRAINT FK_ExternalScholarshipDetailsExternalScholarship FOREIGN KEY (idExternalScholarship) REFERENCES ExternalScholarship (idExternalScholarship);

ALTER TABLE StudyPlan 
ADD CONSTRAINT FK_StudyPlanCareer FOREIGN KEY (idCareer) REFERENCES Career (idCareer);

INSERT INTO Career (name, description)
VALUES ('Ingeniería Informática', 'Ingeniería especilizada en computadoras'),
       ('Ingeniería Mecanica', 'Ingeniería especilizada en mantenimiento de motores'),
       ('Ingeniería Electronica', 'Ingeniería especilizada en circuitos de corriente y robotica'),
       ('Ingeniería Gestión Empresarial', 'Ingeniería especilizada en organización de una empresa'),
       ('Ingeniería Industrial', 'Ingeniería especilizada en conocer varias áreas de una empresa'),
       ('Ingeniería en Energias Renovables', 'Ingeniería especilizada en cuidar el medio ámbiente con tecnología');

INSERT INTO StudyPlan(name, code, duration, credits, idCareer,idUserCreate,creationDate)
VALUES ('Ingeniería Informática', 'INFI-2023', 6, 300, 1, 1, '2023-10-23'),
       ('Ingeniería Mecanica', 'INMC-2023', 6, 310, 2, 1, '2023-10-23'),
       ('Ingeniería Electronica', 'INEL-2023', 6, 290, 3, 1, '2023-10-23'),
       ('Ingeniería Gestión Empresarial', 'INGE-2023', 6, 250, 4, 1, '2023-10-23'),
       ('Ingeniería Industrial', 'INFI-2023', 5, 320, 5 , 1, '2023-10-23'),
       ('Ingeniería en Energías Renovables', 'INER-2023', 6, 300, 6, 1, '2023-10-23');

INSERT INTO Student(idStudyPlan, registrationNumber, name, lastName, phoneNumber, email, address, curp, rfc, nss, idLifeInsurance, idUserCreate,creationDate)
VALUES (1, 'I20050036','Marisol','Ramos Reyes', '8661753793', 'I20050036@monclova.tecnm.mx', 'Matamoros #351', 'RARM020427MCTMRAS0', 'RARM020427MCT', '24334445412', 2, 2, '2023-10-23'),
       (2, 'I20050033','Pablo Armando','Ramirez Ortiz', '8663458734', 'I20050033@monclova.tecnm.mx', 'Constitución #959', 'RMOP0209HCLPRKO2', 'RMOP0209HCL', '45353453886', 3, 1, '2023-10-23'), 
	   (3, 'I18003230','Yael Jesús','Reyes Martinez', '8661283495', 'I18003230@monclova.tecnm.mx', 'Serafin Cantu #521', 'REMY000712HCLYRLA0', 'REMY000712HCL', '00548653846', 1, 2, '2023-10-23');

INSERT INTO ExternalScholarship(scholarshipName, amount, paymentDate, idUserCreate, creationDate)
VALUES ('Tecnologico de campus Monclova',1300.00 ,'2023-10-31', 1, '2023-10-23')

INSERT INTO InstitutionalScholarship (name, percentage, requirements, idUserCreate, creationDate)
VALUES ('Beca Institucional', 75.00, 'Para alumnos de promedio igual o mayor de 90', 1, '2023-10-23'),
       ('Beca de Ofandad', 50.00, 'Para alumnos que necesiten una beca', 1, '2023-10-23'), 
	   ('Beca por parentesco', 20.00, 'Para los alumnos que tienen un familiar trabajando en la institución ', 1, '2023-10-23');

INSERT INTO InternalScholarshipDetails (idInstitutionalScholarship, idStudent, semester)
VALUES (1, 1, 1, 1, '2023-10-23'),
       (2, 2, 2, 1, '2023-10-23'),
	   (3, 3, 3, 1, '2023-10-23');

INSERT INTO ExternalScholarshipDetails (idStudent, idExternalScholarship, institution, campus, major, semester, idUserCreate, creationDate)
VALUES (1, 2, 'Instituto Tecnologico Superior de México', 'campus Monclova', 'Ing Industrial',7, 1, '2023-10-23'), 
       (2, 2, 'Instituto Tecnologico Superior de México', 'campus Monclova', 'Ing Mecanica',5, 1, '2023-10-23'), 
	   (3, 2, 'Instituto Tecnologico Superior de México', 'campus Monclova', 'Ing Informatica', 3, 1, '2023-10-23');
