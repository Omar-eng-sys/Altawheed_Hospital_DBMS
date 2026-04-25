-- ============================================================
-- Project: Al-Tawheed Charity Hospital Information System
-- Phase 2: SQL Implementation (DDL & DML)
-- Team Leader: Omar Nasser
-- ============================================================

-- ============================================================
-- [2] MODULE 1: HR & ADMINISTRATION (Muhammad Ragab)
-- Entities: Department, Doctors, Nurse, Pharmacist, Receptionist + Phones
-- ============================================================

-- Create Department Table first (Parent for all staff)
CREATE TABLE Department (
    Dept_ID     VARCHAR2(3) PRIMARY KEY,
    Name        VARCHAR2(100) NOT NULL,
    Location    VARCHAR2(50),
    M_NID       VARCHAR2(14),  -- Manager NID (FK to Doctors added later via ALTER)
    M_Start_Date DATE
);

CREATE TABLE Doctors (
    NID              VARCHAR2(14) PRIMARY KEY,
    Name             VARCHAR2(100) NOT NULL,
    Consultation_Fee NUMBER(8,2),
    License_Number   VARCHAR2(20) NOT NULL,
    Year_of_Experience NUMBER(2),
    Salary           NUMBER(10,2),
    Schedule         VARCHAR2(50),
    Specialty        VARCHAR2(50),
    Dept_ID          VARCHAR2(3) REFERENCES Department
);

-- Department: Manager NID -> Doctors
ALTER TABLE Department MODIFY (
  M_NID REFERENCES Doctors(NID)
  );

CREATE TABLE Nurse (
    NID     VARCHAR2(14) PRIMARY KEY,
    Name    VARCHAR2(100) NOT NULL,
    Schedule VARCHAR2(50),
    Salary  NUMBER(10,2),
    Dept_ID VARCHAR2(3) REFERENCES Department,
    D_NID   VARCHAR2(14) REFERENCES Doctors
);

CREATE TABLE Pharmacist (
    NID     VARCHAR2(14) PRIMARY KEY,
    Name    VARCHAR2(100) NOT NULL,
    Schedule VARCHAR2(50),
    Salary  NUMBER(10,2),
    Dept_ID VARCHAR2(3) REFERENCES Department
);

CREATE TABLE Receptionist (
    NID     VARCHAR2(14) PRIMARY KEY,
    Name    VARCHAR2(100) NOT NULL,
    Schedule VARCHAR2(50),
    Salary  NUMBER(10,2)
);

CREATE TABLE Dr_Phone (
    Phone  VARCHAR2(15),
    D_NID  VARCHAR2(14) REFERENCES Doctors,
    PRIMARY KEY (Phone, D_NID)
);

CREATE TABLE Nu_Phone (
    Phone   VARCHAR2(15),
    Nu_NID  VARCHAR2(14) REFERENCES Nurse,
    PRIMARY KEY (Phone, Nu_NID)
);

CREATE TABLE Ph_Phone (
    Phone   VARCHAR2(15),
    Ph_NID  VARCHAR2(14) REFERENCES Pharmacist,
    PRIMARY KEY (Phone, Ph_NID)
);

CREATE TABLE Rs_Phone (
    Phone   VARCHAR2(15),
    Rs_NID  VARCHAR2(14) REFERENCES Receptionist,
    PRIMARY KEY (Phone, Rs_NID)
);

-- ============================================================
-- [3] MODULE 2: PATIENT RECORDS (Omar Nasser)
-- Entities: Patient, Dependent, Insurance, Medical_History + Details
-- ============================================================

-- Create Insurance table first
CREATE TABLE Insurance (
    Policy_No   VARCHAR2(50) PRIMARY KEY,
    Company     VARCHAR2(100),
    Cov_Limit   NUMBER(10,2),
    Cov_Type    VARCHAR2(50),
    Expiry_Date DATE
);

-- TODO: Add Patient table (References Insurance, Receptionist, Dept)
CREATE TABLE Patient (
    Pat_NID    VARCHAR2(14) PRIMARY KEY,
    Name       VARCHAR2(100) NOT NULL,
    Gender     VARCHAR2(1)   NOT NULL,
    DOB        DATE,
    Ins_Policy VARCHAR2(50)  REFERENCES Insurance(Policy_No),
    Rec_ID     VARCHAR2(14),  -- Receptionist ID (FK to Receptionist added later via ALTER)
    Dept_ID    VARCHAR2(3)   REFERENCES Department(Dept_ID)
);

-- TODO: Add Weak Entities (Dependent, Medical_History)
CREATE TABLE Medical_History (
    Record_No  VARCHAR2(20) PRIMARY KEY,
    Pat_NID    VARCHAR2(14) REFERENCES Patient(Pat_NID),
    Smoking_st VARCHAR2(20),
    Blood_Type VARCHAR2(5)
);

CREATE TABLE Dependent (
    Pat_NID  VARCHAR2(14) REFERENCES Patient(Pat_NID),
    Dep_Name VARCHAR2(100),
    Relation VARCHAR2(30),
    PRIMARY KEY (Pat_NID, Dep_Name)
);

-- TODO: Add M:N Tables, multivalues (Appointment, Refers, Phones, chronic diseases, etc.)
CREATE TABLE Patient_Phone (
    Pat_NID VARCHAR2(14) REFERENCES Patient(Pat_NID),
    Phone   VARCHAR2(15),
    PRIMARY KEY (Pat_NID, Phone)
);

CREATE TABLE Dep_Phone (
    Pat_NID  VARCHAR2(14) REFERENCES Patient(Pat_NID),
    Dep_Name VARCHAR2(100),
    Phone    VARCHAR2(15),
    PRIMARY KEY (Pat_NID, Dep_Name, Phone)
);

CREATE TABLE Chronic_Diseases (
    Pat_NID   VARCHAR2(14) REFERENCES Patient(Pat_NID),
    Record_No VARCHAR2(20) REFERENCES Medical_History(Record_No),
    Disease   VARCHAR2(100),
    PRIMARY KEY (Pat_NID, Record_No, Disease)
);

CREATE TABLE Allergies (
    Pat_NID   VARCHAR2(14) REFERENCES Patient(Pat_NID),
    Record_No VARCHAR2(20) REFERENCES Medical_History(Record_No),
    Allergy   VARCHAR2(100),
    PRIMARY KEY (Pat_NID, Record_No, Allergy)
);

CREATE TABLE Past_Surgeries (
    Pat_NID   VARCHAR2(14) REFERENCES Patient(Pat_NID),
    Record_No VARCHAR2(20) REFERENCES Medical_History(Record_No),
    Surgery   VARCHAR2(100),
    PRIMARY KEY (Pat_NID, Record_No, Surgery)
);

CREATE TABLE Current_Medication (
    Pat_NID    VARCHAR2(14) REFERENCES Patient(Pat_NID),
    Record_No  VARCHAR2(20) REFERENCES Medical_History(Record_No),
    Medication VARCHAR2(100),
    PRIMARY KEY (Pat_NID, Record_No, Medication)
);

CREATE TABLE Appointment (
    Pat_NID    VARCHAR2(14) REFERENCES Patient(Pat_NID),
    Doctor_NID VARCHAR2(14),  -- FK to Doctors added later via ALTER
    Appt_Date  DATE,
    Appt_Time  VARCHAR2(10),
    Status     VARCHAR2(20),
    Visit_Type VARCHAR2(30),
    Priority   VARCHAR2(20),
    Queue_No   NUMBER(4,0),
    PRIMARY KEY (Pat_NID, Doctor_NID, Appt_Date)
);

CREATE TABLE Refers (
    Pat_NID    VARCHAR2(14) REFERENCES Patient(Pat_NID),
    Doctor_NID VARCHAR2(14),  -- FK to Doctors added later via ALTER
    Dept_ID    VARCHAR2(3)   REFERENCES Department(Dept_ID),
    Reason     VARCHAR2(200),
    Urgency    VARCHAR2(20),
    PRIMARY KEY (Pat_NID, Doctor_NID, Dept_ID)
);


-- ============================================================
-- [4] MODULE 3: CLINIC & SURGERY (Ahmad Ayman)
-- Entities: Room, Surgery + M:N Relations
-- ============================================================

-- TODO: Add Room and Surgery base tables
CREATE TABLE Room (
    Room_No   VARCHAR2(5)  PRIMARY KEY,
    Room_Type VARCHAR2(30) NOT NULL,
    Floor     VARCHAR2(5)  NOT NULL
);

CREATE TABLE Surgery (
    Surg_Name    VARCHAR2(100) PRIMARY KEY,
    Cost         NUMBER(8,2)  NOT NULL,
    Expected_Dur NUMBER(4,0)  NOT NULL
);

-- TODO: Add Relation tables (Held_In, Admitted_To, Undergoes, etc.)
CREATE TABLE Held_In (
    Surg_Name VARCHAR2(100),
    Room_No   VARCHAR2(5),
    PRIMARY KEY (Surg_Name, Room_No),
    FOREIGN KEY (Surg_Name) REFERENCES Surgery(Surg_Name),
    FOREIGN KEY (Room_No)   REFERENCES Room(Room_No)
);

CREATE TABLE Admitted_To (
    Room_No  VARCHAR2(5),
    Pat_NID  VARCHAR2(14),
    Date_In  DATE NOT NULL,
    Date_Out DATE,
    PRIMARY KEY (Room_No, Pat_NID),
    FOREIGN KEY (Room_No)  REFERENCES Room(Room_No),
    FOREIGN KEY (Pat_NID)  REFERENCES Patient(Pat_NID)
);

CREATE TABLE Supervises_Room (
    Room_No VARCHAR2(5),
    Nur_NID VARCHAR2(14),  -- FK to Nurse added later via ALTER
    PRIMARY KEY (Room_No, Nur_NID),
    FOREIGN KEY (Room_No) REFERENCES Room(Room_No)
);

CREATE TABLE Undergoes (
    Surg_Name VARCHAR2(100),
    Pat_NID   VARCHAR2(14),
    Surg_Date DATE        NOT NULL,
    Outcome   VARCHAR2(100),
    PRIMARY KEY (Surg_Name, Pat_NID, Surg_Date),
    FOREIGN KEY (Surg_Name) REFERENCES Surgery(Surg_Name),
    FOREIGN KEY (Pat_NID)   REFERENCES Patient(Pat_NID)
);

CREATE TABLE Participates_In (
    Surg_Name VARCHAR2(100),
    Nur_NID   VARCHAR2(14),  -- FK to Nurse added later via ALTER
    PRIMARY KEY (Surg_Name, Nur_NID),
    FOREIGN KEY (Surg_Name) REFERENCES Surgery(Surg_Name)
);

CREATE TABLE Performs (
    Surg_Name VARCHAR2(100),
    Doc_NID   VARCHAR2(14),  -- FK to Doctors added later via ALTER
    PRIMARY KEY (Surg_Name, Doc_NID),
    FOREIGN KEY (Surg_Name) REFERENCES Surgery(Surg_Name)
);


-- ============================================================
-- [5] MODULE 4: PHARMACY (Muhammad Ali)
-- Entities: Medicine + Pharmacy Relations
-- ============================================================

-- TODO: Add Medicine table
CREATE TABLE Medicine (
    Med_Name     VARCHAR2(100) PRIMARY KEY,
    Active_Ing   VARCHAR2(100),
    Price        NUMBER(8,2),
    Form       VARCHAR2(50),
    Manufacturer VARCHAR2(100),
    Stok_Qty     NUMBER(6,0)
);

-- TODO: Add Prescription (Ternary), Dispenses, Inventories
CREATE TABLE Prescription (
    Med_Name    VARCHAR2(100) REFERENCES Medicine,
    Doc_NID     VARCHAR2(14),  -- FK to Doctors added later via ALTER
    Pat_NID     VARCHAR2(14)  REFERENCES Patient(Pat_NID),
    Date_Issued DATE,
    Dosage      VARCHAR2(50),
    Frequency   VARCHAR2(50),
    Duration    VARCHAR2(50),
    PRIMARY KEY (Med_Name, Doc_NID, Pat_NID)
);

CREATE TABLE Dispenses (
    Med_Name     VARCHAR2(100) REFERENCES Medicine,
    Phar_NID     VARCHAR2(14),  -- FK to Pharmacist added later via ALTER
    Pat_NID      VARCHAR2(14)  REFERENCES Patient(Pat_NID),
    Dispense_Date DATE,
    Quantity     NUMBER(6,0),
    PRIMARY KEY (Med_Name, Phar_NID, Pat_NID)
);

CREATE TABLE Inventories (
    Med_Name  VARCHAR2(100) REFERENCES Medicine,
    Phar_NID  VARCHAR2(14),  -- FK to Pharmacist added later via ALTER
    Stock_Mng VARCHAR2(100),
    PRIMARY KEY (Med_Name, Phar_NID)
);

-- ============================================================
-- [6] MODULE 5: LABS, RADIOLOGY & BILLING (Nader Saleh)
-- Entities: Lab_Test, Radiology_Scan, Invoice + Results
-- ============================================================

-- TODO: Add Lab_Test, Radiology_Scan, Invoice tables
CREATE TABLE Lab_Test (
    Test_Name     VARCHAR2(100) PRIMARY KEY,
    Sample_Type   VARCHAR2(50),
    Turnaround_Hr NUMBER(4,1),
    Cost          NUMBER(8,2),
    Dept_ID       VARCHAR2(3)  REFERENCES Department(Dept_ID)
);

CREATE TABLE Radiology_Scan (
    Scan_Name VARCHAR2(100) PRIMARY KEY,
    Cost      NUMBER(8,2),
    Dept_ID   VARCHAR2(3)  REFERENCES Department(Dept_ID)
);

CREATE TABLE Invoice (
    Invoice_No VARCHAR2(50) PRIMARY KEY,
    Issue_Date DATE,
    Status     VARCHAR2(50),
    Pay_Method VARCHAR2(50),
    Total_Amt  NUMBER(10,2),
    Amt_Paid   NUMBER(10,2),
    Rec_NID    VARCHAR2(14),  -- FK from Receptionist added later via ALTER
    Policy_No  VARCHAR2(50)  REFERENCES Insurance(Policy_No),
    Pat_NID    VARCHAR2(14)  REFERENCES Patient(Pat_NID)
);

-- TODO: Add Result and Invoice mapping tables
CREATE TABLE Test_Result (
    Test_Name VARCHAR2(100) REFERENCES Lab_Test(Test_Name),
    Pat_NID   VARCHAR2(14)  REFERENCES Patient(Pat_NID),
    PRIMARY KEY (Test_Name, Pat_NID)
);

CREATE TABLE Scan_Result (
    Scan_Name VARCHAR2(100) REFERENCES Radiology_Scan(Scan_Name),
    Pat_NID   VARCHAR2(14)  REFERENCES Patient(Pat_NID),
    PRIMARY KEY (Scan_Name, Pat_NID)
);

CREATE TABLE Radiology_Scan_Invoice (
    Scan_Name  VARCHAR2(100) REFERENCES Radiology_Scan(Scan_Name),
    Invoice_No VARCHAR2(50)  REFERENCES Invoice(Invoice_No),
    PRIMARY KEY (Scan_Name, Invoice_No)
);

CREATE TABLE Invoice_Lab_Test (
    Test_Name  VARCHAR2(100) REFERENCES Lab_Test(Test_Name),
    Invoice_No VARCHAR2(50)  REFERENCES Invoice(Invoice_No),
    PRIMARY KEY (Test_Name, Invoice_No)
);

-- ============================================================
-- [7] FINAL CONSTRAINTS (ALTER TABLE)
-- Add Foreign Keys that reference tables across different modules
-- ============================================================

-- Patient: Receptionist ID -> Receptionist
ALTER TABLE Patient MODIFY (Rec_ID REFERENCES Receptionist(NID));

-- Appointment: Doctor NID -> Doctors
ALTER TABLE Appointment MODIFY (Doctor_NID REFERENCES Doctors(NID));

-- Refers: Doctor NID -> Doctors
ALTER TABLE Refers MODIFY (Doctor_NID REFERENCES Doctors(NID));

-- Supervises_Room: Nurse NID -> Nurse
ALTER TABLE Supervises_Room MODIFY (Nur_NID REFERENCES Nurse(NID));

-- Participates_In: Nurse NID -> Nurse
ALTER TABLE Participates_In MODIFY (Nur_NID REFERENCES Nurse(NID));

-- Performs: Doctor NID -> Doctors
ALTER TABLE Performs MODIFY (Doc_NID REFERENCES Doctors(NID));

-- Prescription: Doctor NID -> Doctors
ALTER TABLE Prescription MODIFY (Doc_NID REFERENCES Doctors(NID));

-- Dispenses: Pharmacist NID -> Pharmacist
ALTER TABLE Dispenses MODIFY (Phar_NID REFERENCES Pharmacist(NID));

-- Inventories: Pharmacist NID -> Pharmacist
ALTER TABLE Inventories MODIFY (Phar_NID REFERENCES Pharmacist(NID));

-- Invoice: Receptionist NID -> Receptionist
ALTER TABLE Invoice MODIFY (Rec_NID REFERENCES Receptionist(NID));


COMMIT;
-- END OF TEMPLATE