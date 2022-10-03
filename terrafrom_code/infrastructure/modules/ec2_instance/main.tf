resource "aws_key_pair" "ec2-pem" {
  count      = var.instance_key_name != "" ? 1 : 0
  key_name   = format("%s", "${var.instance_key_name}")
  public_key = var.public_key
}

resource "aws_eip" "ec2_instance_eip" {
  count    = var.eip_creation ? 1 : 0
  instance = aws_instance.ec2[count.index].id
  vpc      = true
  tags     = var.tags
}


resource "aws_instance" "ec2" {
  count                       = length(var.ec2_name)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = var.public_ip
  key_name                    = aws_key_pair.ec2-pem[count.index].key_name
  subnet_id                   = var.subnet
  vpc_security_group_ids      = var.security_groups
  iam_instance_profile        = var.iam_instance_profile != "" ? var.iam_instance_profile : null
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
    encrypted   = var.encrypted_volume
  }
  tags = merge(
    {
      Name = format("%s", var.ec2_name)
    },
    {
      PROVISIONER = "Terraform"
    },
    var.tags,
  )
}
