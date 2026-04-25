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
    Location    VARCHAR2(50) ,
    M_NID       VARCHAR2(14) , -- Manager NID (FK to Doctors added later via ALTER)
    M_Start_Date DATE
);

CREATE TABLE Doctors (
    NID         VARCHAR2(14) PRIMARY KEY,
    Name        VARCHAR2(100) NOT NULL,
    Consultation_Fee NUMBER(8,2),
    License_Number VARCHAR2(20) NOT NULL,
    Year_of_Experience NUMBER(2),
    Salary      NUMBER(10,2),
    Schedule    Varchar2(50),
    Specialty   Varchar2(50)
    Dept_ID     Varchar2(3) REFERENCES Department
);


CREATE TABLE Nurse (
    NID         VARCHAR2(14) PRIMARY KEY,
    Name        VARCHAR2(100) NOT NULL,
    Schedule    VARCHAR2(50),
    Salary      NUMBER(10,2),
    Dept_ID     Varchar2(3) REFERENCES Department,
    D_NID       VARCHAR2(14) REFERENCES Doctors 
);

CREATE TABLE Pharmacist (
    NID         VARCHAR2(14) PRIMARY KEY,
    Name        VARCHAR2(100) NOT NULL,
    Schedule    VARCHAR2(50),
    Salary      NUMBER(10,2),
    Dept_ID     VARCHAR2(3) REFERENCES Department
);

CREATE TABLE Receptionist (
    NID         VARCHAR2(14) PRIMARY KEY,
    Name        VARCHAR2(100) NOT NULL,
    Schedule    VARCHAR2(50),
    Salary      NUMBER(10,2)
);

CREATE TABLE Dr_Phone (
    Phone       VARCHAR2(15),
    D_NID       VARCHAR2(14) REFERENCES Doctors,
    PRIMARY KEY(Phone,D_NID)
);

CREATE TABLE Nu_Phone (
    Phone       VARCHAR2(15),
    Nu_NID       VARCHAR2(14) REFERENCES Nurse,
    PRIMARY KEY(Phone,D_NID)
);

CREATE TABLE Ph_Phone (
    Phone       VARCHAR2(15),
    Ph_NID       VARCHAR2(14) REFERENCES Pharmacist,
    PRIMARY KEY(Phone,D_NID)
);

CREATE TABLE Rs_Phone (
    Phone       VARCHAR2(15),
    Rs_NID       VARCHAR2(14) REFERENCES Receptionist,
    PRIMARY KEY(Phone,D_NID)
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
 create table Medicine(Med_Name varchar2(100) primary key
 ,Active_Ing varchar2(100)
 ,Price Number(8,2)
 ,"Form" varchar2(50)
  , Manufacturer varchar2(100) ,
  Stok_Qty Number(6,0));
-- TODO: Add Prescription (Ternary), Dispenses, Inventories
create table Prescription(Med_Name varchar(100) references Medicine ,
 Doc_NID varchar2(14) , --> fk from Doctor
 Pat_NID varchar(14),  --> fk from Patient
 Date_Issued date ,
 Dosage varchar2(50) ,
 Frequency varchar2(50) , 
 Duration varchar2(50),
 primary key (Med_Name,Doc_NID,Pat_NID));


create table Dispenses(Med_Name varchar2(100) references Medicine ,
  Phar_NID varchar2(14) ,  --> fk from Pharmacist
  Pat_NID varchar(14) ,   --> fk from Patient
  Dispense_Date date ,
  Quantity number(6,0),
  PRIMARY KEY (Med_Name , Phar_NID , Pat_NID));


create table Inventories(Med_Name varchar2(100) references Medicine , 
 Phar_NID varchar2(14) ,   -->fk from Pharmacist
 Stock_Mng varchar2(100),
 primary key(Med_Name , Phar_NID));

-- ============================================================
-- [6] MODULE 5: LABS, RADIOLOGY & BILLING (Nader Saleh)
-- Entities: Lab_Test, Radiology_Scan, Invoice + Results
-- ============================================================

-- TODO: Add Lab_Test, Radiology_Scan, Invoice tables

CREATE TABLE Test_Lab (
    Test_Name     VARCHAR2(100) PRIMARY KEY,
    Sample_Type   VARCHAR2(50),
    Turnaround_Hr number(4,1),
    Cost          number(8,2),
    Dept_Name     VARCHAR2(100) REFERENCES Department(Dept_Name)
);

CREATE TABLE Radiology_Scan (
    Scan_Name     VARCHAR2(100) PRIMARY KEY,
    Cost          number(8,2),
    Dept_Name     VARCHAR2(100) REFERENCES Department(Dept_Name)
);

CREATE TABLE Invoice (
    Invoice_No   VARCHAR2(50) PRIMARY KEY,
    Issue_Date   DATE,
    Status       VARCHAR2(50),
    Pay_Method   VARCHAR2(50),
    Total_Amt    number(10,2),
    Amt_Paid     number(10,2),
    Rec_NID      VARCHAR2(14) , -- fk from Receptionist added later via ALTER
    policy_No    VARCHAR2(50) REFERENCES Insurance(Policy_No),
    Pat_NID      VARCHAR2(14) REFERENCES Patient(Pat_NID)
);
-- TODO: Add Result and Invoice mapping tables
 
    create table Test_Result(
    Test_Name    varchar2(100) ,  
    Pat_NID      Varchar2(14),  
    PRIMARY key  (Test_Name,Pat_NID),
    Test_Name    varchar2(100) REFERENCES Test_Lab(Test_Name),
    Pat_NID      Varchar2(14) REFERENCES Patient(Pat_NID) 
);

    create table Scan_Result(
    Scan_Name    Varchar2(100) ,  
    Pat_NID      Varchar2(14),  
    PRIMARY key  (Scan_Name,Pat_NID),
    Scan_Name    Varchar2(100) REFERENCES Radiology_Scan(Scan_Name),
    Pat_NID      Varchar2(14) REFERENCES Patient(Pat_NID)
);

    create table Radiology_Scan_Invoice(
    Scan_Name   Varchar2(100) ,  
    Invoice_No  Varchar2(50),  
    PRIMARY key (Scan_Name,Invoice_No),
    Scan_Name   Varchar2(100) REFERENCES Radiology_Scan(Scan_Name),
    Invoice_No  Varchar2(50)   REFERENCES Invoice(Invoice_No)
);
    create table  Invoice_Lab_Test(
    Test_Name     Varchar2(100) ,  
    Invoice_No    Varchar2(50),  
    PRIMARY key   (Test_Name,Invoice_No),
    Test_Name     Varchar2(100) REFERENCES Lab_Test(Test_Name),
    FInvoice_No   Varchar2(50) REFERENCES Invoice(Invoice_No)
);
-- ============================================================
-- [7] FINAL CONSTRAINTS (ALTER TABLE)
-- Add Foreign Keys that reference tables across different modules
-- ============================================================

-- Example: Linking Department Manager back to Doctors
-- ALTER TABLE Department ADD CONSTRAINT fk_dept_manager 
-- FOREIGN KEY (M_NID) REFERENCES Doctors(NID);

COMMIT;
-- END OF TEMPLATE
