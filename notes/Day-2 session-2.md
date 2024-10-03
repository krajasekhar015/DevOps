
**Day-2 Session-2 Date: 13/04/2024 - Tuesday**
-------------------------------------------------
## Recap

**Topics Covered:**
1. What is DevOps?
2. Waterfall Model vs Agile vs DevOps
3. Software Development Life Cycle (SDLC)
4. What is a Computer?
5. Client-Server Architecture
6. Advantages of Linux

#### Today's Agenda
1. Create a Linux server
2. Connect to it
3. Create a firewall/security group
4. Command syntax
5. Basic commands

---

### Key Concepts

**Authentication Methods:**
1. **What You Know:** Username and password (used in private systems)
2. **What You Have:** Username and tokens (RSA, Authenticator) (used in public systems; popular method)
3. **What You Are:** Biometrics (fingerprints, palm, retina, face, etc.) (used in public systems)

**Example of Key-Based Mechanism:**
- Box (public) and key (private). The key is private and must match the lock to open the box.
- In software, a key-pair consists of a public key and a private key.

**Ports and Protocols:**
- Servers use various protocols on specific ports. For instance, SSH runs on port 22.
- Common ports:
  - SSH: 22
  - HTTP: 80
  - HTTPS: 443
  - MySQL: 3306

**Creating and Using Keys:**
1. **Generate SSH Key Pair:**
   ```
   ssh-keygen -f <file-name>
   ```
   - Example: `ssh-keygen -f linux-key` creates `linux-key` (private key) and `linux-key.pub` (public key).

2. **Connect to Linux Server via SSH:**
   - Syntax: `ssh -i <private-key-path> ec2-user@<IP-address>`
   - Example: `ssh -i linux-key.pem ec2-user@18.232.86.62`

**Connecting to Linux Server via Git Bash:**
1. **Syntax to Connect:**
   ```
   ssh -i <private-key-file> ec2-user@<IP-address>
   ```
   - Example: `ssh -i linux-key.pem ec2-user@18.232.86.62`
   - `-i` specifies the private key file to use.

2. **Git Bash and Key Files:**
   - Private keys usually have a `.pem` extension.
   - Public keys have a `.pub` extension.

---

### Commands and Operations

**Basic Commands:**
1. **Present Working Directory:**
   ```
   pwd
   ```
   - Displays the current directory path.

2. **Change Directory:**
   ```
   cd <directory-path>
   ```
   - Example: `cd /home/ec2-user` moves to the `/home/ec2-user` directory.

3. **Clear Screen:**
   ```
   clear
   ```
   - Clears the terminal screen.

4. **List Files:**
   ```
   ls -l
   ```
   - Lists files with detailed information.

5. **List Files with Time-Based Sorting:**
   ```
   ls -lt
   ```
   - Lists files based on time, with the latest files on top.

6. **List Files with Reverse Time Sorting:**
   ```
   ls -ltr
   ```
   - Lists files based on time, with the latest files at the bottom.

7. **List All Files (including hidden):**
   ```
   ls -la
   ```
   - Lists all files including hidden files (files starting with `.`).

8. **Display File Contents:**
   ```
   cat <file-name>
   ```
   - Example: `cat devops.txt` displays the contents of `devops.txt`.

9. **Create a New File:**
   ```
   touch <file-name>
   ```
   - Example: `touch newfile.txt` creates an empty file named `newfile.txt`.

10. **Remove a File:**
    ```
    rm <file-name>
    ```
    - Example: `rm oldfile.txt` deletes `oldfile.txt`.

11. **Create a Directory:**
    ```
    mkdir <directory-name>
    ```
    - Example: `mkdir newdir` creates a new directory named `newdir`.

12. **Remove an Empty Directory:**
    ```
    rmdir <directory-name>
    ```
    - Example: `rmdir emptydir` removes the directory `emptydir` if it is empty.

13. **Remove a Directory and Its Contents:**
    ```
    rm -r <directory-name>
    ```
    - Example: `rm -r olddir` removes the directory `olddir` and all of its contents.

14. **Rename/Move a File or Directory:**
    ```
    mv <old-name> <new-name>
    ```
    - Example: `mv oldfile.txt newfile.txt` renames `oldfile.txt` to `newfile.txt`.

**Paths:**
- **Absolute Path:** Specifies the complete path from the root directory.
  ```
  cd /home/ec2-user
  ```
- **Relative Path:** Specifies the path relative to the current directory.
  ```
  cd ..
  ```

**Additional Notes:**
- **Appending Content to a File:**
  ```
  cat >> <file-name>
  ```
  - Example: `cat >> devops.txt` appends text to `devops.txt`.

- **Viewing and Editing Files with VI Editor:**
  - **Undo:** `u`
  - **Go to Bottom:** `Shift+g`
  - **Go to Top:** `gg`
  - **Copy Line:** `yy`
  - **Paste:** `p`
  - **Delete Line:** `dd`

- **File Permissions Representation:**
  - `-rw-r--r--`:
    - `-` - File type
    - `rw-` - User permissions
    - `r--` - Group permissions
    - `r--` - Others permissions

- **Change File Permissions:**
  - **Add Permissions:**
    ```bash
    chmod o+w <file-name>
    ```
  - **Remove Permissions:**
    ```bash
    chmod o-rwx <file-name>
    ```
  - **Give All Permissions to All Members:**
    ```bash
    chmod ugo+rwx <file-name>
    ```

---
