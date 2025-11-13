terraform {
  backend "s3" {
    bucket = "pstfstatefile"
    key    = "terraform/state/dev/terraform.tfstate"
    region = "us-east-2"
  }
}