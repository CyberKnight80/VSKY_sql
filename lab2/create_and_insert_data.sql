-- Drop the schema and all objects in it
DROP SCHEMA public CASCADE;

-- Recreate the schema
CREATE SCHEMA public;

-- Create tables
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender CHAR(1) NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(15)
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Ward (
    WardID INT PRIMARY KEY,
    WardNumber INT NOT NULL,
    Capacity INT NOT NULL
);

CREATE TABLE Hospitalization (
    HospitalizationID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    WardID INT NOT NULL,
    AdmissionDate DATE NOT NULL,
    DischargeDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (WardID) REFERENCES Ward(WardID)
);

-- Заполнение таблицы Patient
INSERT INTO Patient (PatientID, Name, DateOfBirth, Gender, Address, Phone) VALUES
(1, 'John Doe', '1985-06-15', 'M', '123 Elm St, Springfield', '123-456-7890'),
(2, 'Jane Smith', '1990-02-25', 'F', '456 Oak St, Springfield', '987-654-3210'),
(3, 'Emily Johnson', '1975-11-10', 'F', '789 Maple St, Springfield', '555-123-4567'),
(4, 'Michael Brown', '2000-03-12', 'M', '321 Pine St, Springfield', '444-555-6666');

-- Заполнение таблицы Doctor
INSERT INTO Doctor (DoctorID, Name, Specialization, Phone, Email) VALUES
(1, 'Dr. Alice Cooper', 'Cardiology', '222-333-4444', 'acooper@example.com'),
(2, 'Dr. Bob Ross', 'Neurology', '333-444-5555', 'bross@example.com'),
(3, 'Dr. Clara Oswald', 'Pediatrics', '444-555-6666', 'coswald@example.com'),
(4, 'Dr. David Tennant', 'Orthopedics', '555-666-7777', 'dtennant@example.com');

-- Заполнение таблицы Ward
INSERT INTO Ward (WardID, WardNumber, Capacity) VALUES
(1, 101, 4),
(2, 102, 6),
(3, 103, 2),
(4, 104, 3);

-- Заполнение таблицы Hospitalization
INSERT INTO Hospitalization (HospitalizationID, PatientID, DoctorID, WardID, AdmissionDate, DischargeDate) VALUES
(1, 1, 1, 1, '2024-11-01', '2024-11-10'),
(2, 2, 2, 2, '2024-11-05', NULL),
(3, 3, 3, 3, '2024-10-25', '2024-11-05'),
(4, 4, 4, 4, '2024-11-15', NULL);
