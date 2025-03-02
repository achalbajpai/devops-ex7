# S3 Bucket Terraform Example

This project demonstrates how to create and manage an S3 bucket using Terraform and interact with it using AWS CLI.

## Prerequisites

1. [Terraform](https://www.terraform.io/downloads.html) installed
2. AWS account and credentials
3. AWS CLI installed and configured

## Setup

1. Clone this repository:

   ```bash
   git clone https://github.com/achalbajpai/devops-ex7.git
   cd devops-ex7/ex8
   ```

2. Set up your AWS credentials as environment variables:

   ```bash
   export AWS_ACCESS_KEY_ID="your_access_key"
   export AWS_SECRET_ACCESS_KEY="your_secret_key"
   export AWS_DEFAULT_REGION="ap-south-1"
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

2. Apply the changes to create the S3 bucket:

   ```bash
   terraform apply -auto-approve
   ```

3. Interact with the S3 bucket using AWS CLI:

   ```bash
   # Create a test file
   echo "This is a test file" > testfile.txt

   # Upload the file to S3
   aws s3 cp testfile.txt s3://achal-terraform-s3-demo-bucket/

   # List files in the bucket
   aws s3 ls s3://achal-terraform-s3-demo-bucket/

   # Download the file
   aws s3 cp s3://achal-terraform-s3-demo-bucket/testfile.txt downloaded_testfile.txt
   ```

4. Clean up:

   ```bash
   # Remove all objects from the bucket
   aws s3 rm s3://achal-terraform-s3-demo-bucket/ --recursive

   # Destroy the Terraform resources
   terraform destroy -auto-approve
   ```

## Security Note

-  Never commit AWS credentials to version control
-  Use environment variables or AWS profiles to manage credentials securely
-  For production use, consider restricting S3 bucket access with appropriate policies
