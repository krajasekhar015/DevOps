Day-13 session-13(28/08/2024)
--------------------------------

### Shell Scripting & Deployment Notes

#### 1. **Variables:**
- Variables store values to avoid repetition and follow the DRY (Don’t Repeat Yourself) principle.
- **Benefit:** Centralized location for values that can be changed in one place and reflected throughout the script.

#### 2. **Conditions:**
- Used for decision-making in scripts.
- **Syntax Example:**
  ```bash
  if [ condition ]
  then
      # True block
  else
      # False block
  fi
  ```

#### 3. **Loops:**
- Loops allow you to execute a block of code repeatedly.
- **Syntax Example (Shell Script):**
  ```bash
  for i in 1 2 3 4 5
  do
      echo $i
  done
  ```

#### 4. **Functions:**
- Functions are used to perform tasks that are repeated multiple times.
- **Example:**
  ```bash
  function_name() {
      # code here
  }
  ```

#### 5. **Data Types:**
- Shell scripting primarily handles strings, but integers and arrays can also be used.

#### 6. **Colors:**
- For user experience, colors highlight different messages.
  - `\e[31m`: Red (for errors)
  - `\e[32m`: Green (for success)
  - `\e[33m`: Yellow (for warnings)

#### 7. **Redirectors:**
- Redirect output of commands to files:
  - **Success output:** `command > output.txt`
  - **Error output:** `command 2> error.txt`
  - **Both success & error output:** `command &> output.txt`

#### 8. **Exit Status:**
- **Success:** Exit code `0`.
- **Failure:** Exit code ranges from `1` to `127`.

#### 9. **Algorithm for Expense Project (MySQL Setup):**
- **Idempotency:** If a script is run multiple times, it should always provide the same result without any unwanted state change.

---

### Expense Project Using Shell Script

#### Setup:
- Create 3 AWS EC2 instances: **MySQL**, **Backend**, and **Frontend**.
- Use **SuperPutty** to connect to servers.
- Clone the expense project repository using:
  ```bash
  git clone <URL>
  ```
- Create `backend.sh` script in **VS Code**.

---

### Deployment or New Version Release Steps:
1. Announce downtime: "We are under maintenance from 2:00 AM to 6:00 AM on 29-Aug."
2. Stop the server.
3. Backup the previous version.
4. Remove the existing version.
5. Download the new version.
6. Start the server.

---

### HTTP Methods and Status Codes:

#### HTTP Methods:
1. **GET:** Read data from the database.
2. **POST:** Create data (typically sent as JSON).
3. **PUT:** Update existing information.
4. **DELETE:** Remove data.

#### HTTP Status Codes:
- **2xx:** Success
  - 200: OK
  - 201: Created
  - 204: No Content
- **4xx:** Client-side errors
  - 400: Bad Request
  - 401: Unauthorized
  - 403: Forbidden
  - 404: Not Found
  - 405: Method Not Allowed
- **5xx:** Server-side errors
  - 500: Internal Server Error
  - 502: Bad Gateway
  - 503: Service Unavailable
  - 504: Gateway Timeout

---

### Script for Deleting Old Logs:
- **Objective:** Write a shell script to delete `.log` files older than 14 days.

#### Steps:
1. Identify the directory containing the logs.
2. Check if the directory exists.
3. Find the files older than 14 days.
4. Delete the files.

**Example Script:**
```bash
#!/bin/bash
find /path/to/logs/*.log -mtime +14 -exec rm {} \;
```

---

### Shell Script Example for MySQL Setup:

```bash
#!/bin/bash

LOGS_FOLDER="/var/log/expense"
SCRIPT_NAME=$(basename $0 .sh)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then    
        echo -e "$R Please run this script as root $N" | tee -a $LOG_FILE
        exit 1
    fi 
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2... $R FAILED $N" | tee -a $LOG_FILE
        exit 1 
    else 
        echo -e "$2... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

echo "Script started at: $(date)" | tee -a $LOG_FILE
CHECK_ROOT

echo "Checking if MySQL is installed..." | tee -a $LOG_FILE
mysql --version &>>$LOG_FILE
if [ $? -ne 0 ]; 
then
  echo "MySQL is not installed. Installing now..." | tee -a $LOG_FILE
  dnf install mysql-server -y &>>$LOG_FILE
  VALIDATE $? "MySQL Server installation"
else
  echo -e "MySQL is already installed.... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

echo "Checking if MySQL server is enabled..." | tee -a $LOG_FILE
systemctl is-enabled mysqld &>>$LOG_FILE
if [ $? -ne 0 ]; 
then
  echo "Enabling MySQL server..." | tee -a $LOG_FILE
  systemctl enable mysqld &>>$LOG_FILE
  VALIDATE $? "Enable MySQL Server"
else
  echo -e "MySQL server is already enabled... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

echo "Checking if MySQL server is running..." | tee -a $LOG_FILE
systemctl is-active mysqld &>>$LOG_FILE
if [ $? -ne 0 ]; 
then
  echo "Starting MySQL server..." | tee -a $LOG_FILE
  systemctl start mysqld &>>$LOG_FILE
  VALIDATE $? "Start MySQL Server"
else
  echo -e "MySQL server is already running... $Y SKIPPING $N" | tee -a $LOG_FILE
fi
```
