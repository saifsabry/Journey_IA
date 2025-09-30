# 🚀 Terraform AWS Infrastructure

This project provisions AWS infrastructure using Terraform with a modular approach for better maintainability and reusability.

## 📂 Project Structure

```
.
├── main.tf                  # Root configuration
├── variables.tf             # Input variables
├── modules/                 # Reusable modules
│   ├── vpc/                 # VPC resources
│   ├── subnet/              # Subnet definitions
│   ├── s3/                  # S3 buckets
│   ├── routing/             # routing tables
│   └── iam_groups/          # IAM roles and groups
├── import_s3_buckets.sh     # Bash script for bucket imports
└── README.md                # Project documentation
```

## 🛠️ Prerequisites

Before you begin, ensure you have the following:

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0
- AWS account with appropriate IAM permissions
- [AWS CLI v2](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Visual Studio Code](https://code.visualstudio.com/) (recommended)
- Git for version control

## 📋 Setup Instructions

### 1. AWS Login

Use the credentials provided in your email to log in at:
👉 [AWS Console](https://console.aws.amazon.com/)

### 2. Configure AWS CLI

1. **Install AWS CLI v2** from the [official installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

2. **Configure your credentials** by running:
   ```bash
   aws configure
   ```

3. **Enter the following values** (from your email credentials):
   - **AWS Access Key ID**: `[Your Access Key]`
   - **AWS Secret Access Key**: `[Your Secret Key]`
   - **Default region**: `eu-west-1`
   - **Output format**: `json`

4. **Verify your configuration**:
   ```bash
   aws sts get-caller-identity
   ```
   
   This should return your AWS account ID, user ARN, and user ID.

### 3. Install Terraform

1. **Download and install** Terraform from the [official installation page](https://developer.hashicorp.com/terraform/install)

2. **Verify installation**:
   ```bash
   terraform -version
   ```
   
   Expected output: `Terraform v1.x.x` or higher

### 4. Install Visual Studio Code (Optional but Recommended)

1. **Download and install** [VS Code](https://code.visualstudio.com/)

2. **Install recommended extensions**:
   - **HashiCorp Terraform** - Syntax highlighting and IntelliSense
   - **AWS Toolkit** - AWS resource management
   - **GitHub Pull Requests and Issues** - Git integration

## 🚀 Usage

### Initialize Terraform

Initialize your Terraform working directory:

```bash
terraform init
```

This command:
- Downloads required provider plugins
- Initializes the backend
- Prepares modules for use

### Plan Infrastructure Changes

Preview the changes Terraform will make:

```bash
terraform plan
```

the expected output should be somthing like this
```
No changes. Your infrastructure matches the configuration.
```

This command:
- Shows what resources will be created, modified, or destroyed
- Validates your configuration
- Does not make any actual changes

## 📝 Important Notes

### S3 Bucket Import

If you need to import existing S3 buckets:

```bash
chmod +x import_s3_buckets.sh
./import_s3_buckets.sh
```


---

**Last Updated**: September 2025
**Maintained by**: Saif sabry
