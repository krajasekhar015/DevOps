**Day-17 session-17(03/09/2024)**

### Ansible Overview:
- **Ansible** is a powerful configuration management tool with a **push-based architecture**.
- **Ansible Server**: The system where Ansible is installed.
- **Ansible Nodes**: Systems managed by the Ansible server.

---

### Types of Variables in Ansible:
1. **Play Level Variables**: Variables defined for the entire play.
2. **Task Level Variables**: Variables specific to a task.
3. **Variables from Files**: Loaded from external files.
4. **Variables from Prompt**: Collected from the user during playbook execution.
5. **Command Line Args**: Variables passed via command line (highest priority).
6. **Inventory Variables**: Variables defined within the inventory file.

- **Command line args** have the highest priority.

---

### Ansible Inventory:
- The **inventory file** lists all the hosts the Ansible server connects to.
- Example:
```ini
# Ungrouped Hosts
190.168.1.1
190.168.1.2
190.168.1.3

[web]
172.31.38.222  # Ansible node private IP

[web:vars]
COURSE="Ansible from inventory"
DURATION="10hrs"
LEARNER="mahalakshmi"

# Backend group
[backend]
190.168.1.4
190.168.1.5
190.168.1.6

# MySQL group
[mysql]
190.168.1.7
190.168.1.8
190.168.1.9

# Group of groups
[servers:children]
web
backend

[all:vars]  # Variables for all servers
ansible_user=ec2-user 
ansible_password=DevOps321
```

- Command to list hosts in a specific group:
```bash
ansible -i inventory.ini <group-name> --list-hosts
```

---

### Data Types in Ansible:
- **String**: Text values.
- **Number**: `int`, `float`, `double`, `decimal`, `long`, etc.
- **Boolean**: `true`/`false`.
- **List**: `[]` to define a list.
- **Map**: `{}` to define a key-value structure.

- Ansible is developed using the **Python** programming language.
- Playbooks can be run on the **localhost** if the target is the Ansible server itself:
  ```yaml
  hosts: localhost
  connection: local  # No username or password required
  ```

---

### Conditions in Ansible:
- **Conditions** are used to decide if a task/module should be executed or not.
- The keyword used in Ansible for conditions is **"when"** (instead of `if`).

#### Example Use Case: Creating an Expense User
1. Check if the user **"expense"** exists.
2. If it exists, don’t create the user.
3. If it doesn’t exist, create the user.

- Use the `ansible.builtin.command` module when no module exists for the specific task.

---

### Error Handling in Ansible:
- Errors can be handled by using the **"ignore_errors"** directive.
- This is critical for **interview preparation**, as error handling is a key feature.

---

### Gathering Facts:
- **Facts** are variables automatically collected by Ansible from the hosts before connecting.
- This helps Ansible make decisions based on the host's system information.

---

### Installing Nginx Example:
- Ansible dynamically determines the underlying OS distribution:
  - **RedHat**: `ansible.builtin.dnf`
  - **Ubuntu**: `ansible.builtin.apt`

- Using the **ansible.builtin.package** module abstracts this, allowing Ansible to determine the appropriate package manager based on the OS:
```yaml
- name: install nginx
  ansible.builtin.package:
    name: nginx
    state: present
```

---

### Loops in Ansible:
- **item** is a reserved keyword used in loops.
- Loops allow tasks to be repeated for multiple items in a list.

