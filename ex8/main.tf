provider "aws" {
  region = "ap-south-1"  # Using Mumbai region as per your previous preference
  # Credentials will be loaded from environment variables:
  # AWS_ACCESS_KEY_ID
  # AWS_SECRET_ACCESS_KEY
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "achal-terraform-s3-demo-bucket"  # Changed to a unique name

  tags = {
    Name        = "TerraformS3Demo"
    Environment = "Test"
  }
} 