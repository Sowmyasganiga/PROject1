terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.69.0"
    }
  }
}

# Step 1: Define the AWS Provider
provider "aws" {
  region = "us-west-2"  # Replace with your desired AWS region
}

# Step 2: Create the S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "sowmya12234-dev"  # Replace with a globally unique name
  acl    = "private"                # Access control for the bucket



  # Optional: Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "mys3bucketdev"
    Environment = "dev"
  }
}

# Step 3: Output the bucket name (Optional)
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
