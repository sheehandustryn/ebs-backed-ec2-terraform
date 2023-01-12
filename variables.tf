variable "accepted_cidrs" {
  description = "List of CIDRs that are allowed to communicate with the created instances"
  type        = list(string)
}

variable "ansible_dir" {
  description = "Path to local ansible directory"
  type        = string
}

variable "aws_ami_strings" {
  description = "List of paths to search for the desired AMI"
  default     = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  type        = list(string)
}

variable "aws_ami_owner_strings" {
  description = "List of AWS Owner IDs under which to search for AMIs"
  default     = ["099720109477"]
  type        = list(string)
}

variable "aws_subnet_id" {
  description = "The ID of the AWS Subnet in which to deploy the EC2 instances"
  type        = string
}

variable "aws_vpc_id" {
  description = "The ID of the AWS VPC in which to deploy the EC2 instances"
  type        = string
}

variable "delete_ebs_on_term" {
  description = "Should the EBS Volume used as the root block device for the EC2 instance be deleted when the instance is deleted?"
  default     = true
  type        = bool
}

variable "ebs_volume_size" {
  description = "The size, in GiB, of the EBS volume used for the root block device"
  default     = "50"
  type        = string
}

variable "ebs_volume_type" {
  description = "The volume type to use for the EBS volume used for the root block device"
  default     = "gp3"
  type        = string
}

variable "encrypt_ebs_volume" {
  description = "Whether or not to encrypt the EBS volume use for the root block device"
  default     = true
  type        = bool
}

variable "ingress_ports" {
  description = "List of ports on which to allow inbound traffic to the EC2 instance(s)"
  type        = list(string)
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  default     = 1
  type        = number
}

variable "instance_type" {
  description = "The AWS EC2 Instance Type to Use"
  default     = "t3.large"
  type        = string
}

variable "owner" {
  description = "The name of the DRI for the service using this module"
  type        = string
}

variable "service_name" {
  description = "The name of the service that will be deployed on these EC2 instances"
  type        = string
}

variable "ssh_key_name" {
  description = "Name to use for the ssh key file that will be generated"
  type        = string
}

variable "user" {
  description = "The name of the user account in the AMI used"
  type        = string
}
