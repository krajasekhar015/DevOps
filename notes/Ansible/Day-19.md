**Day-19 session-19(05/09/2024)**

### Recap:
- **Functions = Filters**: In Ansible, functions are called **filters**.
- **Command vs Shell**:
  - **Command Module**: More secure as it doesn't access the full shell environment (no pipes, redirectors).
  - **Shell Module**: Less secure because it accesses the full shell environment and supports complex commands.
  - Use **command** for simple commands and **shell** for complex commands involving pipes and redirectors.
- Custom functions in Ansible are rarely used. If needed, they require Python code.

---

### Connecting to External Systems:
- **Ansible** is capable of connecting to **external systems** (not just inside the server).
- Though Ansible was originally designed for server management, it can connect to external systems due to the underlying Python code running in the background.

---

### MySQL Module in Ansible:
- **ansible.builtin**: Modules that come with Ansible by default.
- **community.mysql**: Modules developed by the community for MySQL.

To connect to any system:
1. Provide host, username, and password.
2. The system connection will fail if these are not set up properly.
3. Create a root password (if necessary).
4. If the password is already set, skip this step.

---

### User Module and Idempotency:
- The **user module** in Ansible ensures **idempotency**.
- It handles the underlying distribution commands automatically, ensuring consistency across different environments.

---

### Common Ansible Modules:
- **package**: Manages packages.
- **get_url**: Downloads files from a URL.
- **user**: Manages users.
- **command**: Executes commands on remote nodes.
- **mysql**: Manages MySQL databases.
- **file**: Manages file attributes.
- **copy**: Copies files to remote nodes.
- **unarchive**: Extracts archive files.
- **pip**: Installs Python packages.

---

### Ansible Roles:
- **Roles** follow the **DRY** (Don't Repeat Yourself) principle.
- **Roles** store repeated code in a structured format, which can be reused across playbooks.
- Roles provide a structured way to organize Ansible playbooks into a standard directory structure.

---

### Directory Structure for Roles:
Roles follow a proper directory structure for better organization and reuse of tasks.
