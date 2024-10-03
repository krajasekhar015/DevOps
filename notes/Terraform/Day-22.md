### Day-22 Session-22 (10/09/2024)

#### Recap:
- **Linux Servers**: DevOps engineers need to learn Linux servers and commands at an intermediate level.
- **3-Tier Architecture**
- **Shell Scripting**: Scalability is limited; cannot handle a large number of servers.
- **Ansible**: Automates configuration easily.

#### Cloud Features:
1. Automatic creation and deletion of cloud resources.
2. Scalability.
3. Creating entire infrastructure effortlessly.

---

### Terraform Introduction

#### Terraform Overview:
- **Terraform** is an **Infrastructure as Code (IaC)** tool.
  - Manages infrastructure such as EC2, Route 53, IAM users (basic components for practice).

#### Problems with Manual Infrastructure:
- **Human error**: Mistakes in the console can cause applications to go down for 30 minutes to an hour.
- **Restore/Versioning**: Applications should restore to a previous state when something goes wrong; important to track changes made a year ago.
- **Consistent Infrastructure**: Ensures all environments have the same configuration.
- **CRUD Operations**: Managing resources manually is hard (Create, Read, Update, Delete).
- **Resource Management**: Difficult to identify resources manually; Terraform script lists all services being used.
- **Cost Optimization**: Quickly create/delete resources (in 5 minutes).
- **Dependency Management**: Dependencies (like security groups for EC2) must be managed properly.
- **Code Reuse**: Roles in Ansible and modules in Terraform provide code reuse.

#### Infrastructure Importance:
- A strong infrastructure is the base for a successful application.
- In new projects, most of the time is spent on infrastructure setup.

---

### Terraform Features:
- **Declarative Syntax**: You define what infrastructure you need, and Terraform creates it.
- **Key Features**:
  1. Easy syntax.
  2. No specific sequence needed.
  3. **State Management**: Tracks what it creates and can upgrade or manage state easily.

- **Terraform’s Popularity**: One of the most popular tools in the market.
- Uses **HCL (HashiCorp Configuration Language)**.

---

### Installation of Terraform:
1. **Download Terraform**: Go to Chrome and search for `Terraform windows 36.zip`.
2. **Unzip & Setup**: Create a `software` folder, unzip `terraform.exe`, and set up environment variables.
3. **Check Setup**: Open Git Bash and type `terraform` to verify the installation.

#### Installing AWS CLI:
- Go to Chrome, search for **AWS CLI install**, and download it.
- AWS CLI is required to work with AWS resources using Terraform.

---

### Terraform Workflow:
- **Write Terraform Code**: Typically done in VS Code.
- **AWS Integration**: Terraform connects to AWS CLI and pushes the code to AWS.

#### Cloud Providers:
- Terraform can connect to multiple cloud providers: **AWS, Azure, GCP, Alibaba**, and even **GitHub, Networking**.
- These are referred to as **providers**.
  
#### Resources:
- Anything done in the cloud or providers is called a **resource**.

---

### Basic Terraform Syntax:

- **File Extension**: `.tf` for Terraform files.
- **Provider Declaration**: Define the cloud provider you are using in `provider.tf`.

```hcl
resource "resource-type" "name-of-resource" {
  key = value
}
```

#### Key Terms:
- **Ingress**: Incoming traffic.
- **Egress**: Outgoing traffic.

##### Example:
- **Ingress**: Like scanning your ID while entering a building.
- **Egress**: Like pressing a switch to exit.

---

### Important Terraform Commands:

1. **terraform init**: Initializes Terraform and connects to the provider.
2. **terraform plan**: Checks the syntax and shows the plan for resource creation (no actual resources are created).
3. **terraform apply**: Applies the changes and creates resources.
4. **terraform apply -auto-approve**: Automatically approves the changes without manual confirmation.

---

### Working with Git:
- **.gitignore**: Use `.gitignore` to prevent pushing `.exe` or `.zip` files to GitHub.
- For Terraform, ignore the `.terraform` folder by using a `.gitignore` file.

#### Using Terraform on a Linux Server:
- Pull the code, run `terraform init` to initialize, and follow the same steps as above.

