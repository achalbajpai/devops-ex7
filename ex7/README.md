# AWS Infrastructure with Terraform

This project creates a basic AWS infrastructure using Terraform, including a VPC, subnet, internet gateway, and an EC2 instance.

## Prerequisites

1. [Terraform](https://www.terraform.io/downloads.html) installed
2. AWS account and credentials
3. AWS CLI installed (optional)

## Setup

1. Clone this repository:

   ```bash
   git clone https://github.com/achalbajpai/devops-ex7.git
   cd devops-ex7
   ```

2. Set up your AWS credentials as environment variables:

   ```bash
   export AWS_ACCESS_KEY_ID="your_access_key"
   export AWS_SECRET_ACCESS_KEY="your_secret_key"
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

## Usage

1. Preview the changes:

   ```bash
   terraform plan
   ```

2. Apply the changes:

   ```bash
   terraform apply
   ```

3. When you're done, destroy the infrastructure:
   ```bash
   terraform destroy
   ```

## Infrastructure Components

-  VPC with CIDR block 10.0.0.0/16
-  Public subnet in ap-south-1a
-  Internet Gateway for public internet access
-  Route table for internet access
-  Security group allowing SSH (port 22) and HTTP (port 80)
-  t2.micro EC2 instance running Amazon Linux 2

## Security Note

-  The security group allows SSH and HTTP access from anywhere (0.0.0.0/0)
-  For production use, consider restricting access to specific IP ranges
-  Never commit AWS credentials to version control

## Contributing

Feel free to submit issues and pull requests.

## License

MIT
