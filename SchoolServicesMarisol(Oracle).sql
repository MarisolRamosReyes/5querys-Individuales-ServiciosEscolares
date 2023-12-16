-- Tables
-- Student
CREATE TABLE Student (
    idStudent NUMBER PRIMARY KEY,
    idStudyPlan NUMBER NOT NULL,
    registrationNumber VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    lastName VARCHAR2(50) NOT NULL,
    phoneNumber VARCHAR2(15) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    address VARCHAR2(100) NOT NULL,
    curp CHAR(18) UNIQUE NOT NULL,
    rfc CHAR(13) UNIQUE NOT NULL,
    nss CHAR(11) UNIQUE NOT NULL,
    idLifeInsurance NUMBER NOT NULL,
    status NUMBER DEFAULT 1 NOT NULL,
    idUserCreate NUMBER NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify NUMBER,
    modifiedDate DATE
);

-- Career
CREATE TABLE Career (
    idCareer NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    description VARCHAR2(100) NOT NULL,
    status NUMBER DEFAULT 1 NOT NULL,
    idUserCreate NUMBER NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify NUMBER,
    modifiedDate DATE
);

-- StudyPlan
CREATE TABLE StudyPlan (
    idStudyPlan NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    code VARCHAR2(10) NOT NULL,
    duration NUMBER NOT NULL,
    credits NUMBER NOT NULL,
    idCareer NUMBER NOT NULL,
    status NUMBER DEFAULT 1 NOT NULL,
    idUserCreate NUMBER NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify NUMBER,
    modifiedDate DATE
);

-- InstitutionalScholarship
CREATE TABLE InstitutionalScholarship (
    idInstitutionalScholarship NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    percentage NUMBER(5, 2) NOT NULL,
    requirements VARCHAR2(100) NOT NULL,
    status NUMBER DEFAULT 1 NOT NULL,
    idUserCreate NUMBER NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify NUMBER,
    modifiedDate DATE
);

-- InternalScholarshipDetails
CREATE TABLE InternalScholarshipDetails (
    idInternalScholarshipDetails NUMBER PRIMARY KEY,
    idInstitutionalScholarship NUMBER NOT NULL,
    idStudent NUMBER NOT NULL,
    semester NUMBER NOT NULL,
    status NUMBER DEFAULT 1 NOT NULL,
    idUserCreate NUMBER NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify NUMBER,
    modifiedDate DATE
);

-- ExternalScholarshipDetails
CREATE TABLE ExternalScholarshipDetails (
    idExternalScholarshipDetails NUMBER PRIMARY KEY,
    idStudent NUMBER NOT NULL,
    idExternalScholarship NUMBER NOT NULL,
    institution VARCHAR2(50) NOT NULL,
    campus VARCHAR2(50) NOT NULL,
    major VARCHAR2(50) NOT NULL,
    semester NUMBER NOT NULL,
    status NUMBER DEFAULT 1 NOT NULL,
    idUserCreate NUMBER NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify NUMBER,
    modifiedDate DATE
);

-- ExternalScholarship
CREATE TABLE ExternalScholarship (
    idExternalScholarship NUMBER PRIMARY KEY,
    scholarshipName VARCHAR2(50) NOT NULL,
    amount NUMBER(10, 2) NOT NULL,
    paymentDate DATE NOT NULL,
    status NUMBER DEFAULT 1 NOT NULL,
    idUserCreate NUMBER NOT NULL,
    creationDate DATE NOT NULL,
    idUserModify NUMBER,
    modifiedDate DATE
);

-- Crear índices
CREATE INDEX IX_InstitutionalScholarship ON InstitutionalScholarship (idInstitutionalScholarship);
CREATE INDEX IX_InternalScholarshipDetails ON InternalScholarshipDetails (idInternalScholarshipDetails);
CREATE INDEX IX_ExternalScholarshipDetails ON ExternalScholarshipDetails (idExternalScholarshipDetails);
CREATE INDEX IX_ExternalScholarship ON ExternalScholarship (idExternalScholarship);
CREATE INDEX IX_Student ON Student (idStudent);

-- Crear restricciones de clave externa
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

-- Insertar datos
INSERT INTO Career (idCareer, name, description)
VALUES (1, 'Ingeniería Informática', 'Ingeniería especializada en computadoras');

INSERT INTO Career (idCareer, name, description)
VALUES (2, 'Ingeniería Mecánica', 'Ingeniería especializada en mantenimiento de motores');
       
INSERT INTO Career (idCareer, name, description)
VALUES (3, 'Ingeniería Electrónica', 'Ingeniería especializada en circuitos de corriente y robótica');
       
INSERT INTO Career (idCareer, name, description)
VALUES (4, 'Ingeniería Gestión Empresarial', 'Ingeniería especializada en organización de una empresa');

INSERT INTO Career (idCareer, name, description)
VALUES (5 ,'Ingeniería Industrial', 'Ingeniería especializada en conocer varias áreas de una empresa');
       
INSERT INTO Career (idCareer, name, description)
VALUES (6, 'Ingeniería en Energías Renovables', 'Ingeniería especializada en cuidar el medio ambiente con tecnología');

INSERT INTO StudyPlan(idStudyPlan, name, code, duration, credits, idCareer,idUserCreate,creationDate)
VALUES (1, 'Ingeniería Informática', 'INFI-2023', 6, 300, 1, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));
       
INSERT INTO StudyPlan(idStudyPlan, name, code, duration, credits, idCareer,idUserCreate,creationDate)
VALUES (2, 'Ingeniería Mecánica', 'INMC-2023', 6, 310, 2, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));
       
INSERT INTO StudyPlan(idStudyPlan, name, code, duration, credits, idCareer,idUserCreate,creationDate)
VALUES (3, 'Ingeniería Electrónica', 'INEL-2023', 6, 290, 3, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));
       
INSERT INTO StudyPlan(idStudyPlan, name, code, duration, credits, idCareer,idUserCreate,creationDate)
VALUES (4, 'Ingeniería Gestión Empresarial', 'INGE-2023', 6, 250, 4, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));

INSERT INTO StudyPlan(idStudyPlan, name, code, duration, credits, idCareer,idUserCreate,creationDate)
VALUES (5, 'Ingeniería Industrial', 'INFI-2023', 5, 320, 5 , 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));
       
INSERT INTO StudyPlan(idStudyPlan, name, code, duration, credits, idCareer,idUserCreate,creationDate)
VALUES (6, 'Ingeniería en Energías Renovables', 'INER-2023', 6, 300, 6, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));

INSERT INTO Student(idStudent, idStudyPlan, registrationNumber, name, lastName, phoneNumber, email, address, curp, rfc, nss, idLifeInsurance, idUserCreate,creationDate)
VALUES (1, 1, 'I20050036','Marisol','Ramos Reyes', '8661753793', 'I20050036@monclova.tecnm.mx', 'Matamoros #351', 'RARM020427MCTMRAS0', 'RARM020427MCT', '24334445412', 2, 2, TO_DATE('2023-10-23', 'YYYY-MM-DD'));
       
INSERT INTO Student(idStudent, idStudyPlan, registrationNumber, name, lastName, phoneNumber, email, address, curp, rfc, nss, idLifeInsurance, idUserCreate,creationDate)
VALUES (2, 2, 'I20050033','Pablo Armando','Ramirez Ortiz', '8663458734', 'I20050033@monclova.tecnm.mx', 'Constitución #959', 'RMOP0209HCLPRKO2', 'RMOP0209HCL', '45353453886', 3, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));
	   
INSERT INTO Student(idStudent, idStudyPlan, registrationNumber, name, lastName, phoneNumber, email, address, curp, rfc, nss, idLifeInsurance, idUserCreate,creationDate)
VALUES (3, 3, 'I18003230','Yael Jesús','Reyes Martinez', '8661283495', 'I18003230@monclova.tecnm.mx', 'Serafin Cantu #521', 'REMY000712HCLYRLA0', 'REMY000712HCL', '00548653846', 1, 2, TO_DATE('2023-10-23', 'YYYY-MM-DD'));

INSERT INTO ExternalScholarship(idExternalScholarship, scholarshipName, amount, paymentDate, idUserCreate, creationDate)
VALUES (1, 'Tecnologico de campus Monclova',1300.00 ,TO_DATE('2023-10-31', 'YYYY-MM-DD'), 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));

INSERT INTO InstitutionalScholarship (idInstitutionalScholarship, name, percentage, requirements, idUserCreate, creationDate)
VALUES (1, 'Beca Institucional', 75.00, 'Para alumnos de promedio igual o mayor de 90', 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));

INSERT INTO InstitutionalScholarship (idInstitutionalScholarship, name, percentage, requirements, idUserCreate, creationDate)
VALUES (2, 'Beca de Orfandad', 50.00, 'Para alumnos que necesiten una beca', 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));

INSERT INTO InstitutionalScholarship (idInstitutionalScholarship, name, percentage, requirements, idUserCreate, creationDate)
VALUES (3, 'Beca por parentesco', 20.00, 'Para los alumnos que tienen un familiar trabajando en la institución ', 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));

INSERT INTO InternalScholarshipDetails (idInternalScholarshipDetails, idInstitutionalScholarship, idStudent, semester, idUserCreate, creationDate)
VALUES (1, 1, 1, 1, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));
       
INSERT INTO InternalScholarshipDetails (idInternalScholarshipDetails, idInstitutionalScholarship, idStudent, semester, idUserCreate, creationDate)
VALUES (2, 2, 2, 2, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));
	   
INSERT INTO InternalScholarshipDetails (idInternalScholarshipDetails, idInstitutionalScholarship, idStudent, semester, idUserCreate, creationDate)
VALUES (3, 3, 3, 3, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));

INSERT INTO ExternalScholarshipDetails (idExternalScholarshipDetails, idStudent, idExternalScholarship, institution, campus, major, semester, idUserCreate, creationDate)
VALUES (1, 1, 1, 'Instituto Tecnologico Superior de México', 'campus Monclova', 'Ing Industrial',7, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));

INSERT INTO ExternalScholarshipDetails (idExternalScholarshipDetails, idStudent, idExternalScholarship, institution, campus, major, semester, idUserCreate, creationDate)
VALUES (2, 2, 2, 'Instituto Tecnologico Superior de México', 'campus Monclova', 'Ing Mecanica',5, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));

INSERT INTO ExternalScholarshipDetails (idExternalScholarshipDetails, idStudent, idExternalScholarship, institution, campus, major, semester, idUserCreate, creationDate)
VALUES (3, 3, 3, 'Instituto Tecnologico Superior de México', 'campus Monclova', 'Ing Informatica', 3, 1, TO_DATE('2023-10-23', 'YYYY-MM-DD'));
