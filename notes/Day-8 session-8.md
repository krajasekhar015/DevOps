**Day-8, Session-8 (22/08/2024)**
----------------------------------
**Organized Notes**

### **Recap**

1. **AWS EC2 Instances**
   - **Open AWS Console**: Navigate to EC2 and launch instances.
   - **Create Three Instances**:
     - **Database Server**
     - **Backend Server**
     - **Frontend Server**
   - **Configurations**:
     - **No Key Pair**
     - **Allow All Traffic**

2. **Database Server Setup**
   - **Connect using Super Putty**:
     - Use the private IP address of the Database Server.
   - **Commands**:
     ```bash
     sudo su -
     dnf install mysql-server -y
     systemctl enable mysqld
     systemctl start mysqld
     mysql_secure_installation --set-root-pass ExpenseApp@1
     netstat -lntp
     ```
   - **Verify**: Check that the port is open and MySQL is running.

3. **Backend Server Setup**
   - **Connect using Super Putty**:
     - Use the public IP address of the Backend Server.
   - **Commands**:
     ```bash
     sudo su -
     dnf module disable nodejs:18 -y
     dnf module enable nodejs:20 -y
     dnf install nodejs -y
     ```
   - **Application Configuration**:
     - **Create User and Directory**:
       ```bash
       useradd expense
       mkdir /app
       curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip
       cd /app
       unzip /tmp/backend.zip
       npm install
       ```
     - **Service Configuration**:
       ```bash
       vim /etc/systemd/system/backend.service
       ```
       - **Service File Content**:
         ```
         [Unit]
         Description = Backend Service

         [Service]
         User=expense
         Environment=DB_HOST="<MYSQL-SERVER-IPADDRESS>"
         ExecStart=/bin/node /app/index.js
         SyslogIdentifier=backend

         [Install]
         WantedBy=multi-user.target
         ```
     - **Note**: The IP address may change, necessitating automation solutions like DNS.

4. **DNS (Domain Name System)**
   - **Concept**:
     - Maps domain names to IP addresses, simplifying server connections.
   - **Example**:
     - **Analogy**: Similar to remembering names on contacts rather than numbers.
   - **How DNS Works**:
     - **Domain Purchase**: Register through services like GoDaddy, Hostinger, AWS, Azure, GCP.
     - **Hostinger**:
       - Affordable domain registration.
       - Example Domain: `daws81s.online`
       - **Steps**:
         - Sign up, search, and purchase a unique domain.
         - Register for one year, manage auto-renewal settings.

5. **DNS Resolution Process**
   - **Understanding**:
     - Computers use IP addresses; humans use domain names.
   - **DNS Resolution Steps**:
     - Browser cache checks for IP address.
     - OS cache checks.
     - If not cached, ISP DNS resolver is contacted.
     - **Root Servers**:
       - 13 root servers globally, manage top-level domains (TLDs).
       - Root servers direct resolver to appropriate TLD servers.
     - **TLD Servers**:
       - Example: `.com`, `.online`, `.org`.
       - TLD server provides IP address of the domain (e.g., `facebook.com`).

6. **Domain Management**
   - **Updating DNS Records**:
     - **A Record**:
       - Maps a domain name to an IP address.
       - Update the A record in Hostinger to point to your server’s IP address.
       - **Example**: `daws81s.online` with a new IP.
     - **Checking Records**:
       ```bash
       nslookup daws81s.online
       ```

7. **Frontend Server Setup**
   - **Connect using Super Putty**:
     - Use the public IP address of the Frontend Server.
   - **Commands**:
     ```bash
     sudo su -
     dnf install nginx -y
     systemctl enable nginx
     systemctl start nginx
     rm -rf /usr/share/nginx/html/*
     curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
     cd /usr/share/nginx/html
     unzip /tmp/frontend.zip
     vim /etc/nginx/default.d/expense.conf
     ```
     - **Nginx Configuration**:
       ```
       proxy_http_version 1.1;

       location /api/ { proxy_pass http://backend.daws81s.online:8080/; }

       location /health {
         stub_status on;
         access_log off;
       }
       ```
     - **Create DNS Record in Route 53**:
       - **Record Name**: `backend`
       - **Type**: `A`
       - **TTL**: Time to live

8. **Important Points for Interviews**
   - **DNS**: Domain Name System, resolves domain names to IP addresses.
   - **Nameservers**: Manage DNS records for a domain.
   - **A Record**: It maps IP address to our domain 
   - **DNS Functionality**: Involves querying root servers, TLD servers, and authoritative DNS servers.

9. **Route 53 Integration**
   - **Domain Management**:
     - Transfer domains to Route 53 for centralized DNS management.
     - **Steps**:
       - Create hosted zone in Route 53.
       - Update nameservers in Hostinger to those provided by Route 53.
   - **Advantages**:
     - AWS manages the domain and DNS settings, streamlining updates.

10. **Data Loading**
    - **Load Database Schema**:
      ```bash
      dnf install mysql -y
      mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pExpenseApp@1 < /app/schema/backend.sql
      ```
    - **Service Management**:
      ```bash
      systemctl daemon-reload
      systemctl start backend
      systemctl enable backend
      netstat -lntp
      ```

#### **Small Assignment**
1. **Book a Domain**: Register a new domain.
2. **Understand 'A' Record**: Learn its role in DNS.
3. **Install Nginx**: Ensure it displays a welcome page with your domain name.

#### **Additional Points**
- **Proxy Types**:
  - **Frontend Proxy**: Acts on behalf of clients, generally handles incoming requests.
  - **Reverse Proxy**: Acts on behalf of servers, handles incoming traffic and directs it to appropriate backend servers.

