resource "aws_security_group" "allow_ssh" {
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.accepted_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "machine" {
  count                  = var.instance_count
  ami                    = data.aws_ami.linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = data.aws_subnet.selected.id
  key_name               = aws_key_pair.key_pair.key_name

  root_block_device {
    volume_size           = var.ebs_volume_size
    volume_type           = var.ebs_volume_type
    encrypted             = var.encrypt_ebs_volume
    delete_on_termination = var.delete_ebs_on_term
  }

  tags = {
    Name  = "${var.service_name}-${count.index + 1}",
    Owner = var.owner,
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install software-properties-common -y",
      "sudo apt-add-repository --yes --update ppa:ansible/ansible",
      "sudo apt install ansible -y",
      "export ANSIBLE_HOST_KEY_CHECKING=false"
    ]

    connection {
      type        = "ssh"
      user        = var.user
      host        = self.private_ip
      private_key = tls_private_key.key.private_key_pem
    }
  }
}
