
**Day-1 session-1 (12/08/2024)**
----------------------------------
#### What is DevOps?

Example: ***School Management System***
- **Historical Context:**
  - **50 Years Ago:**
    - System stakeholders: Students, teachers, parents.
    - Final exam with a pass percentage of 20-30%.
    - Problems: Lack of seriousness from students, teachers, and parents.

  - **30 Years Ago:**
    - Introduction of unit tests, quarterly exams, and pre-finals.
    - Improved pass percentage through continuous assessment:
      - Unit Test 1: 30% pass
      - Unit Test 2: 31%
      - Final Exam: 80% pass
    - Continuous improvement through regular assessments and feedback.

  - **10 Years Ago:**
    - Addition of slip tests and numerous exams (200 exams over 300 days).
    - Allowed better analysis of student behavior and significant increase in pass percentage (99%).

**Software Development Life Cycle (SDLC):**
1. **Requirement Gathering:**
   - Collecting and documenting what is needed for the project.
   - Example: A restaurant needs an online ordering system.

2. **Planning:**
   - Creating a roadmap and schedule for project execution.

3. **Design:**
   - Structuring the software, creating wireframes, and defining user interfaces.

4. **Development:**
   - Coding and building the software based on the design.

5. **Deployment:**
   - Releasing the software to a live environment.

6. **Testing:**
   - Checking for bugs and ensuring functionality meets requirements.

7. **Maintenance:**
   - Ongoing support and updates to the software.

**Waterfall Model:**
- **Characteristics:**
  - Linear and sequential development process.
  - Stakeholders: Customers, developers, testers, managers.
  - Challenges: Long development cycles (e.g., 2 years), delayed feedback, and difficulty in managing defects.

**Agile Model:**
- **Characteristics:**
  - Incremental development with sprints.
  - Breaking down projects into smaller modules.
  - Example modules for a restaurant application:
    - User management (sign-up, login, password management)
    - Product management (listing products, prices)
    - Cart management (adding items to cart)
    - Shipping (adding addresses)
    - Payment processing
    - Order management
  - Continuous feedback and iterative improvements.

**DevOps:**
- **Characteristics:**
  - Integration of development (Dev) and operations (Ops) teams.
  - Continuous Integration/Continuous Deployment (CI/CD):
    - Code is built, tested, and deployed in small, frequent updates.
  - Enhances collaboration and automates processes.
  - Tools: Jenkins, GitLab CI, CircleCI, etc.

**Real Meaning of DevOps:**
- **Concept:**
  - Facilitates faster releases and fewer defects through continuous improvement.
  - Emphasizes cooperation between development and operations teams.
  - Includes practices like DevSecOps (adding security) and GitOps (managing infrastructure through Git).

---

### Commands and Operations

**General Commands in Linux:**

1. **Present Working Directory:**
   ```bash
   pwd
   ```
   - **Explanation:** Displays the current directory path.
   - **Additional Context:** Use this command to know where you are in the directory structure.

2. **Change Directory:**
   ```bash
   cd <directory-path>
   ```
   - **Explanation:** Navigates to a different directory.
   - **Example:** `cd /home/user` moves to the `/home/user` directory.
   - **Additional Context:** Use `cd ..` to move up one directory level.

3. **Clear Screen:**
   ```bash
   clear
   ```
   - **Explanation:** Clears the terminal screen.
   - **Additional Context:** Useful for decluttering the terminal view.

4. **List Files:**
   ```bash
   ls -l
   ```
   - **Explanation:** Lists files with detailed information such as permissions, owner, and size.
   - **Additional Context:** Use `ls -a` to list all files, including hidden ones.

5. **List Files with Time-Based Sorting:**
   ```bash
   ls -lt
   ```
   - **Explanation:** Lists files sorted by modification time, with the newest files first.
   - **Additional Context:** Useful for viewing recently modified files.

6. **List Files with Reverse Time Sorting:**
   ```bash
   ls -ltr
   ```
   - **Explanation:** Lists files sorted by modification time, with the oldest files first.
   - **Additional Context:** Useful for seeing the history of file changes.

7. **List All Files (Including Hidden):**
   ```bash
   ls -la
   ```
   - **Explanation:** Lists all files, including hidden files.
   - **Additional Context:** Hidden files start with a dot (`.`), such as `.bashrc`.

8. **Display File Contents:**
   ```bash
   cat <file-name>
   ```
   - **Explanation:** Displays the contents of a file.
   - **Example:** `cat example.txt` shows the content of `example.txt`.

9. **Create a New File:**
   ```bash
   touch <file-name>
   ```
   - **Explanation:** Creates a new empty file.
   - **Example:** `touch newfile.txt` creates an empty file named `newfile.txt`.

10. **Remove a File:**
    ```bash
    rm <file-name>
    ```
    - **Explanation:** Deletes a file.
    - **Example:** `rm oldfile.txt` removes `oldfile.txt`.

11. **Create a Directory:**
    ```bash
    mkdir <directory-name>
    ```
    - **Explanation:** Creates a new directory.
    - **Example:** `mkdir newdir` creates a directory named `newdir`.

12. **Remove an Empty Directory:**
    ```bash
    rmdir <directory-name>
    ```
    - **Explanation:** Deletes an empty directory.
    - **Example:** `rmdir emptydir` removes `emptydir` if it’s empty.

13. **Remove a Directory and Its Contents:**
    ```bash
    rm -r <directory-name>
    ```
    - **Explanation:** Recursively removes a directory and its contents.
    - **Example:** `rm -r olddir` deletes `olddir` and everything inside it.

14. **Rename/Move a File or Directory:**
    ```bash
    mv <old-name> <new-name>
    ```
    - **Explanation:** Renames or moves a file or directory.
    - **Example:** `mv oldfile.txt newfile.txt` renames `oldfile.txt` to `newfile.txt`.

**File Permissions Representation:**
- **Example:** `-rw-r--r--`
  - `-` - File type
  - `rw-` - User permissions (read and write)
  - `r--` - Group permissions (read only)
  - `r--` - Others permissions (read only)

**Change File Permissions:**
- **Add Permissions:**
  ```bash
  chmod o+w <file-name>
  ```
  - **Explanation:** Adds write permissions for others.
  - **Additional Context:** `o` refers to others; `+w` adds write permissions.

- **Remove Permissions:**
  ```bash
  chmod o-rwx <file-name>
  ```
  - **Explanation:** Removes all permissions for others.
  - **Additional Context:** `o-rwx` removes read, write, and execute permissions.

- **Give All Permissions to All Members:**
  ```bash
  chmod ugo+rwx <file-name>
  ```
  - **Explanation:** Grants read, write, and execute permissions to user, group, and others.
  - **Additional Context:** `ugo` stands for user, group, and others.

---

### Related Concepts

**Computer Characteristics:**
- **Components:**
  - **CPU (Processor):** Executes instructions.
  - **RAM (Memory):** Temporary storage for active processes.
  - **OS (Operating System):** Manages hardware and software resources.
  - **ROM (Storage):** Permanent storage for data.

- **Devices:**
  - **Server:** Used for deploying applications. Can be a physical machine or virtual instance.
  - **Mobile and TV:** Also can be considered computers with different uses.

**Client-Server Architecture:**
- **Client:** Requests services (e.g., a web browser).
- **Server:** Provides services (e.g., a web server).

**Operating Systems:**
- **Unix vs. Linux:**
  - **Unix:** Closed source, proprietary.
  - **Linux:** Open source, customizable, and widely used in servers.

**Cloud Services and DevOps:**
- **Cloud:** Provides scalable and on-demand resources.
- **DevOps:** Enhances collaboration between development and operations, automating deployment and integration processes.
- **AWS Account Setup:**
  - Use private banks, enable international and online usage, and ensure account details match your bank card information.

---

