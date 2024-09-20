terraform {
  backend "s3" {
    bucket = "platzi-tf-security"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}

module "iam" {
  source = "./iam"
}

module "s3" {
  source = "./s3"
}

module "compute" {
  source                  = "./compute"
  lambda_bucket           = module.s3.lambda_bucket
  repo_collector_role_arn = module.iam.repo_collector_role_arn
  subnet_ids              = ["subnet-0de76513a4e1da6dc", "subnet-07048b10bf1fd684e", "subnet-04b3593e45a79260b"]

}