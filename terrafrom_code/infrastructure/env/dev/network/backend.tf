terraform {
  backend "s3" {
    bucket = "s3-tf-state"
    key    = "env/dev/network.tfstate"
    region = "ap-south-1"
  }
}
