-- ==========================================
-- Al-Tawheed Hospital - SQL*Plus Formatting
-- ==========================================

-- 1. General Environment Settings
SET LINESIZE 250;
SET PAGESIZE 100;
SET TRIMSPOOL ON;
SET WRAP OFF; 

-- 2. Global Column Formatting (For Tables)
COLUMN Name FORMAT A22;
COLUMN Location FORMAT A25;
COLUMN Schedule FORMAT A20;
COLUMN Specialty FORMAT A18;
COLUMN Company FORMAT A15;
COLUMN Room_Type FORMAT A15;
COLUMN Med_Name FORMAT A20;
COLUMN Manufacturer FORMAT A15;
COLUMN Scan_Name FORMAT A22;
COLUMN Test_Name FORMAT A22;
COLUMN Disease FORMAT A20;
COLUMN Allergy FORMAT A15;
COLUMN Medication FORMAT A20;

-- 3. Formatting for Query Aliases (عشان الاستعلامات المعقدة)
COLUMN Patient_Name FORMAT A22;
COLUMN Doctor_Name FORMAT A22;
COLUMN Manager_Name FORMAT A22;
COLUMN Insurance_Company FORMAT A18;
COLUMN Surgery FORMAT A20;
COLUMN Total_Revenue FORMAT 999,999.99;
COLUMN Average_Nurse_Salary FORMAT 99,999.99;