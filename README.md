# 🏥 Al-Tawheed Hospital DBMS

Welcome to Phase 2 (SQL Implementation). Please follow this workflow strictly.

## 🚀 Git & SQL Workflow

**1. Setup (First time only):**
```bash
git clone https://github.com/Omar-eng-sys/Altawheed_Hospital_DBMS.git
```

**2. Update (Every time you start):**
```bash
cd Altawheed_Hospital_DBMS
git pull
```

**3. Run the Shared Script (Build the Database):**
Before writing new code, you MUST run the shared script in your Oracle database to get everyone's latest tables.
* Open **Run SQL Command Line**.
* Connect to your user:
```sql
conn your_username/your_password;
```
* Run the script by typing `@` followed by the full path to the downloaded file (Make sure the path has no spaces or Arabic letters). Example:
```sql
@C:\Users\Omar\Altawheed_Hospital_DBMS\Hospital_Management_System.sql
```

**4. Write & Test Code (The Golden Rule):**
* **NEVER** type new code directly into `Hospital_Management_System.sql`.
* Test your code in the SQL Command Line first.
* Only when it says `Table created`, **COPY & PASTE** it into your assigned section in the file.

**5. Upload (When finished):**
```bash
git add .
git commit -m "Short description of what you did"
git push
```

## 🏗️ Assignments
* **Module 1 (HR):** Muhammad Ragab
* **Module 2 (Patients):** Omar Nasser
* **Module 3 (Surgery):** Ahmad Ayman
* **Module 4 (Pharmacy):** Muhammad Ali
* **Module 5 (Labs):** Nader Saleh
