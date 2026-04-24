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
-- TODO: Add Weak Entities (Dependent, Medical_History)
-- TODO: Add M:N Tables (Appointment, Refers)


-- ============================================================
-- [4] MODULE 3: CLINIC & SURGERY (Ahmad Ayman)
-- Entities: Room, Surgery + M:N Relations
-- ============================================================

-- TODO: Add Room and Surgery base tables
-- TODO: Add Relation tables (Held_In, Admitted_To, Undergoes, etc.)


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