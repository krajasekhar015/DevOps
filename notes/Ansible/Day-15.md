**Date: 30/08/2024**

### Legacy Systems in IT
- **Legacy System**: Old systems or technologies still in use (e.g., core banking systems).
  - **Challenges**:
    - Maintenance is difficult.
    - Legacy systems often involve manual processes, build, and release cycles.
    - Logs and disk space can be high; limited access due to network/security restrictions.

- **Team Achievements (Good for interviews)**:
  - Managing legacy systems, which are typically highly secured.
  - Overcoming access restrictions by writing scripts for:
    1. **Monitoring** CPU and memory, sending alert emails.
    2. **Automating backups**, scheduling them effectively.

- **Key Insight**:
  - Maintaining advanced systems is easy, but managing legacy systems is challenging and valuable.

---

### Configuration Management
- **Definition**: Process of setting up a plain server with necessary applications and configurations to serve users.
  - Includes:
    1. Installing application runtimes, packages.
    2. Creating users and directories.
    3. Deploying code and dependencies.
    4. Creating system services.
    5. Configuring servers.

- **Evolution**:
  1. **Manual Configuration**: Error-prone.
  2. **Shell Scripting**: Automated configurations but has limitations.

---

### Shell Scripting: Disadvantages
1. **Not idempotent**: Requires custom code to prevent multiple executions.
2. **Poor error handling**: Must manually write code to handle errors.
3. **Homogeneous**: Works only on specific Linux distributions (e.g., RedHat vs Ubuntu).
4. **Not scalable**: Difficult to run scripts on multiple servers (e.g., managing 1000 servers manually).
5. **Syntax complexity**: Hard to understand for large-scale deployments.

- **Advantages**:
  - Powerful for small systems.
  - Native to Linux and quick for smaller environments.

- **Conclusion**: While powerful for a few servers, shell scripting struggles in large-scale environments, leading to the adoption of tools like **Ansible**.

---

### Configuration Management Tools: Introduction
- **Tools**: Puppet, Chef, Rundeck, Ansible.
- **Push vs Pull Architectures**:
  - **Push-based** (e.g., Ansible): Server sends updates directly to nodes.
  - **Pull-based** (e.g., Puppet, Chef): Nodes request updates from the server on a schedule.

---

### Ansible Overview
- **Architecture**: Push-based, more popular due to simplicity.
- **Features**:
  - Uses SSH for communication with nodes.
  - Runs on Linux environments.
  - No need for agents (as required by pull-based systems).

- **Advantages**:
  - Simple setup: No extra installations on nodes.
  - Background based on Linux/shell scripts.
  - Can scale and manage multiple servers efficiently.

---

### Example: Setting up Ansible
1. **Create Ansible Server** on AWS.
2. **Install Ansible**: `sudo dnf install ansible -y`.
3. **Connect Nodes**: Ansible uses SSH to connect and configure nodes.

---

### Ad-Hoc Commands in Ansible
- **Ad-Hoc Commands**: Immediate, one-time commands executed on nodes from the Ansible server (e.g., for urgent changes).
  - Example command: 
    ```bash
    ansible -i <IP address>, all -e ansible_user=ec2-user -m dnf -a "name=nginx state=installed"
    ```
  - These commands are useful for quick, temporary tasks.

---

### Ansible Playbooks
- **Playbooks**: Automate multiple tasks in sequence using YAML syntax.
  - Example of YAML structure:
    ```yaml
    - hosts: webserver
      tasks:
        - name: Install nginx
          dnf:
            name: nginx
            state: installed
    ```

- **YAML vs XML vs JSON**: YAML is simpler and more readable, often used for Ansible.

---

### Summary of Milestone 2: Automating a Project with Shell Scripting
1. **Advantages**:
   - Automates repetitive tasks.
   - Easier than manual configuration.
2. **Challenges**:
   - Not scalable for large environments.
   - Error handling and idempotency are issues.
3. **Errors**:
   - Difficulty in managing a large number of servers.
4. **Final Take**:
   - Shell scripts are powerful for small environments but tools like Ansible provide better scalability and management for large-scale systems.

---

