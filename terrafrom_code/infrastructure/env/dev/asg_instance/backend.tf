data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket  = "s3-tf-states"
    key     = "env/prod/network.tfstate"
    region  = "ap-south-1"
  }
}

data "terraform_remote_state" "internal_alb" {
  backend = "s3"
  config = {
    bucket = "s3-tf-states"
    key    = "env/dev/internal_alb.tfstate"
    region = "ap-south-1"
  }
}

terraform {
  backend "s3" {
    bucket  = "s3-tf-states"
    key     = "env/prod/asg_instance.tfstate"
    region  = "ap-south-1"
  }
}