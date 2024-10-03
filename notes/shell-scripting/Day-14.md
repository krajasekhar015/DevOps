Day-14 session-14(29/08/2024)
----------------------------
#### Completed Expense Project Using Shell Script
1. **Variables**:
   - **Types of Variables**:
     - Mentioned in scripts
     - Passed from outside (as parameters)
     - Taken as user prompts
     - Using command outputs
2. **Conditions**: Used to check success or failure of commands.
3. **Functions**: Modularized code for reuse.
4. **Loops**: Implemented `while` loops for iterative tasks.
5. **Redirectors**: Redirect output to files or other commands.
6. **Installation Scripts**: Automated installation of services.
7. **Set Command**: Enabled error tracking with `set -ex`.
8. **Colors**: Applied color codes for better readability in logs and outputs.
9. **Deleting Log Files**: Script to delete logs older than 14 days.
10. **Completion**: Fully automated the expense project using shell scripts.

---

### Today’s Class Topics

---

#### Importance of Shell Scripting in Linux
- Shell scripting is **native to Linux** and thus more efficient for system-level tasks.
- **Python** is preferred when interacting with **external systems**, e.g., pulling data from AWS or creating Jira tickets.

---

### Crontab: Scheduling Scripts Periodically (Important for Interviews)
- Crontab allows for scheduling shell scripts to run at specific times.
- The command to edit crontab: `crontab -e`

#### Crontab Syntax:
```bash
M  H  Day  Month  Day(Week)
```

| Field        | Description                               |
|--------------|-------------------------------------------|
| M (Minutes)  | 0-59                                      |
| H (Hour)     | 0-23                                      |
| Day          | 1-31                                      |
| Month        | 1-12                                      |
| Day(Week)    | 0-7 (0 or 7 for Sunday)                   |

#### Crontab Examples:
1. `0 0 * * *` → Runs at **12 AM** every day.
2. `0 1 * * *` → Runs at **1 AM** every day.
3. `*/2 * * * *` → Runs **every 2 minutes**.

#### Use Case: Scheduling a Shell Script
```bash
/home/ec2-user/git-practice/18-delete-old-logs.sh
```
- The script will be scheduled to delete old logs periodically.

---

### Backup Management with Shell Scripts
1. **Application Logs**:
   - Applications generate **large logs** (GBs) daily.
   - Logs should be compressed into a **zip** file and moved to a **backup directory**.
   - Logs are **removed from the application server** after zipping to avoid filling up storage.
   - Example: Moving logs is similar to transferring photos from a mobile device to an external hard drive to free up space.

#### Algorithm for Backup and Log Management:
1. **Input**: Get source directory, destination directory, and days from the user.
2. **Validation**: If inputs are not provided, show usage and exit.
3. **Check Directories**: Ensure directories exist; exit if not.
4. **Find and Zip Logs**: Find log files older than **14 days**, zip them, and move to the destination directory. Delete them from the source directory.

#### Example Command:
```bash
find . -name "*.log" -mtime +14 | zip <name-of-zip-file> -@  
```
- This zips all `.log` files older than 14 days.

---

### Check Hard Disk Memory Usage & Send Alerts
- **Monitoring Hard Disk Usage**:
  - Check the disk usage and send an **email alert** if usage crosses **75%**.
- This is crucial for system administrators to monitor server health.

--- 

These topics cover the importance of automation through shell scripting for efficient system management, with a focus on scheduling tasks, log management, and server monitoring.
