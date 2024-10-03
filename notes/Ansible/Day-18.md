Day-18 session-18(04/09/2024)
------------------------------


### Ansible Variables and Types:
- **Variables**: Used to store data and manage configuration within playbooks.
- **Types of Variables**:
  1. **Play Level**: Defined for the entire play.
  2. **Task Level**: Specific to a task.
  3. **From Files**: Loaded from external files.
  4. **From Prompt**: Collected from the user during execution.
  5. **Command Line Args**: Variables passed through command line (highest priority).
  6. **Inventory**: Variables defined in the inventory file.

---

### Conditions in Ansible:
- **Conditions** help determine whether a task should run.
- Use **"when"** instead of `if`.
  
Example:
```yaml
- name: Create a user if not exists
  ansible.builtin.user:
    name: "expense"
  when: result.rc == 1
```

---

### Loops in Ansible:
- **Loops** allow running a task multiple times.
- Use the reserved keyword **"item"** to access each element in a loop.
  
Example:
```yaml
- name: Install packages
  ansible.builtin.package:
    name: "{{ item }}"
  loop:
    - nginx
    - git
    - curl
```

---

### Data Types:
- **String**: Text data.
- **Number**: Types like `int`, `float`, `long`, etc.
- **Boolean**: `true` or `false`.
- **List**: Defined using `[]`.
- **Map (Dictionary)**: Defined using `{}`.

---

### Functions (Filters) in Ansible:
- In Ansible, **functions** are called **filters**.
- **Filters** manipulate data, such as converting data types or formatting.
- Syntax for using filters:
  ```yaml
  {{ variable | filter_name }}
  ```

- **Default Filter**: Used to set a default value if a variable is undefined.
  ```yaml
  {{ some_variable | default('default_value') }}
  ```

- **Common Filters**:
  - `unique`: Extracts unique values from a list.
  - `upper`, `lower`: Converts strings to uppercase or lowercase.
  - `min`, `max`: Returns the minimum or maximum value.
  
#### Example: Convert Dictionary to List:
```yaml
- name: Convert dictionary to list
  debug:
    msg: "{{ course | dict2items }}"
  
course:
  name: "DevOps with AWS"
  duration: 120
  learner: "mahalakshmi"
```
**Result**:
```json
"msg": [
  {"key": "name", "value": "DevOps with AWS"},
  {"key": "duration", "value": 120},
  {"key": "learner", "value": "mahalakshmi"}
]
```

#### Convert List to Dictionary:
```yaml
- name: Convert list to dictionary
  debug:
    msg: "{{ course | items2dict }}"
  
course:
  - {"key": "name", "value": "DevOps with AWS"}
  - {"key": "duration", "value": 120}
  - {"key": "learner", "value": "mahalakshmi"}
```

---

### Validating IP Addresses:
- To check if an IP address is valid:
  ```yaml
  msg: "{{ myip | ansible.utils.ipv4 }}"
  ```

- **Pip** is used to install Python dependencies for Ansible.
  ```bash
  pip3.9 install netaddr
  ```

---

### Command vs Shell Modules:
- **Command Module**:
  - Executes simple commands.
  - Does not access the shell environment (no pipes, redirection).
  - More secure.
  
- **Shell Module**:
  - Executes complex commands (supports pipes, redirections).
  - Accesses the shell environment.
  - Use **command** if possible, as it is more secure.

---

### AWS and Ansible:
- **Ansible** can connect to and manage **AWS** resources using Python libraries.
- AWS requires authentication using an **Access Key** and **Secret Key**.

#### Steps to Create an AWS User for Ansible:
1. **IAM Console** → Users → Create User → Name: *ansible*.
2. Attach the **AdministratorAccess** policy.
3. **IAM Console** → Security Credentials → Create Access Key.
4. Configure the AWS CLI with:
   ```bash
   aws configure
   ```

---

### Expense Project with Ansible:
- Requires 3 servers with the following DNS records:
  - `mysql.daws81s.fun` (private IP)
  - `backend.daws81s.fun` (private IP)
  - `frontend.daws81s.fun` (private IP)
  - `daws81s.fun` (public IP)

- Ansible can connect to AWS and manage the servers, interacting via the **AWS SDK** using access keys and secret keys.

---

### Accessing Instance Items in Ansible:
- When interacting with **EC2 instances**, results are stored in a list:
  ```yaml
  ec2_instances.results
  ```
- Access specific items using:
  ```yaml
  item.instances
  ```
