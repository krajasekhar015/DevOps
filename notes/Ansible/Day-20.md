**Day-20 session-20(06/09/2024)**
### Recap:
- Topics covered: **Variables, Loops, Conditions**, and the **Expense Project** using an Ansible server.

---

### Ansible Roles:
- A **role** in Ansible provides a structured way to organize playbooks, including variables, files, templates, handlers, and other dependencies.
- **Advantages of roles**:
  1. Reusable code.
  2. Organized in a proper structure.

#### Role Directory Structure:
- **tasks/**: Contains all task-related YAML files.
- **handlers/**: Triggers actions when there is a change in a particular task (e.g., restart services).
- **templates/**: Stores files with variables (Jinja2 templates).
- **files/**: Stores static files without variables.
- **vars/**: Contains variable definitions.
- **defaults/**: Contains low-priority variables.
- **meta/**: Contains role dependencies and metadata.
- **library/**: Stores custom modules (usually written in Python).
- **module_utils/**: Stores custom utility functions for modules.
- **lookup_plugins/**: Stores custom plugins.

---

### Practical Exercise: 
1. **Create AWS Instance**:
   - Create an EC2 instance and name it **ansible-server**.
   - Connect to the instance and install Ansible.
   - Run the **create ec2-r53** file to create MySQL, backend, frontend instances, and corresponding DNS records.
   - Verify AWS configuration (access key and secret key).

2. **Ansible Commands**:
   - Use the command: `ansible-playbook -i inventory.ini 21-create-ec2-r53`.

3. **Repo Creation**:
   - Create a new GitHub repository named **expense-ansible-roles**.
   - Clone the HTTPS URL using Git Bash.
   - Create a file `mysql.yaml` in **expense-ansible-roles** in VS Code.
   - Set up the directory structure for roles, starting with **roles/mysql/tasks/main.yaml** to store task-related content.

---

### `ansible.cfg` File:
- Ansible's configuration file is located at `/etc/ansible/ansible.cfg`.
- The configuration file can be set in four places (precedence order):
  1. **ANISBLE_CONFIG**: Environment variable.
  2. **ansible.cfg**: In the current working directory.
  3. **~/.ansible.cfg**: In the home directory.
  4. **/etc/ansible/ansible.cfg**: Default path.

- To unset the configuration, use: `unset ANSIBLE_CONFIG`.

---

### Creating Backend & Frontend Roles:
1. **Backend Role**:
   - Create a **backend** folder under roles.
   - Create **tasks/**, **vars/**, and **templates/** folders under backend.
   - Create `main.yaml` under **tasks** to define tasks.
   - Create `main.yaml` under **vars** to store variables.
   - Create **backend.service.j2** under **templates**.

2. **Frontend Role**:
   - Create a **frontend** folder under roles.
   - Create **tasks/**, **vars/**, and **templates/** folders under frontend.
   - Create `main.yaml` under **tasks** to define tasks.
   - Create `main.yaml` under **vars** to store variables.
   - Create **expense.conf.j2** under **templates**.

---

### Jinja2:
- Jinja2 is a **templating language** used in Ansible to manage dynamic content.
- It allows creating dynamic configuration files using variables.

---

### Handlers and Notifiers:
- **Handlers** allow you to trigger actions when a task changes.
- Use the `notify` keyword to call a handler after a task changes.
- Example: Restart a service only if its configuration file has changed. If there's no change, no notification or restart is required.

---

### Important Modules for Interviews:
- **Nginx**: Web server.
- **Node.js**: Backend framework.
- **MySQL**: Database.

---

### Key Workflow for Idempotency:
1. Remove the existing **/app** directory.
2. Recreate the directory.
3. Download the updated code.
4. Extract the code.

- **Node.js** directory: `/app`.
- **Nginx** directory: `/usr/share/nginx/html`.

- **Idempotency** in Ansible ensures that operations can be safely re-run without unintended changes. Removing existing files ensures a clean state before deploying new ones.
