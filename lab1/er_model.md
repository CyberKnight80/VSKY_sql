# Laboratory Work №1

## ER Model

### Entities and Their Attributes

#### Patient
- **Primary Key**: `PatientID` (INT)  
- **Attributes**:
  - `Name` (VARCHAR(100), NOT NULL)
  - `DateOfBirth` (DATE, NOT NULL)
  - `Gender` (CHAR(1), NOT NULL)
  - `Address` (VARCHAR(255), NULL)
  - `Phone` (VARCHAR(15), NULL)

#### Doctor
- **Primary Key**: `DoctorID` (INT)  
- **Attributes**:
  - `Name` (VARCHAR(100), NOT NULL)
  - `Specialization` (VARCHAR(100), NOT NULL)
  - `Phone` (VARCHAR(15), NULL)
  - `Email` (VARCHAR(100), NULL)

#### Ward
- **Primary Key**: `WardID` (INT)  
- **Attributes**:
  - `WardNumber` (INT, NOT NULL)
  - `Capacity` (INT, NOT NULL)

#### Hospitalization
- **Primary Key**: `HospitalizationID` (INT)  
- **Attributes**:
  - `PatientID` (INT, NOT NULL, FOREIGN KEY)
  - `DoctorID` (INT, NOT NULL, FOREIGN KEY)
  - `WardID` (INT, NOT NULL, FOREIGN KEY)
  - `AdmissionDate` (DATE, NOT NULL)
  - `DischargeDate` (DATE, NULL)

### Relationships Between Entities

#### Patient - Hospitalization
- **Relationship Type**: 1:M  
  - One patient can have multiple hospitalizations.
- **Mandatory**: 
  - Mandatory on the Hospitalization side (each hospitalization must be linked to a patient).

#### Doctor - Hospitalization
- **Relationship Type**: 1:M  
  - One doctor can be responsible for multiple hospitalizations.
- **Mandatory**: 
  - Mandatory on the Hospitalization side (each hospitalization must be linked to a doctor).

#### Ward - Hospitalization
- **Relationship Type**: 1:M  
  - One ward can contain multiple hospitalizations.
- **Mandatory**: 
  - Mandatory on the Hospitalization side (each hospitalization must be linked to a ward).

---

## Relational Data Model

Based on the ER model, the relational data model is represented as tables with attributes and keys:

### Patient
| Attribute         | Data Type           | Constraints       |
|--------------------|---------------------|-------------------|
| `PatientID`       | INT                 | PRIMARY KEY       |
| `Name`            | VARCHAR(100)        | NOT NULL          |
| `DateOfBirth`     | DATE                | NOT NULL          |
| `Gender`          | CHAR(1)             | NOT NULL          |
| `Address`         | VARCHAR(255)        | NULL              |
| `Phone`           | VARCHAR(15)         | NULL              |

### Doctor
| Attribute         | Data Type           | Constraints       |
|--------------------|---------------------|-------------------|
| `DoctorID`        | INT                 | PRIMARY KEY       |
| `Name`            | VARCHAR(100)        | NOT NULL          |
| `Specialization`  | VARCHAR(100)        | NOT NULL          |
| `Phone`           | VARCHAR(15)         | NULL              |
| `Email`           | VARCHAR(100)        | NULL              |

### Ward
| Attribute         | Data Type           | Constraints       |
|--------------------|---------------------|-------------------|
| `WardID`          | INT                 | PRIMARY KEY       |
| `WardNumber`      | INT                 | NOT NULL          |
| `Capacity`        | INT                 | NOT NULL          |

### Hospitalization
| Attribute         | Data Type           | Constraints                              |
|--------------------|---------------------|------------------------------------------|
| `HospitalizationID` | INT               | PRIMARY KEY                              |
| `PatientID`       | INT                 | NOT NULL, FOREIGN KEY REFERENCES `Patient(PatientID)` |
| `DoctorID`        | INT                 | NOT NULL, FOREIGN KEY REFERENCES `Doctor(DoctorID)` |
| `WardID`          | INT                 | NOT NULL, FOREIGN KEY REFERENCES `Ward(WardID)` |
| `AdmissionDate`   | DATE                | NOT NULL                                |
| `DischargeDate`   | DATE                | NULL                                    |

