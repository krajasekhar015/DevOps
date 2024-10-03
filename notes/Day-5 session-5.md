### Day-5 Session-5 (16/08/2024)

#### Recap:
- **CRUD Operations**: Create, Read, Update, Delete
  - **Example**: User management in Linux is based on CRUD operations.
---------------------------------------------------------------------
## User Management:
- **Root Access**: Required for administration.
- **Password-Based Authentication**:
  - **Root Access**: `sudo su -`
  - **Create User**: `useradd <user-name>`
  - **Create Group**: `groupadd <group-name>`
  - **View User Info**: `cat /etc/passwd`
  - **View Group Info**: `cat /etc/group`
  - **Primary Group**: `usermod -g <group-name> <user-name>`
  - **Secondary Group**: `usermod -aG <group-name> <user-name>`
  - **Set Password**: `passwd <user-name>`
  - **Display User Info**: `id <user-name>`
  - **Enable Password Authentication**:
    - Edit file: `vim /etc/ssh/sshd_config`
    - Change `PasswordAuthentication` to `yes`
    - Restart SSH: `systemctl restart sshd`
- **Key-Based Authentication**:
  - **Generate Key Pair**: `ssh-keygen -f <user-name>`
  - **Copy Public Key**: `cat <public-key>`
  - **Configure User**:
    - Create `.ssh` directory: `mkdir .ssh`
    - Set permissions: `chmod 700 .ssh`
    - Create file: `touch authorized_keys`
    - Set permissions: `chmod 600 authorized_keys`
    - Change ownership: `chown -R <user-name>:<user-name> .ssh`
    - Paste public key into `authorized_keys`: `vim authorized_keys`
  - **Restart SSH**: `systemctl restart sshd`
  - **Login**: `ssh -i <key-file> <user-name>@<server-ip>`
- **Manage Users**:
  - **Remove from Group**: `gpasswd -d <user-name> <group-name>`
  - **Change Primary Group**: `usermod -g <group-name> <user-name>`
  - **Delete User**: `userdel <user-name>`
---------------------------------------------------------
## Package Management:
- **Installation Process**:
  - Software often has dependencies that need to be installed. Package managers simplify this process.
  - **RPM**: Older package manager.
  - **YUM**: Older tool, succeeded by DNF.
  - **DNF**: Latest package manager.
- **Commands**:
  - **Install Package**: `dnf install <package-name>`
  - **List Installed Packages**: `dnf list installed`
  - **Count Installed Packages**: `dnf list installed | wc -l`
  - **List Available Packages**: `dnf list available`
  - **Count Available Packages**: `dnf list available | wc -l`
  - **Remove Package**: `dnf remove <package-name> -y`
-----------------------------------------------------
## Service Management:
- **Service Lifecycle**:
  1. Start: `systemctl start <service>`
  2. Stop: `systemctl stop <service>`
  3. Restart: `systemctl restart <service>`
  4. Check Status: `systemctl status <service>`
  5. Enable: `systemctl enable <service>`
  6. Disable: `systemctl disable <service>`
- **Example**:
  - **SSH Status**: `systemctl status sshd`
  - **Nginx**:
    - **Install**: `dnf install nginx`
    - **Start**: `systemctl start nginx`
    - **Check Status**: `systemctl status nginx`
    - **Stop**: `systemctl stop nginx`
    - **Enable**: `systemctl enable nginx`
    - **Disable**: `systemctl disable nginx`
- **Security Group Configuration**:
  - **Change Inbound Rules**: Edit inbound rules in AWS Security Group to allow HTTP on port 80.
--------------------------------------------------------
## Process Management:
- **Process**: Sequence of steps to complete a task.
- **Commands**:
  - **List Processes**: `ps`
  - **List All Processes**: `ps -ef`
  - **Search for Process**: `ps -ef | grep <process-name>`
  - **Check Memory Usage**: `top`
  - **Kill Process**:
    - **Request Kill**: `kill <process-id>`
    - **Force Kill**: `kill -9 <process-id>`
- **Foreground vs. Background Processes**:
  - **Foreground**: Blocks terminal (e.g., `sleep 10`)
  - **Background**: Runs in background (e.g., `sleep 100 &`)
----------------------------------------------------------
## Network Management:
- **Network Statistics**:
  - **List Open Ports**: `netstat -l`
  - **List TCP Ports**: `netstat -lt`
  - **List Ports with Process Info**: `netstat -ltp`
  - **List All Ports with Process Info**: `netstat -lntp`

---

