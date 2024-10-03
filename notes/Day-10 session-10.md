**Day 10 - Session 10 (23/08/2024)**
---------------------------------------
### Manual Command Execution
**Disadvantages:**
1. **Human Errors:** Increased chances of mistakes.
2. **Time-Consuming Process:** Each command needs to be executed individually.

## Introduction of Shell Scripting:
- Shell scripting emerged as a solution to automate command execution, reducing human errors and saving time.

#### Storing Shell Scripts
**Challenges when storing scripts on company laptops or other sources:**
1. **Security Issues:** Sensitive data can be compromised.
2. **Collaboration Issues:** Difficulties in sharing and collaborating on scripts.

**Solution:** Store scripts in GitHub to mitigate these challenges.


## Introduction to Git

**What is Git?**
- **Decentralized Source Code Management:** Git is a version control system that allows multiple people to work on the same codebase without conflicts.
- **Single Source of Truth:** Git ensures that everyone is working with the same version of code.

**GitOps:** Git serves as the central repository for all development and operations work, making it the single source of truth in DevOps practices.

**Centralized vs. Decentralized Architecture:**
- **Centralized Example:** A city (Delhi) handling all imports/exports for the country, leading to a single point of failure.
- **Decentralized Example:** Multiple cities (Chennai, Bangalore, Kolkata, etc.) handling imports/exports, ensuring that the system remains functional even if one city fails.

**Disadvantages of Centralized Systems:**
1. **Single Point of Failure:** If the central location fails, the entire system is compromised.
2. **Limited Accessibility:** Access and development are restricted to one location.
3. **Economic and Social Imbalances:** Uneven development and distribution of resources.

**Advantages of Decentralized Systems:**
1. **No Single Point of Failure:** If one location fails, others continue functioning.
2. **Distributed Development:** Resources and development efforts are spread across multiple locations.
3. **Improved Accessibility:** Easier access to resources and development.

**Git's Decentralized Architecture:** 
- Each computer connected to a repository has a local copy of the entire codebase, making it easy to restore the system from any computer.

**Key Terms:**
- **Repository:** A storage location for code.
- **Clone:** The process of downloading a repository to your local machine.
- **GitHub:** A platform to host Git repositories.

**Git Command Examples:**
- **Clone a Repository:** `git clone <URL>`
- **Check Status:** `git status`
- **Add Files:** `git add <file-name>` or `git add .` (to add all files)
- **Commit Changes:** `git commit -m "Commit message"`
- **Push to Remote Server:** `git push origin main`

**Git Configuration:**
```bash
git config --global user.email "lakshmimungara2997@gmail.com"
git config --global user.name "Maha Lakshmi"
```

**GitHub Token Setup:**
1. Go to GitHub settings.
2. Navigate to Developer settings.
3. Generate a new personal access token.

### Creating a Linux Instance on AWS
1. **Create an EC2 Instance:**
   - Choose Red Hat as the OS.
   - Select `t3.micro` as the instance type.
   - Name the instance and allow all connections.

2. **Shell Scripting Basics:**
   - **Shebang (`#!/bin/bash`)**: The first line in a shell script, specifying the script interpreter.
   - **Print Command:** `echo "Hello World!"`
   - **Running Scripts:** `sh <script-name>`, `bash <script-name>`, or `./<script-name>` (requires execute permission).

3. **Git Commands on Linux:**
   - Clone repository: `git clone <HTTPS URL>`
   - Pull changes: `git pull`

**Best Practices:**
- **DRY (Don't Repeat Yourself):** Centralized updates ensure that changes are propagated everywhere, reducing errors and improving efficiency.

---

### Shell Scripting Concepts

**Variables:**
- **Syntax:** `VAR_NAME=VALUE` (no spaces around `=`)
- **Accessing Variables:** Use `$VAR_NAME`
- **Variable Declaration Methods:**
  1. Inside the script.
  2. Passed as arguments.
  3. Entered at runtime using the `read` command.

**Data Types:**
- Integer, Float, String, Array, etc.

**Combined Git Commands:**  
Execute the following in one line:
```bash
git add . ; git commit -m "Commit message" ; git push origin main
```
