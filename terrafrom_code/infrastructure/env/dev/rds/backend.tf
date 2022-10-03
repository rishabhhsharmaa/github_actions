data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "s3-tf-states"
    key    = "env/dev/network.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "asg_instance" {
  backend = "s3"
  config = {
    bucket = "s3-tf-states"
    key    = "env/dev/asg_instance.tfstate"
    region = "ap-south-1"
  }
}

terraform {
  backend "s3" {
    bucket = "s3-tf-states"
    key    = "env/dev/database.tfstate"
    region = "ap-south-1"
  }
}