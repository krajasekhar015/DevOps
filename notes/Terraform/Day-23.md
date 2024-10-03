### Day-23 Session-23 (11/09/2024)

#### Key Concepts Covered:
- **Variables**
- **Conditions**
- **Data Types**
- **Loops**
- **Functions**

---

### Variables in Terraform:
- **Variables** are containers that hold values.

Example in shell scripting:
```bash
PERSON=Ramesh
```

In Terraform:
```hcl
variable "person" {
  default = "Ramesh"
  type    = string
}
```

- **Datatypes** in Terraform:
  - String
  - Number
  - Boolean

#### Tags:
- In Terraform, **tags** are handled as **maps**.
  
---

### Tagging Strategy:
- **Tagging** is important in cloud environments to identify resources efficiently.

#### Project Structure:
1. **Project**
2. **Component/Module**
3. **Environment**

Example:
- **Expense Project**:
  - MySQL
  - Backend
  - Frontend

#### Environments:
- **DEV**
- **PROD**

---

### terraform.tfvars:
- The `terraform.tfvars` file allows overriding default variable values or setting new values.
- **Preference Order**:
  1. Command line input.
  2. `terraform.tfvars`.
  3. Environment variables.
  4. Default values in the code.

Example of environment variable setup:
```bash
export TF_VAR_instance_type=t3.xlarge
```

---

### Conditions in Terraform:
- **Syntax**:
  ```hcl
  if (expression) {
    # Run this block if expression is true
  } else {
    # Run this block if expression is false
  }
  ```

- **Ternary Expression**:
  ```hcl
  expression ? "run this if true" : "run this if false"
  ```

---

### Outputs in Terraform:
- Every resource in Terraform **exports values** that can be used to create other resources.
  
---

### Loops in Terraform:
1. **Count-based loops**.
2. **For or For Each loops**.

Example:
```hcl
count.index --> 0
count.index --> 1
count.index --> 2
```

---

### Functions in Terraform:
- **Custom functions** are not allowed in Terraform, but it has several built-in functions.

Example:
- **merge** function: Combines two lists.

```hcl
list-1 = { name = "Lakshmi", course = "DevOps" }
list-2 = { name = "Lakshmi", course = "DevOps", duration = 120 }
list-3 = { name = "Maha", course = "AWS" }

merge(list-1, list-2)
```

Result:
```hcl
name = "Lakshmi", course = "Terraform"
name = "Maha", course = "AWS", duration = 120
```

---

### Example Scenario: Creating EC2 Instances and Route 53 Records
- **3 EC2 instances**.
- **Route 53 (R53) records**.
- Mapping:
  - `mysql.daws81s.fun` -> Private IP
  - `backend.daws81s.fun` -> Private IP
  - `frontend.daws81s.fun` -> Public IP
