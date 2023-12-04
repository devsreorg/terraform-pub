terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.29.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.bar"
}

resource "aws_instance" "k8s-worker-01" {
  # (resource arguments)
  ami = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = "k8s-worker-01-terraform"
  }
}

output ip {
  value = aws_instance.k8s-worker-01.public_ip
}

resource "aws_instance" "k8s-worker-02" {
  # (resource arguments)
  ami = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = "k8s-worker-02"
  }
}

resource "aws_s3_bucket" "s3_buckets" {
  bucket = "${var.bucket_prefix}-${var.bucket_names[count.index]}"
  tags = {
    Name = var.s3_bucket_tags
  }
  count = length(var.bucket_names)
}
