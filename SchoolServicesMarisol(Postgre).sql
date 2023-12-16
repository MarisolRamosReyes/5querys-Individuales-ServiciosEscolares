create database schoolservices;
-- Student
CREATE TABLE Student (
    idStudent Serial primary key,
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
    status BOOLEAN NOT NULL DEFAULT TRUE,
	idUserCreate INT,
	creationDate timestamp,
	idUserModify INT,
	modifiedDate timestamp
);
-- Career
CREATE TABLE Career (
    idCareer Serial primary key,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT NOT NULL,
    creationDate timestamp NOT NULL,
    idUserModify INT,
    modifiedDate timestamp
);

-- StudyPlan
CREATE TABLE StudyPlan (
    idStudyPlan Serial primary key,
    name VARCHAR(50) NOT NULL,
    code VARCHAR(10) NOT NULL,
    duration INT NOT NULL,
    credits INT NOT NULL,
    idCareer INT NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT NOT NULL,
    creationDate timestamp NOT NULL,
    idUserModify INT,
    modifiedDate DATE
);
-- InstitutionalScholarship
CREATE TABLE InstitutionalScholarship (
    idInstitutionalScholarship Serial primary key,
    name VARCHAR(50) NOT NULL,
    percentage DECIMAL(5, 2) NOT NULL,
    requirements VARCHAR(100) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT NOT NULL,
    creationDate timestamp NOT NULL,
    idUserModify INT,
    modifiedDate timestamp
);

-- InternalScholarshipDetails
CREATE TABLE InternalScholarshipDetails (
    idInternalScholarshipDetails Serial primary key,
    idInstitutionalScholarship INT NOT NULL,
    idStudent INT NOT NULL,
    semester INT NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT NOT NULL,
    creationDate timestamp NOT NULL,
    idUserModify INT,
    modifiedDate timestamp
);

-- ExternalScholarshipDetails
CREATE TABLE ExternalScholarshipDetails (
    idExternalScholarshipDetails Serial primary key,
    idStudent INT NOT NULL,
    idExternalScholarship INT NOT NULL,
    institution VARCHAR(50) NOT NULL,
    campus VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL,
    semester INT NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT NOT NULL,
    creationDate timestamp NOT NULL,
    idUserModify INT,
    modifiedDate timestamp
);

-- ExternalScholarship
CREATE TABLE ExternalScholarship (
    idExternalScholarship Serial primary key,
    scholarshipName VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    paymentDate timestamp NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    idUserCreate INT NOT NULL,
    creationDate timestamp NOT NULL,
    idUserModify INT,
    modifiedDate timestamp
);

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

INSERT INTO Career (name, description,idUserCreate,creationDate)
VALUES ('Ingenier�a Inform�tica', 'Ingenier�a especilizada en computadoras', 1, '2023-10-23'),
       ('Ingenier�a Mecanica', 'Ingenier�a especilizada en mantenimiento de motores', 1, '2023-10-23'),
       ('Ingenier�a Electronica', 'Ingenier�a especilizada en circuitos de corriente y robotica', 1, '2023-10-23'),
       ('Ingenier�a Gesti�n Empresarial', 'Ingenier�a especilizada en organizaci�n de una empresa', 1, '2023-10-23'),
       ('Ingenier�a Industrial', 'Ingenier�a especilizada en conocer varias �reas de una empresa', 1, '2023-10-23'),
       ('Ingenier�a en Energias Renovables', 'Ingenier�a especilizada en cuidar el medio �mbiente con tecnolog�a', 1, '2023-10-23');


INSERT INTO StudyPlan(name, code, duration, credits, idCareer,idUserCreate,creationDate)
VALUES ('Ingenier�a Inform�tica', 'INFI-2023', 6, 300, 1, 1, '2023-10-23'),
       ('Ingenier�a Mecanica', 'INMC-2023', 6, 310, 2, 1, '2023-10-23'),
       ('Ingenier�a Electronica', 'INEL-2023', 6, 290, 3, 1, '2023-10-23'),
       ('Ingenier�a Gesti�n Empresarial', 'INGE-2023', 6, 250, 4, 1, '2023-10-23'),
       ('Ingenier�a Industrial', 'INFI-2023', 5, 320, 5 , 1, '2023-10-23'),
       ('Ingenier�a en Energ�as Renovables', 'INER-2023', 6, 300, 6, 1, '2023-10-23');

INSERT INTO Student(idStudyPlan, registrationNumber, name, lastName, phoneNumber, email, address, curp, rfc, nss, idLifeInsurance, idUserCreate,creationDate)
VALUES (1, 'I20050036','Marisol','Ramos Reyes', '8661753793', 'I20050036@monclova.tecnm.mx', 'Matamoros #351', 'RARM020427MCTMRAS0', 'RARM020427MCT', '24334445412', 2, 2, '2023-10-23'),
       (2, 'I20050033','Pablo Armando','Ramirez Ortiz', '8663458734', 'I20050033@monclova.tecnm.mx', 'Constituci�n #959', 'RMOP0209HCLPRKO2', 'RMOP0209HCL', '45353453886', 3, 1, '2023-10-23'), 
	   (3, 'I18003230','Yael Jes�s','Reyes Martinez', '8661283495', 'I18003230@monclova.tecnm.mx', 'Serafin Cantu #521', 'REMY000712HCLYRLA0', 'REMY000712HCL', '00548653846', 1, 2, '2023-10-23');

INSERT INTO ExternalScholarship(scholarshipName, amount, paymentDate, idUserCreate, creationDate)
VALUES ('Tecnologico de campus Monclova',1300.00 ,'2023-10-31', 1, '2023-10-23');

INSERT INTO InstitutionalScholarship (name, percentage, requirements, idUserCreate, creationDate)
VALUES ('Beca Institucional', 75.00, 'Para alumnos de promedio igual o mayor de 90', 1, '2023-10-23'),
       ('Beca de Ofandad', 50.00, 'Para alumnos que necesiten una beca', 1, '2023-10-23'), 
	   ('Beca por parentesco', 20.00, 'Para los alumnos que tienen un familiar trabajando en la instituci�n ', 1, '2023-10-23');

INSERT INTO InternalScholarshipDetails (idInstitutionalScholarship, idStudent, semester)
VALUES (1, 1, 1, 1, '2023-10-23'),
       (2, 2, 2, 1, '2023-10-23'),
	   (3, 3, 3, 1, '2023-10-23');

INSERT INTO ExternalScholarshipDetails (idStudent, idExternalScholarship, institution, campus, major, semester, idUserCreate, creationDate)
VALUES (1, 2, 'Instituto Tecnologico Superior de M�xico', 'campus Monclova', 'Ing Industrial',7, 1, '2023-10-23'), 
       (2, 2, 'Instituto Tecnologico Superior de M�xico', 'campus Monclova', 'Ing Mecanica',5, 1, '2023-10-23'), 
	   (3, 2, 'Instituto Tecnologico Superior de M�xico', 'campus Monclova', 'Ing Informatica', 3, 1, '2023-10-23');
