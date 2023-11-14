terraform {
  backend "s3" {
    bucket         = "terraform_state_3213"
    key            = "terraform.tfstate"
    region         = var.aws_region
  }
}
