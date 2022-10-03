module "ecr" {
  source               = "../../../modules/ec2_instance/"
  #name                 = []
  tag_prefix_list      = ["release"]
  scan_on_push         = false
  #environment          = "ite
  #profile              = "nonprod"
  image_tag_mutability = "IMMUTABLE"
  max_untagged_image_count = 5
  max_tagged_image_count   = 30
}