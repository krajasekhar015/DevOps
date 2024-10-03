Day-7 Session-7 (20/08/2024) 
----------------------------
Recap
------
## EC2 Setup
1. **Instances**: Created 2 instances named database-server and backend-server.
- AMI: Redhat
- Key Pair: None
- Security Group: Allow-all
- Launch Instance
  
**Database Server Setup**:
1. **Connect:**
```
ssh ec2-user@<IP address>
sudo su -
```
2. **Install MySQL Server:**
```
dnf install mysql-server -y
```
 **Start MySQL**:
 
- > enabling database-server
```
systemctl enable mysqld 
```
- > starting the database-server
```
systemctl start mysqld
```
- **Set Root Password:**
```
mysql_secure_installation --set-root-pass ExpenseApp@1
```
- **Check MySQL Status:**
```
systemctl status mysqld
```
- **Check Ports:**
```
netstat -lntp
```
- **Check Process:**
```
ps -ef | grep mysql
```

**MySQL Commands:**
------------------
```
mysql
show databases;
use <DB>;
show tables;
select * from <table-name>;
```
**Backend Server Setup**
1. **Connect** using Putty and Super Putty
- **Putty:** Save session and load with IP address.
- **Super Putty:** Allows multiple windows.
  
2. **Node.js:**
- **Dependencies**: Listed in **package.json.**
- **Build Tool**: npm
```
dnf install nodejs -y
dnf module list nodejs
dnf module disable nodejs:18 -y
dnf module enable nodejs:20 -y
```
**Configure Application User:**
```
useradd expense
mkdir /app
curl -o /tmp/backend.zip <URL>
cd /tmp
cd /app
unzip /tmp/backend.zip
cd /app
npm install
```

- **Create and Configure Service:**
```
vim /etc/systemd/system/backend.service
```

- **Service File:**
```
[Unit]
Description = Backend Service

[Service]
User=expense
Environment = DB_HOST="<MYSQL-SERVER-IPADDRESS>"
ExecStart=/bin/node /app/index.js
SyslogIdentifier=backend

[Install]
WantedBy=multi-user.target
```
```
systemctl daemon-reload
systemctl start backend
systemctl enable backend
systemctl status backend
```
- **Check Logs:**
```
less /var/log/messages
```
- **Database Schema Setup:**
```
mysql -h <Mysql server IP address> -uroot -pExpenseApp@1 < /app/schema/backend.sql
```
3. **Check Backend Connection:**

**Ping DB:**
```
ping <DB private IP address>
```
**Telnet DB Port:**
```
telnet <DB private IP address> 3306
```

**Frontend Server Setup**
-----------------------
- EC2 Instance
- Launch: devops-practice, Redhat, t3.micro, without key_pair, allow-all.
  
- **Nginx Setup:**
```
sudo su -
dnf install nginx -y
systemctl start nginx
systemctl enable nginx
```
- **Configuration:**
```
vim /etc/nginx/default.d/expense.conf
```
**Configuration File:**
```
proxy_http_version 1.1;

location /api/ { proxy_pass http://<private IP of backend>:8080/; }

location /health {
  stub_status on;
  access_log off;
}
```
**Deploy Frontend:**
```
cd /usr/share/nginx/html/
rm -rf *
curl -o /tmp/frontend.zip <URL>
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
```
- **Verify**: Access via public IP address of frontend server.

**Troubleshooting**
**Restart Backend:**
```
systemctl restart backend
```
**Check Data:**
```
show databases;
use transactions;
show tables;
select * from transactions;
```
> **Note**: Web server acts as an interface to see and enter data, which is processed by the app server and stored in the database.
