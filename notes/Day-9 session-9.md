 **Day-9 Session-9 (22/08/2024)**
 --------------------------------
 **Recap and Notes**

#### Domain and DNS Overview
1. **Domain Creation**
   - Creating a domain involves registering it through a domain registrar.

2. **Domain Transfer through Route 53 Hosted Zone**
   - When transferring a domain, the hosted zone's keys should not be deleted. Deleting the hosted zone can cause delays in DNS updates as nameservers need time to propagate.

3. **Updating Nameservers in Hostinger**
   - After transferring a domain, ensure that the nameservers are updated in your hosting provider (like Hostinger) to reflect the new configuration.

4. **DNS Resolution Process**
   - **Browser Cache** → **Operating System Cache** → **ISP DNS Resolver** → **Root Servers** → **TLD Information** → **TLD Nameservers** → **Nameservers** → **Records**
   - **Domain Register** updates nameservers to TLD (Top-Level Domain) for resolution.

5. **Types of DNS Records**
   - **A Record**: Maps a domain to an IP address.
   - **CNAME Record**: Maps a domain to another domain name.
   - **MX Record**: Specifies mail servers for the domain.
   - **SOA Record**: Contains authorization information about the domain.
   - **TXT Record**: Used for validation purposes, such as SPF records.
   - **NS Record**: Defines the domain's nameservers.

#### Proxy Types
1. **Forward Proxy**
   - **Definition**: A client-side proxy that the client is aware of. It handles requests on behalf of the client.
   - **Use Case**: To access restricted content, change geo-location, hide client identity, monitor traffic, secure connections, restrict content, and cache data.
   - **Example**: VPN (Virtual Private Network) allows access to content that might be restricted in certain regions.

2. **Reverse Proxy**
   - **Definition**: A server-side proxy that the client is not aware of. It manages requests from clients to servers.
   - **Use Case**: Provides security between client and server, load balancing, and SSL termination.
   - **Example**: **Nginx** is a popular reverse proxy and load balancer. In AWS, **ALB (Application Load Balancer)** is backed by Nginx.

#### Nginx Configuration
1. **Configuration Files**
   - Default configuration file: `/etc/nginx/nginx.conf`
   - Additional configurations can be included from: `/usr/share/nginx/modules/*.conf`

2. **Website Folder Location**
   - Default website root: `/usr/share/nginx/html`
   - Default file: `index.html`

3. **Logs Location**
   - Logs can be found in: `/var/log/nginx/` (Update from `/var/logs/messages` as it's more specific).

4. **Upstream Servers**
   - **Definition**: Defines backend servers for load balancing.
   - Example Configuration:
     ```nginx
     upstream backend {
         server 172.31.44.24;
         server 172.31.37.74;
     }
     ```
   - **Proxy Configuration**:
     ```nginx
     proxy_http_version 1.1;
     location / {
         proxy_pass http://backend/;
     }
     location /health {
         stub_status on;
         access_log off;
     }
     ```

#### Linux Folder Structure
1. **Essential Directories**
   - `/`: Root directory of the OS.
   - `/bin`: Essential commands (e.g., `ls`, `cat`).
   - `/sbin`: System binaries (e.g., `reboot`, `iptables`).
   - `/boot`: Boot configuration files.
   - `/dev`: Device files.
   - `/etc`: System and service configuration files.
   - `/home`: Home directories for users.
   - `/lib`: Libraries required by OS.
   - `/lib64`: 64-bit libraries.
   - `/media`: Media devices (e.g., USBs).
   - `/mnt`: Mount points for additional disks.
   - `/opt`: Optional third-party applications.
   - `/proc`: Process and system information (e.g., `/proc/cpuinfo`).
   - `/root`: Root user’s home directory.
   - `/run`: Runtime information.
   - `/srv`: Service files.
   - `/swap`: Swap space.
   - `/sys`: Kernel and device information.
   - `/tmp`: Temporary files.
   - `/usr`: Shared files and documentation.
   - `/var`: Variable data such as logs.

2. **Important Commands**
   - **Check RAM Usage**: `free -m`
   - **Check Disk Usage**: `df -hT`
   - **View Processes**: `top`
   - **Command History**: `history`

#### Shell Scripting
1. **Definition**
   - Shell is an interpreter that executes user commands (e.g., `/bin/bash`).

2. **Shell Scripting Basics**
   - Write commands in a file to automate tasks.
   - Example Workflow for Installing a Package:
     - Check for root access.
     - Verify if the package is already installed.
     - Install the package if not present.
     - Confirm installation success.

3. **Error Handling**
   - Scripts should handle errors by checking the success of each command and providing feedback to the user if something goes wrong.

4. **Script Storage**
   - Scripts and configurations are typically stored in repositories like GitHub.

---

