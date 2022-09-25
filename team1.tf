
         
module team1_ecr_first_ecr {
  source          = OT-CLOUD-KIT/ec2-instance/aws
  version         = 0.0.3
  ecrName  = first_ecr
}

         
module team1_ecr_second_ecr {
  source          = OT-CLOUD-KIT/ec2-instance/aws
  version         = 0.0.3
  ecrName  = second_ecr
}
