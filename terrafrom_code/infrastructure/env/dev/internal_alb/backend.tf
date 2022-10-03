data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "s3-tf-state"
    key    = "env/dev/network.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "openvpn" {
  backend = "s3"
  config = {
    bucket = "s3-tf-state"
    key    = "env/dev/instance.tfstate"
    region = "ap-south-1"
  }
}

terraform {
  backend "s3" {
    bucket = "s3-tf-state"
    key    = "env/dev/internal_alb.tfstate"
    region = "ap-south-1"
  }
}

