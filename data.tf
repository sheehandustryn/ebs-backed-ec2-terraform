data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "name"
    values = var.aws_ami_strings
  }

  owners = var.aws_ami_owner_strings
}

data "aws_subnet" "selected" {
  id = var.aws_subnet_id
}

data "aws_vpc" "default" {
  id = var.aws_vpc_id
}
