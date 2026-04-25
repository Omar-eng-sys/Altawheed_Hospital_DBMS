-- ============================================================
-- Project: Al-Tawheed Charity Hospital Information System
-- Phase 3: Mock Data Insertion (DML)
-- ============================================================

-- ============================================================
-- STEP 1: INDEPENDENT TABLES (No FK dependencies)
-- ============================================================

-- Insurance
INSERT INTO Insurance (Policy_No, Company, Cov_Limit, Cov_Type, Expiry_Date)
VALUES ('POL-001', 'Misr Insurance', 50000, 'Comprehensive', TO_DATE('2026-12-31', 'YYYY-MM-DD'));

INSERT INTO Insurance (Policy_No, Company, Cov_Limit, Cov_Type, Expiry_Date)
VALUES ('POL-002', 'Al-Ahlia Insurance', 30000, 'Basic', TO_DATE('2025-06-30', 'YYYY-MM-DD'));

INSERT INTO Insurance (Policy_No, Company, Cov_Limit, Cov_Type, Expiry_Date)
VALUES ('POL-003', 'Egypt Life Insurance', 75000, 'Premium', TO_DATE('2027-03-15', 'YYYY-MM-DD'));

INSERT INTO Insurance (Policy_No, Company, Cov_Limit, Cov_Type, Expiry_Date)
VALUES ('POL-004', 'Delta Insurance', 20000, 'Basic', TO_DATE('2026-01-01', 'YYYY-MM-DD'));

INSERT INTO Insurance (Policy_No, Company, Cov_Limit, Cov_Type, Expiry_Date)
VALUES ('POL-005', 'Wethaq Takaful', 60000, 'Comprehensive', TO_DATE('2027-09-20', 'YYYY-MM-DD'));

-- Room
INSERT INTO Room (Room_No, Room_Type, Floor)
VALUES ('R001', 'General Ward', '1');

INSERT INTO Room (Room_No, Room_Type, Floor)
VALUES ('R002', 'ICU', '2');

INSERT INTO Room (Room_No, Room_Type, Floor)
VALUES ('R003', 'Operating Theater', '3');

INSERT INTO Room (Room_No, Room_Type, Floor)
VALUES ('R004', 'Private Room', '2');

INSERT INTO Room (Room_No, Room_Type, Floor)
VALUES ('R005', 'Emergency', '1');

-- Medicine
INSERT INTO Medicine (Med_Name, Active_Ing, Price, "Form", Manufacturer, Stok_Qty)
VALUES ('Panadol 500mg', 'Paracetamol', 15.50, 'Tablet', 'GlaxoSmithKline Egypt', 500);

INSERT INTO Medicine (Med_Name, Active_Ing, Price, "Form", Manufacturer, Stok_Qty)
VALUES ('Augmentin 625mg', 'Amoxicillin/Clavulanate', 85.00, 'Tablet', 'GlaxoSmithKline Egypt', 200);

INSERT INTO Medicine (Med_Name, Active_Ing, Price, "Form", Manufacturer, Stok_Qty)
VALUES ('Concor 5mg', 'Bisoprolol', 45.00, 'Tablet', 'Merck Egypt', 300);

INSERT INTO Medicine (Med_Name, Active_Ing, Price, "Form", Manufacturer, Stok_Qty)
VALUES ('Glucophage 1000mg', 'Metformin', 30.00, 'Tablet', 'Merck Egypt', 400);

INSERT INTO Medicine (Med_Name, Active_Ing, Price, "Form", Manufacturer, Stok_Qty)
VALUES ('Nexium 40mg', 'Esomeprazole', 60.00, 'Capsule', 'AstraZeneca Egypt', 250);

INSERT INTO Medicine (Med_Name, Active_Ing, Price, "Form", Manufacturer, Stok_Qty)
VALUES ('Voltaren 75mg', 'Diclofenac Sodium', 25.00, 'Injection', 'Novartis Egypt', 150);

-- Surgery
INSERT INTO Surgery (Surg_Name, Cost, Expected_Dur)
VALUES ('Appendectomy', 8000, 90);

INSERT INTO Surgery (Surg_Name, Cost, Expected_Dur)
VALUES ('Laparoscopic Cholecystectomy', 12000, 120);

INSERT INTO Surgery (Surg_Name, Cost, Expected_Dur)
VALUES ('Coronary Artery Bypass', 50000, 300);

INSERT INTO Surgery (Surg_Name, Cost, Expected_Dur)
VALUES ('Knee Replacement', 35000, 180);

INSERT INTO Surgery (Surg_Name, Cost, Expected_Dur)
VALUES ('Cataract Extraction', 7000, 45);

-- Receptionist
INSERT INTO Receptionist (NID, Name, Schedule, Salary)
VALUES ('29801011234567', 'Nourhan Tarek Mahmoud', 'Sun-Thu 08:00-16:00', 4500);

INSERT INTO Receptionist (NID, Name, Schedule, Salary)
VALUES ('29905152345678', 'Salma Ibrahim Hassan', 'Sun-Thu 16:00-00:00', 4500);

INSERT INTO Receptionist (NID, Name, Schedule, Salary)
VALUES ('30003203456789', 'Aya Mohamed Fathy', 'Mon-Fri 08:00-16:00', 4800);

INSERT INTO Receptionist (NID, Name, Schedule, Salary)
VALUES ('29707254567890', 'Dina Ahmed Kamal', 'Sat-Wed 08:00-16:00', 4600);

-- ============================================================
-- STEP 2: DEPARTMENT (M_NID = NULL to break circular dependency)
-- ============================================================

INSERT INTO Department (Dept_ID, Name, Location, M_NID, M_Start_Date)
VALUES ('D01', 'Internal Medicine', 'Building A - Floor 1', NULL, NULL);

INSERT INTO Department (Dept_ID, Name, Location, M_NID, M_Start_Date)
VALUES ('D02', 'General Surgery', 'Building B - Floor 2', NULL, NULL);

INSERT INTO Department (Dept_ID, Name, Location, M_NID, M_Start_Date)
VALUES ('D03', 'Cardiology', 'Building A - Floor 3', NULL, NULL);

INSERT INTO Department (Dept_ID, Name, Location, M_NID, M_Start_Date)
VALUES ('D04', 'Orthopedics', 'Building C - Floor 1', NULL, NULL);

INSERT INTO Department (Dept_ID, Name, Location, M_NID, M_Start_Date)
VALUES ('D05', 'Ophthalmology', 'Building C - Floor 2', NULL, NULL);

INSERT INTO Department (Dept_ID, Name, Location, M_NID, M_Start_Date)
VALUES ('D06', 'Pharmacy', 'Building A - Ground Floor', NULL, NULL);

INSERT INTO Department (Dept_ID, Name, Location, M_NID, M_Start_Date)
VALUES ('D07', 'Radiology', 'Building B - Ground Floor', NULL, NULL);

INSERT INTO Department (Dept_ID, Name, Location, M_NID, M_Start_Date)
VALUES ('D08', 'Laboratory', 'Building B - Floor 1', NULL, NULL);

-- ============================================================
-- STEP 3: DOCTORS
-- ============================================================

INSERT INTO Doctors (NID, Name, Consultation_Fee, License_Number, Year_of_Experience, Salary, Schedule, Specialty, Dept_ID)
VALUES ('19801015100011', 'Dr. Khaled Mostafa Abdel-Fattah', 300, 'LIC-10011', 22, 25000, 'Sun-Thu 09:00-17:00', 'Internal Medicine', 'D01');

INSERT INTO Doctors (NID, Name, Consultation_Fee, License_Number, Year_of_Experience, Salary, Schedule, Specialty, Dept_ID)
VALUES ('19750320100022', 'Dr. Hossam Nabil El-Sherif', 400, 'LIC-10022', 28, 35000, 'Sun-Thu 08:00-16:00', 'General Surgery', 'D02');

INSERT INTO Doctors (NID, Name, Consultation_Fee, License_Number, Year_of_Experience, Salary, Schedule, Specialty, Dept_ID)
VALUES ('19850612100033', 'Dr. Amr Samir Fahmy', 500, 'LIC-10033', 17, 40000, 'Sat-Wed 10:00-18:00', 'Cardiology', 'D03');

INSERT INTO Doctors (NID, Name, Consultation_Fee, License_Number, Year_of_Experience, Salary, Schedule, Specialty, Dept_ID)
VALUES ('19900910100044', 'Dr. Tamer Youssef Barakat', 350, 'LIC-10044', 12, 28000, 'Sun-Thu 09:00-17:00', 'Orthopedics', 'D04');

INSERT INTO Doctors (NID, Name, Consultation_Fee, License_Number, Year_of_Experience, Salary, Schedule, Specialty, Dept_ID)
VALUES ('19881225100055', 'Dr. Wael Adel Mansour', 350, 'LIC-10055', 14, 27000, 'Mon-Fri 09:00-17:00', 'Ophthalmology', 'D05');

-- ============================================================
-- STEP 4: UPDATE Department to assign managers (resolve circular dependency)
-- ============================================================

UPDATE Department SET M_NID = '19801015100011', M_Start_Date = TO_DATE('2015-03-01', 'YYYY-MM-DD') WHERE Dept_ID = 'D01';
UPDATE Department SET M_NID = '19750320100022', M_Start_Date = TO_DATE('2010-07-15', 'YYYY-MM-DD') WHERE Dept_ID = 'D02';
UPDATE Department SET M_NID = '19850612100033', M_Start_Date = TO_DATE('2018-01-10', 'YYYY-MM-DD') WHERE Dept_ID = 'D03';
UPDATE Department SET M_NID = '19900910100044', M_Start_Date = TO_DATE('2020-05-20', 'YYYY-MM-DD') WHERE Dept_ID = 'D04';
UPDATE Department SET M_NID = '19881225100055', M_Start_Date = TO_DATE('2019-09-01', 'YYYY-MM-DD') WHERE Dept_ID = 'D05';

-- ============================================================
-- STEP 5: NURSE, PHARMACIST
-- ============================================================

-- Nurse
INSERT INTO Nurse (NID, Name, Schedule, Salary, Dept_ID, D_NID)
VALUES ('29901011200111', 'Mariam Saeed El-Gendy', 'Sun-Thu 07:00-15:00', 5500, 'D01', '19801015100011');

INSERT INTO Nurse (NID, Name, Schedule, Salary, Dept_ID, D_NID)
VALUES ('30002152200222', 'Heba Mahmoud Youssef', 'Sun-Thu 15:00-23:00', 5500, 'D02', '19750320100022');

INSERT INTO Nurse (NID, Name, Schedule, Salary, Dept_ID, D_NID)
VALUES ('29805203200333', 'Rania Fathy Abdelaziz', 'Sat-Wed 07:00-15:00', 5800, 'D03', '19850612100033');

INSERT INTO Nurse (NID, Name, Schedule, Salary, Dept_ID, D_NID)
VALUES ('30107224200444', 'Dalia Hassan Osman', 'Mon-Fri 07:00-15:00', 5600, 'D04', '19900910100044');

INSERT INTO Nurse (NID, Name, Schedule, Salary, Dept_ID, D_NID)
VALUES ('29911305200555', 'Noha Tarek El-Wakil', 'Sun-Thu 23:00-07:00', 6000, 'D05', '19881225100055');

-- Pharmacist
INSERT INTO Pharmacist (NID, Name, Schedule, Salary, Dept_ID)
VALUES ('29806101300111', 'Ahmed Ramadan El-Sayed', 'Sun-Thu 08:00-16:00', 7000, 'D06');

INSERT INTO Pharmacist (NID, Name, Schedule, Salary, Dept_ID)
VALUES ('29902201300222', 'Mona Walid Abdelhady', 'Sun-Thu 16:00-00:00', 7000, 'D06');

INSERT INTO Pharmacist (NID, Name, Schedule, Salary, Dept_ID)
VALUES ('30005121300333', 'Omar Essam Naguib', 'Sat-Wed 08:00-16:00', 7200, 'D06');

-- ============================================================
-- STEP 6: PATIENT
-- ============================================================

INSERT INTO Patient (Pat_NID, Name, Gender, DOB, Ins_Policy, Rec_ID, Dept_ID)
VALUES ('30001015400111', 'Mohamed Gamal Abdel-Nasser', 'M', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'POL-001', '29801011234567', 'D01');

INSERT INTO Patient (Pat_NID, Name, Gender, DOB, Ins_Policy, Rec_ID, Dept_ID)
VALUES ('29505204400222', 'Fatma Ali El-Husseiny', 'F', TO_DATE('1995-05-20', 'YYYY-MM-DD'), 'POL-002', '29905152345678', 'D03');

INSERT INTO Patient (Pat_NID, Name, Gender, DOB, Ins_Policy, Rec_ID, Dept_ID)
VALUES ('19881130400333', 'Sherif Osama El-Naggar', 'M', TO_DATE('1988-11-30', 'YYYY-MM-DD'), 'POL-003', '29801011234567', 'D02');

INSERT INTO Patient (Pat_NID, Name, Gender, DOB, Ins_Policy, Rec_ID, Dept_ID)
VALUES ('20210315400444', 'Yasmine Hamed Soliman', 'F', TO_DATE('2002-03-15', 'YYYY-MM-DD'), 'POL-004', '30003203456789', 'D04');

INSERT INTO Patient (Pat_NID, Name, Gender, DOB, Ins_Policy, Rec_ID, Dept_ID)
VALUES ('19700822400555', 'Ibrahim Fouad El-Masry', 'M', TO_DATE('1970-08-22', 'YYYY-MM-DD'), 'POL-005', '29707254567890', 'D05');

-- ============================================================
-- STEP 7: PHONE TABLES
-- ============================================================

-- Doctor Phones
INSERT INTO Dr_Phone (Phone, D_NID) VALUES ('01001234567', '19801015100011');
INSERT INTO Dr_Phone (Phone, D_NID) VALUES ('01112345678', '19750320100022');
INSERT INTO Dr_Phone (Phone, D_NID) VALUES ('01223456789', '19850612100033');
INSERT INTO Dr_Phone (Phone, D_NID) VALUES ('01534567890', '19900910100044');
INSERT INTO Dr_Phone (Phone, D_NID) VALUES ('01095678901', '19881225100055');

-- Nurse Phones
INSERT INTO Nu_Phone (Phone, Nu_NID) VALUES ('01201112222', '29901011200111');
INSERT INTO Nu_Phone (Phone, Nu_NID) VALUES ('01152223333', '30002152200222');
INSERT INTO Nu_Phone (Phone, Nu_NID) VALUES ('01063334444', '29805203200333');
INSERT INTO Nu_Phone (Phone, Nu_NID) VALUES ('01554445555', '30107224200444');
INSERT INTO Nu_Phone (Phone, Nu_NID) VALUES ('01225556666', '29911305200555');

-- Pharmacist Phones
INSERT INTO Ph_Phone (Phone, Ph_NID) VALUES ('01016667777', '29806101300111');
INSERT INTO Ph_Phone (Phone, Ph_NID) VALUES ('01117778888', '29902201300222');
INSERT INTO Ph_Phone (Phone, Ph_NID) VALUES ('01228889999', '30005121300333');

-- Receptionist Phones
INSERT INTO Rs_Phone (Phone, Rs_NID) VALUES ('01009990001', '29801011234567');
INSERT INTO Rs_Phone (Phone, Rs_NID) VALUES ('01120001112', '29905152345678');
INSERT INTO Rs_Phone (Phone, Rs_NID) VALUES ('01231112223', '30003203456789');
INSERT INTO Rs_Phone (Phone, Rs_NID) VALUES ('01542223334', '29707254567890');

-- Patient Phones
INSERT INTO Patient_Phone (Pat_NID, Phone) VALUES ('30001015400111', '01011114444');
INSERT INTO Patient_Phone (Pat_NID, Phone) VALUES ('29505204400222', '01122225555');
INSERT INTO Patient_Phone (Pat_NID, Phone) VALUES ('19881130400333', '01233336666');
INSERT INTO Patient_Phone (Pat_NID, Phone) VALUES ('20210315400444', '01544447777');
INSERT INTO Patient_Phone (Pat_NID, Phone) VALUES ('19700822400555', '01095558888');

-- ============================================================
-- STEP 8: DEPENDENT & DEPENDENT PHONE
-- ============================================================

INSERT INTO Dependent (Pat_NID, Dep_Name, Relation)
VALUES ('30001015400111', 'Laila Gamal Abdel-Nasser', 'Sister');

INSERT INTO Dependent (Pat_NID, Dep_Name, Relation)
VALUES ('29505204400222', 'Hassan Ali El-Husseiny', 'Husband');

INSERT INTO Dependent (Pat_NID, Dep_Name, Relation)
VALUES ('19881130400333', 'Youssef Sherif El-Naggar', 'Son');

INSERT INTO Dependent (Pat_NID, Dep_Name, Relation)
VALUES ('19700822400555', 'Samira Fouad El-Masry', 'Wife');

INSERT INTO Dep_Phone (Pat_NID, Dep_Name, Phone)
VALUES ('30001015400111', 'Laila Gamal Abdel-Nasser', '01066671234');

INSERT INTO Dep_Phone (Pat_NID, Dep_Name, Phone)
VALUES ('29505204400222', 'Hassan Ali El-Husseiny', '01177782345');

INSERT INTO Dep_Phone (Pat_NID, Dep_Name, Phone)
VALUES ('19881130400333', 'Youssef Sherif El-Naggar', '01288893456');

-- ============================================================
-- STEP 9: MEDICAL HISTORY & DETAIL TABLES
-- ============================================================

-- Medical_History
INSERT INTO Medical_History (Record_No, Pat_NID, Smoking_st, Blood_Type)
VALUES ('REC-001', '30001015400111', 'Non-Smoker', 'A+');

INSERT INTO Medical_History (Record_No, Pat_NID, Smoking_st, Blood_Type)
VALUES ('REC-002', '29505204400222', 'Ex-Smoker', 'B+');

INSERT INTO Medical_History (Record_No, Pat_NID, Smoking_st, Blood_Type)
VALUES ('REC-003', '19881130400333', 'Smoker', 'O+');

INSERT INTO Medical_History (Record_No, Pat_NID, Smoking_st, Blood_Type)
VALUES ('REC-004', '20210315400444', 'Non-Smoker', 'AB+');

INSERT INTO Medical_History (Record_No, Pat_NID, Smoking_st, Blood_Type)
VALUES ('REC-005', '19700822400555', 'Ex-Smoker', 'O-');

-- Chronic_Diseases
INSERT INTO Chronic_Diseases (Pat_NID, Record_No, Disease)
VALUES ('29505204400222', 'REC-002', 'Type 2 Diabetes');

INSERT INTO Chronic_Diseases (Pat_NID, Record_No, Disease)
VALUES ('19700822400555', 'REC-005', 'Hypertension');

INSERT INTO Chronic_Diseases (Pat_NID, Record_No, Disease)
VALUES ('19700822400555', 'REC-005', 'Coronary Artery Disease');

INSERT INTO Chronic_Diseases (Pat_NID, Record_No, Disease)
VALUES ('19881130400333', 'REC-003', 'Peptic Ulcer Disease');

-- Allergies
INSERT INTO Allergies (Pat_NID, Record_No, Allergy)
VALUES ('30001015400111', 'REC-001', 'Penicillin');

INSERT INTO Allergies (Pat_NID, Record_No, Allergy)
VALUES ('29505204400222', 'REC-002', 'Sulfonamides');

INSERT INTO Allergies (Pat_NID, Record_No, Allergy)
VALUES ('19881130400333', 'REC-003', 'Aspirin');

-- Past_Surgeries
INSERT INTO Past_Surgeries (Pat_NID, Record_No, Surgery)
VALUES ('19881130400333', 'REC-003', 'Appendectomy');

INSERT INTO Past_Surgeries (Pat_NID, Record_No, Surgery)
VALUES ('19700822400555', 'REC-005', 'Coronary Artery Bypass');

-- Current_Medication
INSERT INTO Current_Medication (Pat_NID, Record_No, Medication)
VALUES ('29505204400222', 'REC-002', 'Glucophage 1000mg');

INSERT INTO Current_Medication (Pat_NID, Record_No, Medication)
VALUES ('19700822400555', 'REC-005', 'Concor 5mg');

INSERT INTO Current_Medication (Pat_NID, Record_No, Medication)
VALUES ('19700822400555', 'REC-005', 'Nexium 40mg');

-- ============================================================
-- STEP 10: APPOINTMENT & REFERS
-- ============================================================

INSERT INTO Appointment (Pat_NID, Doctor_NID, Appt_Date, Appt_Time, Status, Visit_Type, Priority, Queue_No)
VALUES ('30001015400111', '19801015100011', TO_DATE('2024-09-01', 'YYYY-MM-DD'), '09:00', 'Completed', 'Follow-up', 'Normal', 1);

INSERT INTO Appointment (Pat_NID, Doctor_NID, Appt_Date, Appt_Time, Status, Visit_Type, Priority, Queue_No)
VALUES ('29505204400222', '19850612100033', TO_DATE('2024-09-02', 'YYYY-MM-DD'), '10:30', 'Completed', 'Consultation', 'High', 2);

INSERT INTO Appointment (Pat_NID, Doctor_NID, Appt_Date, Appt_Time, Status, Visit_Type, Priority, Queue_No)
VALUES ('19881130400333', '19750320100022', TO_DATE('2024-09-03', 'YYYY-MM-DD'), '11:00', 'Scheduled', 'Pre-operative', 'Urgent', 1);

INSERT INTO Appointment (Pat_NID, Doctor_NID, Appt_Date, Appt_Time, Status, Visit_Type, Priority, Queue_No)
VALUES ('20210315400444', '19900910100044', TO_DATE('2024-09-04', 'YYYY-MM-DD'), '14:00', 'Scheduled', 'Consultation', 'Normal', 3);

INSERT INTO Appointment (Pat_NID, Doctor_NID, Appt_Date, Appt_Time, Status, Visit_Type, Priority, Queue_No)
VALUES ('19700822400555', '19881225100055', TO_DATE('2024-09-05', 'YYYY-MM-DD'), '09:30', 'Completed', 'Routine Check', 'Normal', 1);

-- Refers
INSERT INTO Refers (Pat_NID, Doctor_NID, Dept_ID, Reason, Urgency)
VALUES ('29505204400222', '19801015100011', 'D03', 'Chest pain and palpitations requiring cardiology evaluation', 'High');

INSERT INTO Refers (Pat_NID, Doctor_NID, Dept_ID, Reason, Urgency)
VALUES ('19881130400333', '19750320100022', 'D01', 'Post-operative internal medicine follow-up required', 'Normal');

INSERT INTO Refers (Pat_NID, Doctor_NID, Dept_ID, Reason, Urgency)
VALUES ('19700822400555', '19850612100033', 'D05', 'Diabetic retinopathy screening referral', 'Normal');

-- ============================================================
-- STEP 11: SURGERY RELATIONS
-- ============================================================

-- Held_In
INSERT INTO Held_In (Surg_Name, Room_No) VALUES ('Appendectomy', 'R003');
INSERT INTO Held_In (Surg_Name, Room_No) VALUES ('Laparoscopic Cholecystectomy', 'R003');
INSERT INTO Held_In (Surg_Name, Room_No) VALUES ('Coronary Artery Bypass', 'R003');
INSERT INTO Held_In (Surg_Name, Room_No) VALUES ('Knee Replacement', 'R003');
INSERT INTO Held_In (Surg_Name, Room_No) VALUES ('Cataract Extraction', 'R003');

-- Admitted_To
INSERT INTO Admitted_To (Room_No, Pat_NID, Date_In, Date_Out)
VALUES ('R001', '30001015400111', TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-03', 'YYYY-MM-DD'));

INSERT INTO Admitted_To (Room_No, Pat_NID, Date_In, Date_Out)
VALUES ('R004', '29505204400222', TO_DATE('2024-09-02', 'YYYY-MM-DD'), TO_DATE('2024-09-05', 'YYYY-MM-DD'));

INSERT INTO Admitted_To (Room_No, Pat_NID, Date_In, Date_Out)
VALUES ('R002', '19881130400333', TO_DATE('2024-09-03', 'YYYY-MM-DD'), NULL);

INSERT INTO Admitted_To (Room_No, Pat_NID, Date_In, Date_Out)
VALUES ('R001', '19700822400555', TO_DATE('2024-09-05', 'YYYY-MM-DD'), TO_DATE('2024-09-07', 'YYYY-MM-DD'));

-- Supervises_Room
INSERT INTO Supervises_Room (Room_No, Nur_NID) VALUES ('R001', '29901011200111');
INSERT INTO Supervises_Room (Room_No, Nur_NID) VALUES ('R002', '30002152200222');
INSERT INTO Supervises_Room (Room_No, Nur_NID) VALUES ('R003', '29805203200333');
INSERT INTO Supervises_Room (Room_No, Nur_NID) VALUES ('R004', '30107224200444');
INSERT INTO Supervises_Room (Room_No, Nur_NID) VALUES ('R005', '29911305200555');

-- Undergoes
INSERT INTO Undergoes (Surg_Name, Pat_NID, Surg_Date, Outcome)
VALUES ('Appendectomy', '19881130400333', TO_DATE('2024-09-04', 'YYYY-MM-DD'), 'Successful');

INSERT INTO Undergoes (Surg_Name, Pat_NID, Surg_Date, Outcome)
VALUES ('Coronary Artery Bypass', '19700822400555', TO_DATE('2024-09-06', 'YYYY-MM-DD'), 'Successful');

INSERT INTO Undergoes (Surg_Name, Pat_NID, Surg_Date, Outcome)
VALUES ('Cataract Extraction', '20210315400444', TO_DATE('2024-09-04', 'YYYY-MM-DD'), 'Successful');

-- Participates_In
INSERT INTO Participates_In (Surg_Name, Nur_NID) VALUES ('Appendectomy', '30002152200222');
INSERT INTO Participates_In (Surg_Name, Nur_NID) VALUES ('Coronary Artery Bypass', '29805203200333');
INSERT INTO Participates_In (Surg_Name, Nur_NID) VALUES ('Cataract Extraction', '30107224200444');
INSERT INTO Participates_In (Surg_Name, Nur_NID) VALUES ('Knee Replacement', '29901011200111');

-- Performs
INSERT INTO Performs (Surg_Name, Doc_NID) VALUES ('Appendectomy', '19750320100022');
INSERT INTO Performs (Surg_Name, Doc_NID) VALUES ('Laparoscopic Cholecystectomy', '19750320100022');
INSERT INTO Performs (Surg_Name, Doc_NID) VALUES ('Coronary Artery Bypass', '19850612100033');
INSERT INTO Performs (Surg_Name, Doc_NID) VALUES ('Knee Replacement', '19900910100044');
INSERT INTO Performs (Surg_Name, Doc_NID) VALUES ('Cataract Extraction', '19881225100055');

-- ============================================================
-- STEP 12: PHARMACY TABLES
-- ============================================================

-- Prescription
INSERT INTO Prescription (Med_Name, Doc_NID, Pat_NID, Date_Issued, Dosage, Frequency, Duration)
VALUES ('Panadol 500mg', '19801015100011', '30001015400111', TO_DATE('2024-09-01', 'YYYY-MM-DD'), '500mg', 'Twice daily', '7 days');

INSERT INTO Prescription (Med_Name, Doc_NID, Pat_NID, Date_Issued, Dosage, Frequency, Duration)
VALUES ('Glucophage 1000mg', '19850612100033', '29505204400222', TO_DATE('2024-09-02', 'YYYY-MM-DD'), '1000mg', 'Once daily with meal', '30 days');

INSERT INTO Prescription (Med_Name, Doc_NID, Pat_NID, Date_Issued, Dosage, Frequency, Duration)
VALUES ('Nexium 40mg', '19801015100011', '19881130400333', TO_DATE('2024-09-03', 'YYYY-MM-DD'), '40mg', 'Once daily before breakfast', '14 days');

INSERT INTO Prescription (Med_Name, Doc_NID, Pat_NID, Date_Issued, Dosage, Frequency, Duration)
VALUES ('Concor 5mg', '19850612100033', '19700822400555', TO_DATE('2024-09-05', 'YYYY-MM-DD'), '5mg', 'Once daily in morning', '30 days');

INSERT INTO Prescription (Med_Name, Doc_NID, Pat_NID, Date_Issued, Dosage, Frequency, Duration)
VALUES ('Augmentin 625mg', '19750320100022', '19881130400333', TO_DATE('2024-09-04', 'YYYY-MM-DD'), '625mg', 'Three times daily', '7 days');

-- Dispenses
INSERT INTO Dispenses (Med_Name, Phar_NID, Pat_NID, Dispense_Date, Quantity)
VALUES ('Panadol 500mg', '29806101300111', '30001015400111', TO_DATE('2024-09-01', 'YYYY-MM-DD'), 14);

INSERT INTO Dispenses (Med_Name, Phar_NID, Pat_NID, Dispense_Date, Quantity)
VALUES ('Glucophage 1000mg', '29902201300222', '29505204400222', TO_DATE('2024-09-02', 'YYYY-MM-DD'), 30);

INSERT INTO Dispenses (Med_Name, Phar_NID, Pat_NID, Dispense_Date, Quantity)
VALUES ('Nexium 40mg', '29806101300111', '19881130400333', TO_DATE('2024-09-03', 'YYYY-MM-DD'), 14);

INSERT INTO Dispenses (Med_Name, Phar_NID, Pat_NID, Dispense_Date, Quantity)
VALUES ('Concor 5mg', '30005121300333', '19700822400555', TO_DATE('2024-09-05', 'YYYY-MM-DD'), 30);

INSERT INTO Dispenses (Med_Name, Phar_NID, Pat_NID, Dispense_Date, Quantity)
VALUES ('Augmentin 625mg', '29902201300222', '19881130400333', TO_DATE('2024-09-04', 'YYYY-MM-DD'), 21);

-- Inventories
INSERT INTO Inventories (Med_Name, Phar_NID, Stock_Mng)
VALUES ('Panadol 500mg', '29806101300111', 'Ahmed Ramadan El-Sayed');

INSERT INTO Inventories (Med_Name, Phar_NID, Stock_Mng)
VALUES ('Glucophage 1000mg', '29902201300222', 'Mona Walid Abdelhady');

INSERT INTO Inventories (Med_Name, Phar_NID, Stock_Mng)
VALUES ('Nexium 40mg', '29806101300111', 'Ahmed Ramadan El-Sayed');

INSERT INTO Inventories (Med_Name, Phar_NID, Stock_Mng)
VALUES ('Concor 5mg', '30005121300333', 'Omar Essam Naguib');

INSERT INTO Inventories (Med_Name, Phar_NID, Stock_Mng)
VALUES ('Augmentin 625mg', '29902201300222', 'Mona Walid Abdelhady');

INSERT INTO Inventories (Med_Name, Phar_NID, Stock_Mng)
VALUES ('Voltaren 75mg', '30005121300333', 'Omar Essam Naguib');

-- ============================================================
-- STEP 13: LAB_TEST & RADIOLOGY_SCAN
-- ============================================================

INSERT INTO Lab_Test (Test_Name, Sample_Type, Turnaround_Hr, Cost, Dept_ID)
VALUES ('Complete Blood Count', 'Blood', 4.0, 150, 'D08');

INSERT INTO Lab_Test (Test_Name, Sample_Type, Turnaround_Hr, Cost, Dept_ID)
VALUES ('Fasting Blood Glucose', 'Blood', 2.0, 80, 'D08');

INSERT INTO Lab_Test (Test_Name, Sample_Type, Turnaround_Hr, Cost, Dept_ID)
VALUES ('HbA1c', 'Blood', 6.0, 200, 'D08');

INSERT INTO Lab_Test (Test_Name, Sample_Type, Turnaround_Hr, Cost, Dept_ID)
VALUES ('Lipid Profile', 'Blood', 5.0, 220, 'D08');

INSERT INTO Lab_Test (Test_Name, Sample_Type, Turnaround_Hr, Cost, Dept_ID)
VALUES ('Urine Analysis', 'Urine', 3.0, 100, 'D08');

INSERT INTO Radiology_Scan (Scan_Name, Cost, Dept_ID)
VALUES ('Chest X-Ray', 250, 'D07');

INSERT INTO Radiology_Scan (Scan_Name, Cost, Dept_ID)
VALUES ('Abdominal Ultrasound', 400, 'D07');

INSERT INTO Radiology_Scan (Scan_Name, Cost, Dept_ID)
VALUES ('Echocardiogram', 800, 'D07');

INSERT INTO Radiology_Scan (Scan_Name, Cost, Dept_ID)
VALUES ('Knee MRI', 1200, 'D07');

-- ============================================================
-- STEP 14: INVOICE
-- ============================================================

INSERT INTO Invoice (Invoice_No, Issue_Date, Status, Pay_Method, Total_Amt, Amt_Paid, Rec_NID, Policy_No, Pat_NID)
VALUES ('INV-001', TO_DATE('2024-09-03', 'YYYY-MM-DD'), 'Paid', 'Cash', 1650, 1650, '29801011234567', 'POL-001', '30001015400111');

INSERT INTO Invoice (Invoice_No, Issue_Date, Status, Pay_Method, Total_Amt, Amt_Paid, Rec_NID, Policy_No, Pat_NID)
VALUES ('INV-002', TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'Paid', 'Insurance', 51800, 51800, '29905152345678', 'POL-002', '29505204400222');

INSERT INTO Invoice (Invoice_No, Issue_Date, Status, Pay_Method, Total_Amt, Amt_Paid, Rec_NID, Policy_No, Pat_NID)
VALUES ('INV-003', TO_DATE('2024-09-07', 'YYYY-MM-DD'), 'Pending', 'Insurance', 9500, 4000, '30003203456789', 'POL-003', '19881130400333');

INSERT INTO Invoice (Invoice_No, Issue_Date, Status, Pay_Method, Total_Amt, Amt_Paid, Rec_NID, Policy_No, Pat_NID)
VALUES ('INV-004', TO_DATE('2024-09-04', 'YYYY-MM-DD'), 'Paid', 'Card', 7350, 7350, '29707254567890', 'POL-004', '20210315400444');

INSERT INTO Invoice (Invoice_No, Issue_Date, Status, Pay_Method, Total_Amt, Amt_Paid, Rec_NID, Policy_No, Pat_NID)
VALUES ('INV-005', TO_DATE('2024-09-07', 'YYYY-MM-DD'), 'Partial', 'Cash', 52400, 30000, '29801011234567', 'POL-005', '19700822400555');

-- ============================================================
-- STEP 15: TEST_RESULT, SCAN_RESULT & INVOICE MAPPING TABLES
-- ============================================================

-- Test_Result
INSERT INTO Test_Result (Test_Name, Pat_NID)
VALUES ('Complete Blood Count', '30001015400111');

INSERT INTO Test_Result (Test_Name, Pat_NID)
VALUES ('Fasting Blood Glucose', '29505204400222');

INSERT INTO Test_Result (Test_Name, Pat_NID)
VALUES ('HbA1c', '29505204400222');

INSERT INTO Test_Result (Test_Name, Pat_NID)
VALUES ('Lipid Profile', '19700822400555');

INSERT INTO Test_Result (Test_Name, Pat_NID)
VALUES ('Urine Analysis', '19881130400333');

-- Scan_Result
INSERT INTO Scan_Result (Scan_Name, Pat_NID)
VALUES ('Chest X-Ray', '19881130400333');

INSERT INTO Scan_Result (Scan_Name, Pat_NID)
VALUES ('Echocardiogram', '29505204400222');

INSERT INTO Scan_Result (Scan_Name, Pat_NID)
VALUES ('Abdominal Ultrasound', '30001015400111');

INSERT INTO Scan_Result (Scan_Name, Pat_NID)
VALUES ('Knee MRI', '20210315400444');

-- Invoice_Lab_Test
INSERT INTO Invoice_Lab_Test (Test_Name, Invoice_No)
VALUES ('Complete Blood Count', 'INV-001');

INSERT INTO Invoice_Lab_Test (Test_Name, Invoice_No)
VALUES ('Fasting Blood Glucose', 'INV-002');

INSERT INTO Invoice_Lab_Test (Test_Name, Invoice_No)
VALUES ('HbA1c', 'INV-002');

INSERT INTO Invoice_Lab_Test (Test_Name, Invoice_No)
VALUES ('Urine Analysis', 'INV-003');

INSERT INTO Invoice_Lab_Test (Test_Name, Invoice_No)
VALUES ('Lipid Profile', 'INV-005');

-- Radiology_Scan_Invoice
INSERT INTO Radiology_Scan_Invoice (Scan_Name, Invoice_No)
VALUES ('Abdominal Ultrasound', 'INV-001');

INSERT INTO Radiology_Scan_Invoice (Scan_Name, Invoice_No)
VALUES ('Echocardiogram', 'INV-002');

INSERT INTO Radiology_Scan_Invoice (Scan_Name, Invoice_No)
VALUES ('Chest X-Ray', 'INV-003');

INSERT INTO Radiology_Scan_Invoice (Scan_Name, Invoice_No)
VALUES ('Knee MRI', 'INV-004');

-- ============================================================
COMMIT;
-- END OF DML SCRIPT
-- ============================================================