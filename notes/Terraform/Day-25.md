### Day-25 Session-25 (13/09/2024)

#### Recap:
- **Variables**
- **Conditions**
- **Count-based variables**
- **Functions**
- **Outputs**
- **Data Sources**
- **tfvars**
- **Tags**
- **Advantages**

---

### Use Case Requirements:
- **3 EC2 Instances**
- **3 Route 53 (R53) Records**
  - `mysql.daws81s.fun` → t3.small
  - `backend.daws81s.fun` → t3.micro
  - `daws81s.fun` → t3.micro

#### Route 53 Setup:
- After creating EC2 instances, retrieve outputs such as **public IPs**, **private IPs**, and **instance IDs** for future reference using `aws_instance.terraform`.

---

### Interpolation and Concatenation:
- For example, if we have the domain `backend.daws81s.fun`, we can define:
  - `var.instance_names = backend`
  - `domain_name = daws81s.fun`
  
- Combining these using Terraform interpolation:
  ```hcl
  "${var.instance_names[count.index]}.${var.domain_name}"
  ```
  This concatenates the instance name and domain.

---

### Command: `terraform fmt`
- **Purpose**: Formats and beautifies the Terraform files, ensuring readability and consistency.

---

### Locals:
- **Locals** are similar to variables but offer more flexibility and capabilities.
- You can store **expressions** and **intermediate values** in locals.
- **Locals cannot be overridden**, whereas **variables can**.

#### Variables vs Locals:
1. Both store values, but locals offer additional capabilities.
2. Locals can store **expressions** that Terraform can compute.
3. Locals can reference variables, but **variables cannot reference locals**.
4. Variables are overrideable, while locals are **not**.

---

### State, Remote State, and Locking:

#### Difference Between Ansible and Terraform:
- **Ansible**: When updating instances (e.g., changing a name), it may create new instances instead of updating existing ones because it lacks state tracking.
- **Terraform**: Uses a **declarative** approach, where the infrastructure declared in the code must match the actual infrastructure.

#### State File (`terraform.tfstate`):
- **Purpose**: Keeps track of the infrastructure Terraform has created.
- If the infrastructure matches what was declared, the state is **consistent**.

##### Example:
- Before deletion:
  - Declared infrastructure = Actual infrastructure → **True**
  
- After deletion:
  - Declared infrastructure ≠ Actual infrastructure → **False**
  
- **Terraform refreshes the state** against the real infrastructure.

---

### Remote State:
- When working in a team, managing state locally can cause issues like **duplicate resources** or **errors**.
  
#### Problem:
- Multiple people creating infrastructure without a shared state can lead to duplication.

#### Solution:
- Store the state file in a **remote location** (e.g., AWS S3) to allow proper state management and avoid duplication.

#### Importance of Remote State (Interview Topic):
- In a collaborative environment, **remote state** ensures that state is compared and shared across all users, preventing the creation of duplicate resources.

##### Supported Remote State Backends:
- **HCP Terraform (HashiCorp Consul)**
- **Amazon S3**
- **Azure Blob Storage**
- **Google Cloud Storage**
- **Alibaba Cloud OSS**

---

### Locking Mechanism:
- To avoid concurrent runs creating duplicate infrastructure, Terraform uses **locking**.
- Locally, Terraform uses a `.lock` file.
  
#### Remote Locking:
- In the cloud (AWS), locking is handled by **DynamoDB** to prevent concurrent operations on the same state.

##### Remote Locking Example:
- **S3**: Used for remote state storage.
- **DynamoDB**: Used for locking.

---

### Setting Up Remote State with Locking (AWS):

1. **DynamoDB Locking**:
   - Open **DynamoDB** in AWS.
   - Go to **Tables** → Create a new table.
   - Name the table `81s-locking`.
   - Set **Partition Key** to `LockID`.
   - Create the table.

2. **S3 Remote State**:
   - Open **S3** in AWS.
   - Create a new bucket named `81s-remote-state`.
   - Click **Create Bucket** to complete the setup.

With **S3** for remote state storage and **DynamoDB** for state locking, we can effectively manage the entire use case.

---

### Summary:
- **Remote State**: Solves the problem of managing state in collaborative environments.
- **Locking**: Prevents multiple users from creating duplicate infrastructure by using a `.lock` file or DynamoDB in the case of remote backends.
