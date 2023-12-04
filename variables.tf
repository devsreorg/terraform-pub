variable "ami" {
  default = "ami-0287a05f0ef0e9d9a"
}

variable "bucket_prefix" {
  default = "prefix"
}

variable "bucket_names" {
  type = list(string)

  default = [
    "first-61c4a3wy",
    "second-246skob7",
    "third-a614exx7"
  ]
}

variable "s3_bucket_tags" {
  default = "Created with Terraform"
}
