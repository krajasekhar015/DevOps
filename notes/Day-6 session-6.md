**Day-6 Session-6 (19/08/2024)**
----------------------------------

**Recap**:

#### User Management
1. Creating Users
2. Enabling Password-Based Authentication
3. Enabling Key-Based Authentication
4. Primary and Secondary Groups

#### Package Management
- `yum` → `dnf`
- `dnf install`
- `dnf list installed`

#### Service Management
1. Start the Service
2. Stop the Service
3. Check Service Status: `systemctl status <service>`
4. Enable Service
5. Disable Service

#### Process Management
1. `ps -ef | grep <process>`
2. Foreground Process
3. Background Process

#### Network Management
- `netstat -lntp`

### Project: Introduction

#### Desktop Applications vs. Web-Based Applications

**Disadvantages of Desktop Applications:**
1. Installation Required
2. Storage Maintenance
3. Upgrades Needed
4. Problem Fixes
5. Single System Dependency
6. Risk of Data Loss on System Crash
7. System Resource Usage

**Advantages of Web-Based Applications:**
1. No Installation
2. No Upgrades
3. No Compatibility Issues
4. No Storage Issues
5. Accessible Everywhere

**Architecture:**
- **1-Tier Architecture:** Web-Based Applications
- **3-Tier Architecture:**
  - **Web Tier (Frontend):** Load Balancers, Web Servers (HTML, CSS, JavaScript, AngularJS, ReactJS, ExpressJS, jQuery)
  - **App Tier (Backend):** App Servers (Java, Python, NodeJS, .NET, Go, C#)
  - **Data Tier (Database):** DB Servers (MySQL, MSSQL, Oracle, PostgreSQL, MongoDB, Redis)

**Example:**
- **Web Server:** Converts data into HTML format.
- **App Server:** Handles SQL queries and application logic.
- **Database Server:** Stores raw data.

### AWS Account and EC2 Instance Setup

1. **Launch EC2 Instance:**
   - **AMI:** Search for `devops-practice` → Community AMIs → Select Redhat (RHEL-9-DevOps-Practice)
   - **Instance Type:** `t3.micro`
   - **Key Pair:** None (username and password only)
   - **Security Group:** Create security group (Allow-All)
     - **Description:** Allow all traffic from all IPs
     - **Inbound Rules:** Select All traffic → Source: `0.0.0.0/0`

2. **Connect to EC2 Instance:**
   - **Username:** `ec2-user`
   - **SSH Command:** `ssh ec2-user@<IP>`
   - **Password:** `DevOps321`

### Database Server Setup

1. **Install MySQL:**
   - `dnf install mysql-server`

2. **Start and Manage MySQL Service:**
   - Start: `systemctl start mysqld`
   - Status: `systemctl status mysqld`
   - Enable: `systemctl enable mysqld`

3. **Check Port and Process:**
   - Port: `netstat -lntp`
   - Process: `ps -ef | grep mysqld`

4. **Set MySQL Root Password:**
   - Command: `mysql_secure_installation --set-root-pass <password>`

5. **Connect to MySQL:**
   - **Client Inside Server:** `mysql -u root -p<password>`
   - **Client Outside Server:** `mysql -h <IP> -u root -p<password>`

6. **Database Operations:**
   - List Databases: `show databases;`
   - Use Database: `use <database-name>;`
   - Show Tables: `show tables;`
   - Query Table: `select * from <table-name>;`

**Schemas:**
- User-related Information: `user` schema
- Posts-related Information: `posts` schema
- Videos-related Information: `videos` schema

**Note:** MySQL is a Database Server.
