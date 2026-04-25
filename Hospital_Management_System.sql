-- ============================================================
-- Project: Al-Tawheed Charity Hospital Information System
-- Phase 2: SQL Implementation (DDL & DML)
-- Team Leader: Omar Nasser
-- ============================================================

-- [1] CLEANUP SECTION 
-- Note: Tables are dropped in reverse order of creation to avoid constraint violations.
-- DROP TABLE Table_Name CASCADE CONSTRAINTS;

-- ============================================================
-- [2] MODULE 1: HR & ADMINISTRATION (Muhammad Ragab)
-- Entities: Department, Doctors, Nurse, Pharmacist, Receptionist + Phones
-- ============================================================

-- Create Department Table first (Parent for all staff)
CREATE TABLE Department (
    Dept_ID     VARCHAR2(3) PRIMARY KEY,
    Name        VARCHAR2(100) NOT NULL,
    Location    VARCHAR2(50),
    M_NID       VARCHAR2(14), -- Manager ID (FK to Doctors added later via ALTER)
    M_Start_Date DATE
);

-- TODO: Add Doctors, Nurse, Pharmacist, Receptionist tables here
-- TODO: Add Multivalued Phone tables (Dr_Phone, Nu_Phone, etc.)


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
CREATE TABLE PATIENT(
    Pat_NID varchar2(14) primary key ,
    Name varchar2(100) NOT NULL ,
    Gender varchar2(1) NOT NULL ,
    DOB DATE ,
    Ins_Policy varchar2(50) REFERENCES Insurance(Policy_No),
    Rec_ID varchar2(14) , -- Receptionist ID (FK to Receptionist added later via ALTER)
    Dept_ID varchar2(3) REFERENCES Department(Dept_ID)
  );

-- TODO: Add Weak Entities (Dependent, Medical_History)
CREATE TABLE MEDICAL_HISTORY(
    Record_No varchar2(20) primary key ,
    Pat_NID varchar2(14) REFERENCES PATIENT(Pat_NID),
    Smoking_st varchar2(20) ,
    Blood_Type varchar2(5)
  );

CREATE TABLE DEPENDENT(
    Pat_NID varchar2(14) references Patient(Pat_NID),
    Dep_Name varchar2(100) ,
    Relation varchar2(30) ,
    Primary key (Pat_NID , Dep_Name)
  );

-- TODO: Add M:N Tables , multivalues (Appointment, Refers , Phones , chronic deseases, etc.)
CREATE TABLE Patient_Phone(
    Pat_NID varchar2(14) REFERENCES Patient(Pat_NID) ,
    phone varchar2(15) ,
    primary key (Pat_NID , phone)
  );

CREATE TABLE Dep_phone(
    Pat_NID varchar2(14) references Patient(Pat_NID),
    Dep_Name varchar2(100) ,
    phone varchar2(15) ,
    Primary key (Pat_NID , Dep_Name , phone)
  );

CREATE TABLE Chronic_Diseases(
    Pat_NID varchar2(14) references patient(Pat_NID) ,
    Record_No varchar2(20) references Medical_History(Record_No),
    Disease varchar2(100) ,
    Primary key (Pat_NID ,Record_No , Disease)
  );

CREATE TABLE Allergies(
    Pat_NID varchar2(14) references patient(Pat_NID) ,
    Record_No varchar2(20) references Medical_History(Record_No),
    Allergy varchar2(100) ,
    Primary key (Pat_NID ,Record_No , Allergy)
  );

CREATE TABLE Past_Surgeries(
    Pat_NID varchar2(14) references patient(Pat_NID) ,
    Record_No varchar2(20) references Medical_History(Record_No),
    Surgery varchar2(100) ,
    Primary key (Pat_NID ,Record_No , surgery)
  );

CREATE TABLE Current_Medication (
    Pat_NID varchar2(14) references patient(Pat_NID) ,
    Record_No varchar2(20) references Medical_History(Record_No),
    Medication varchar2(100) ,
    PRIMARY KEY (Pat_NID, Record_No, Medication)
    );

CREATE TABLE Appointment(
    Pat_NID varchar2(14) references patient(Pat_NID) ,
    Doctor_NID varchar2(14), -- FK to Doctors added later via ALTER
    Appt_Date Date ,
    Appt_time varchar2(10) ,
    Status varchar2(20) ,
    Visit_Type varchar2(30) ,
    Priority varchar2(20) ,
    Queue_No number(4,0) ,
   Primary key (Pat_NID , Doctor_NID , Appt_Date )
  );

Create table Refers(
    Pat_NID varchar2(14) references Patient(Pat_NID) ,
    Doctor_NID varchar2(14) , -- FK to Doctors added later via ALTER
    Dept_ID varchar2(3) REFERENCES Department(Dept_ID) ,
    Reason varchar2(200) ,
    Urgency varchar2(20) ,
    Primary key ( Pat_NID , Doctor_NID , Dept_ID )
  );


-- ============================================================
-- [4] MODULE 3: CLINIC & SURGERY (Ahmad Ayman)
-- Entities: Room, Surgery + M:N Relations
-- ============================================================

-- TODO: Add Room and Surgery base tables
CREATE TABLE Room (
    Room_No VARCHAR2(5) PRIMARY KEY,
    Room_Type VARCHAR2(30) NOT NULL,
    Floor VARCHAR2(5) NOT NULL
);

CREATE TABLE Surgery (
    Surg_Name VARCHAR2(100) PRIMARY KEY,
    Cost NUMBER(8,2) NOT NULL,
    Expected_Dur NUMBER(4,0) NOT NULL
);
-- TODO: Add Relation tables (Held_In, Admitted_To, Undergoes, etc.)
CREATE TABLE Held_In (
    Surg_Name VARCHAR2(100),
    Room_No VARCHAR2(5),
    PRIMARY KEY (Surg_Name, Room_No),
    FOREIGN KEY (Surg_Name) REFERENCES Surgery(Surg_Name),
    FOREIGN KEY (Room_No) REFERENCES Room(Room_No)
);

CREATE TABLE Admitted_To (
    Room_No VARCHAR2(5),
    Pat_NID VARCHAR2(14),
    Date_In DATE NOT NULL,
    Date_Out DATE,
    PRIMARY KEY (Room_No, Pat_NID),
    FOREIGN KEY (Room_No) REFERENCES Room(Room_No),
    FOREIGN KEY (Pat_NID) REFERENCES Patient(Pat_NID)
);

CREATE TABLE Supervises_Room (
    Room_No VARCHAR2(5),
    Nur_NID VARCHAR2(14), -- FK to Nurse added later via ALTER
    PRIMARY KEY (Room_No, Nur_NID),
    FOREIGN KEY (Room_No) REFERENCES Room(Room_No)
);

CREATE TABLE Undergoes (
    Surg_Name VARCHAR2(100),
    Pat_NID VARCHAR2(14),
    Surg_Date DATE NOT NULL,
    Outcome VARCHAR2(100),
    PRIMARY KEY (Surg_Name, Pat_NID , Surg_Date),
    FOREIGN KEY (Surg_Name) REFERENCES Surgery(Surg_Name),
    FOREIGN KEY (Pat_NID) REFERENCES Patient(Pat_NID)
);

CREATE TABLE Participates_In (
    Surg_Name VARCHAR2(100),
    Nur_NID VARCHAR2(14), -- FK to Nurse added later via ALTER
    PRIMARY KEY (Surg_Name, Nur_NID),
    FOREIGN KEY (Surg_Name) REFERENCES Surgery(Surg_Name)
);

CREATE TABLE Performs (
    Surg_Name VARCHAR2(100),
    Doc_NID VARCHAR2(14), -- FK to Doctors added later via ALTER
    PRIMARY KEY (Surg_Name, Doc_NID),
    FOREIGN KEY (Surg_Name) REFERENCES Surgery(Surg_Name)
);
-- ============================================================
-- [5] MODULE 4: PHARMACY (Muhammad Ali)
-- Entities: Medicine + Pharmacy Relations
-- ============================================================

-- TODO: Add Medicine table
-- TODO: Add Prescription (Ternary), Dispenses, Inventories


-- ============================================================
-- [6] MODULE 5: LABS, RADIOLOGY & BILLING (Nader Saleh)
-- Entities: Lab_Test, Radiology_Scan, Invoice + Results
-- ============================================================

-- TODO: Add Lab_Test, Radiology_Scan, Invoice tables
-- TODO: Add Result and Invoice mapping tables


-- ============================================================
-- [7] FINAL CONSTRAINTS (ALTER TABLE)
-- Add Foreign Keys that reference tables across different modules
-- ============================================================

-- Example: Linking Department Manager back to Doctors
-- ALTER TABLE Department ADD CONSTRAINT fk_dept_manager 
-- FOREIGN KEY (M_NID) REFERENCES Doctors(NID);

COMMIT;
-- END OF TEMPLATE