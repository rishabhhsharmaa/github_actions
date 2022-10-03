region = "ap-south-1"

env_name = "dev"

application_name = "asg_instance"

ami_frontend = "ami-0491e5015eb6e7a9b"

instance_type_frontend = "t4g.large"

public_key = ""

listener_rule_condition_values = ["xyz.online"]

asg_min_size = "1"

asg_max_size = "2"

asg_desired_size = "1" 