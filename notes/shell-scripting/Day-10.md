**Day-10 session-10(23/08/2024)**
---------------------------------------
#### **Manual Execution vs Shell Scripting**
- **Manual Command Execution Disadvantages:**
  1. Prone to **human errors**.
  2. **Time-consuming** process.

- **Shell Scripting Advantages:**
  - Automates tasks, reducing time and errors.
  
#### **Git & Source Code Management**
- **Git:** A decentralized **source code management system**.
  - Single **source of truth** for version control.
  - **GitOps:** DevOps model where Git is the source for all development and operations processes.
  - Replaces earlier centralized systems like **SVN (Subversion)**.

- **Centralized vs Decentralized Systems:**
  - **Centralized Capital** Example: Delhi controls everything (imports, exports).
    - **Disadvantages**:
      1. Single point of failure.
      2. Limits growth and accessibility.
      3. Can hinder social and economic development.
  - **Decentralized Capital** Example: Multiple cities like Chennai, Mumbai sharing responsibilities.
    - **Advantages**:
      1. No single point of failure.
      2. Distributed development.
      3. Easier accessibility.
      4. Balanced social and economic growth.
  
- **Git's Decentralized Architecture:**
  - Each computer connected to a Git repository contains a copy of the entire repository.
  - This prevents data loss in case one system fails.

- **Key Git Commands:**
  - **Clone repository:** `git clone <URL>`
  - **Stage files:** `git add <file-name>`
  - **Commit changes:** `git commit -m "message"`
  - **Push changes:** `git push origin main`
  
  - **Git Configuration:**
    ```bash
    git config --global user.email "your-email@example.com"
    git config --global user.name "Your Name"
    ```

  - **Personal Access Token (for pushing changes):**
    1. Open GitHub settings.
    2. Go to "Developer settings" > "Personal Access Tokens".
    3. Generate a new token with necessary permissions.

---

#### **Linux Instance Setup on AWS**
- **Steps to Create a Linux EC2 Instance:**
  1. Log in to AWS and create a new **EC2 instance**.
  2. Name the instance (e.g., shell-practice).
  3. Select **RedHat** OS and **t3.micro** instance type.
  4. Configure security groups (allow-all for simplicity).

---

#### **Shell Basics**
- **Shell:** An interpreter that executes commands in the system.
  
- **Shebang (#!):** The first line of a shell script (e.g., `#!/bin/bash`) tells the system which interpreter to use.
  
- **Basic Shell Command:**
  ```bash
  echo "Hello World!"
  ```

- **Executing Shell Scripts:**
  1. `sh <script-name>`
  2. `bash <script-name>`
  3. `./<script-name>` (requires execute permissions).

  - **Git Commands for Shell Script Management:**
    - **Initial Clone:** `git clone <URL>`
    - **Update Changes:** `git pull`
  
- **Advantages of Shell Scripting:**
  - **DRY (Don’t Repeat Yourself):** Centralized update location, reducing redundancy.
  - Reduces human errors and accidental changes.

---

#### **Variables in Shell Scripting**
- **Syntax:**
  ```bash
  VAR_NAME=VALUE
  ```
  - No spaces around the equal sign.
  - Variables are referenced using `$VAR_NAME`.

- **Ways to Assign Variables:**
  1. **Inside the Script:** Direct assignment.
  2. **Via Arguments:** Passed from the command line (`sh script.sh arg1 arg2`).
  3. **Runtime Input:** Using the `read` command to accept input during script execution.
  
  - **Example of Variable Assignment:**
    ```bash
    read -p "Enter your name: " name
    echo "Hello $name"
    ```

- **Single Line Git Commands:**
  - Combine Git operations into one line:
    ```bash
    git add . ; git commit -m "commit message" ; git push origin main
    ```

---

#### **Data Types in Shell Scripting**
- **Common Data Types:**
  - Integers (`1`)
  - Strings (`"Lakshmi"`)
  - Lists/Arrays (e.g., `Lakshmi, Rahul, Maha`).
