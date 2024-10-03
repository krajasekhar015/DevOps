**Day-16 session-16(02/09/2024)**
### Shell Scripting Recap:
- **Topics Covered:**
  - Variables
  - Loops
  - Conditions
  - Functions
  - Datatypes
- **Practice:**
  - Writing basic shell scripts.
  - Worked on scripts for handling variables, backup use cases, and other examples.
  - Completed the **Expense Project** using shell scripting.
- **Configuration Management:**
  - Managed a plain server without any additional installations.

#### Disadvantages of Shell Scripting:
1. **Not Idempotent** – Can't guarantee repeated runs will yield the same result.
2. **Error Handling** – Limited error handling mechanisms.
3. **Homogeneous** – Typically works on the same type of system, difficult for varied environments.
4. **Not Scalable** – Difficult to manage across multiple servers.
5. **Complex Syntax** – Can be hard to understand and maintain.

#### Overcoming These Limitations with Configuration Management Tools:
- Tools like Puppet, Chef, Rundeck, and **Ansible** address the limitations.
- **Ansible** stands out due to its **push-based architecture**.

---

### Ansible Overview:
- **Push vs Pull Architecture:**
  - **Push**: Ansible pushes the configuration to nodes.
  - **Pull**: Other tools like Puppet pull configurations from the server.
  
- **Inventory:**
  - A list of servers Ansible connects to and manages.
  
- **Adhoc Commands:**
  - Used for quick tasks or emergencies, without needing playbooks.

---

### Ansible Playbook:
- A **playbook** is a collection of tasks or modules grouped into a play.
- In Ansible, **modules** perform specific tasks (like commands in shell scripting).
  
#### Sample Playbook (Ping Module):
```yaml
- name: ping the server
  hosts:    # Specify which hosts to connect to
  tasks:    # List of tasks/modules
  - name: ping the server
    ansible.builtin.ping:
```

- **Create Two Servers:**
  - One as the **Ansible Control Node**, and another as the **Ansible Managed Node**.

---

### Inventory File Example:
- **File:** `inventory.ini`
```ini
192.168.1.1
192.168.1.2
```
- Group servers by roles (backend, frontend, database, etc.).
- Run playbooks with the inventory file:
```bash
ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 01-ping.yaml
```

---

### Installing and Running Nginx via Ansible:
```yaml
- name: nginx install and run
  hosts: web
  become: yes   # for sudo access
  tasks:
   - name: install nginx
     ansible.builtin.package:
      name: nginx
      state: present

   - name: run nginx
     ansible.builtin.service:
      name: nginx
      state: started
      enabled: yes
```
- **Package module** is **heterogeneous** and works across different distributions.
  
---

### Variables in Ansible:
- Variables are used in Ansible to store data, similar to other programming languages.
- Syntax to declare variables in Ansible:
```yaml
course: "devOps with AWS"
duration: "120HRS"
Name: "maha lakshmi"
```
- To use a variable, wrap it in `{{}}`:
```yaml
- name: Display course details
  debug:
    msg: "Course: {{ course }} for {{ duration }}"
```

#### Command to Prompt for Variables:
- Use `vars_prompt` to get input from the user during playbook execution.

#### Example of Variables in Inventory File:
```ini
[web:vars]
COURSE="Ansible"
DURATION="10hrs"
LEARNER="mahalakshmi"
```

---

### Types of Variables in Ansible:
1. **Play Level Variables**: Defined for the entire play.
2. **Task Level Variables**: Specific to individual tasks.
3. **Variables from Files**: Loaded from external files.
4. **Variables from Prompts**: Input by the user during play execution.
5. **Variables from Inventory**: Defined in the inventory file.
6. **Variables from Command Line/Args**: Passed during the playbook run.

---
