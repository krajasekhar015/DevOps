### Day-24 Session-24 (12/09/2024)

#### Recap:
- **Variables**
- **terraform.tfvars**: Overrides variable values.
- **Variable Precedence**.
- **Conditions**.

---

### Key Concepts Covered Today:

#### Top-to-Bottom Approach:
1. **Problem**: Manual infrastructure management.
2. **Solution (Terraform)**: Uses infrastructure as code (IAC) to automate and streamline infrastructure setup through scripts.
3. **Application**: Write code, apply changes.

- **Resources**: Anything created in the cloud.
- **Providers**: Cloud vendors like AWS, GCP, Azure, Networking, Active Directory, etc.

#### Key Benefits of Terraform:
1. **Faster Releases**.
2. **Fewer Defects**.

- **API**: The interface between Terraform and providers (AWS, GCP, etc.) is built by the Terraform community and respective providers like AWS.

##### Authentication:
- To interact with providers via APIs, **authentication** is required.

---

### Steps to Create Resources in Terraform:
1. **Understand the resource**: Know what the resource (AWS service) can do and how it works.
2. **Input/Arguments**: Resources need specific inputs/arguments.
3. **Provider Outputs**: After creation, providers give outputs.
4. **Reuse Outputs**: These outputs can be used to create other resources.

#### Terraform Efficiency:
- A good script should have fewer lines of code, making it easier to execute and maintain.

---

### Example Scenario:
- **Requirement**: Create 3 EC2 instances and 3 Route 53 (R53) records.

#### AMI ID Consideration:
- **AMI IDs** change frequently. Whenever an AMI is updated, the ID changes.

#### Querying Existing Information from Providers:
- This can be done using **Data Sources** in Terraform.

---

### Data Source in Terraform:

- **Backend API**:
  - Creating resources: **POST** request.
  - Retrieving data: **GET** request.

Example (Query AMI data from AWS):
- Think of querying like searching for a product online and applying filters.

#### Data Source Syntax:
```hcl
data "aws_ami" "jondevops" {
  most_recent = true
  owners      = ["987731927391"]  # Owner ID for the AMIs

  filter {
    name   = "name"
    values = ["RHEL-9-devops-type"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
```

- This query retrieves the most recent AMI from **joindevops** with the name `RHEL-9-devops-type`.

---

### Key Concepts Summary:
- **Infrastructure as Code (IAC)**.
- **Authentication**: Required for API access to providers.
- **Providers**: AWS, GCP, Azure, etc.
  
#### Inputs and Outputs:
- **Inputs**: Arguments needed to create resources.
- **Outputs**: Information received after creating a resource (public IP, private IP, instance ID, etc.).

#### Data Sources:
- Instead of manually gathering inputs, use **Data Sources** to query existing information from providers.
