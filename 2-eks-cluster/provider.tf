provider "aws" {
  alias = "account_route53" # Specific to your setup
}


provider "aws" {
  region = var.AWS_REGION 
}
