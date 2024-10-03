### Day-21 Session-21 Notes (09/09/2024)

#### Recap:
- **Ansible concepts**  
- **Expense project**  
- **Roles**  

---

### **Ansible Vault:**
- **Purpose:** Ansible Vault provides secure storage for sensitive data such as passwords, encrypting the content to protect it.
- **Commands:**
  - Create a vault:  
    `ansible-vault create credentials.yaml`
  - View vault content:  
    `ansible-vault view credentials.yaml`
  - Edit vault content:  
    `ansible-vault edit credentials.yaml`
  - **Vault password** example: `Admin123` (can be customized).
  
- **Security Consideration:**  
  Only the person administrating the vault has access to the vault password, enhancing security.

- **Configuration:**  
  If any variables in the Ansible configuration aren't decrypted, the system prompts for a vault password.
  
- **Outdated:**  
  Ansible Vault is considered outdated in certain environments. AWS SSM (Systems Manager Parameter Store) is now preferred for managing sensitive data in the cloud.

#### **Why SSM Parameter Store? (Interview Question):**
- Transitioned from **Ansible Vault** to **AWS SSM Parameter Store** because it's more powerful and secure.
- SSM is a better fit for cloud environments than vault.

---

### **Ansible Tags:**
- **Purpose:**  
  Tags allow you to run specific tasks in a playbook rather than executing the entire playbook.
  - Example: In a playbook with 100 tasks, you can use tags to run only 10 specific tasks.
  
- **Use Case:**  
  If a version gets updated, you don’t have to run everything—just the tagged tasks related to that change.

---

### **Ansible Dynamic Inventory:**
- **Static Inventory:**  
  Inventory is generally defined in a static file (`inventory.ini`).

- **Dynamic Inventory:**  
  Essential in cloud environments for auto-scaling. It dynamically fetches IP addresses and instance details at runtime, making it scalable.
  
- **Benefits:**
  - Fetches instance details automatically when servers scale up/down based on traffic.
  - Queries the cloud and dynamically retrieves the required IP addresses.

- **Dynamic Inventory Search Steps:**
  1. Authenticate  
  2. Identify region  
  3. Fetch instance name  
  4. List running instances  
  5. Retrieve private IP addresses
  
  This allows Ansible to dynamically connect to multiple servers without manual intervention.

#### **Connecting to Multiple Servers:**
- **Forks (Parallel Processing):**  
  - By default, Ansible connects to **5 servers at a time** and completes the task.
  - Forks can be modified in the `ansible.cfg` file to handle more servers if needed.

- **Serial Execution:**  
  Use `serial=3` to connect and run the playbook on 3 servers at a time before moving to the next set.

---

### **Ansible vs Terraform:**
- **Ansible:**  
  - **Declarative in structure** but unfit for state management.
  - Primarily used for **Configuration Management** (CM). It handles configuring servers, not creating them.
  - Poor at managing **cloud infrastructure**.

- **Terraform:**  
  - Responsible for **creating cloud infrastructure** like EC2 instances.
  - Ansible is used after the infrastructure is created to configure the servers.

---

