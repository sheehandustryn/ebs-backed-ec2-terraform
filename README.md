# EBS-backed EC2 Instance Terraform

A terraform module for deploying EBS-backed EC2 instances.

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | 1.3.3   |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | 4.37.0  |

## Providers

| Name                                                   | Version |
| ------------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)       | 4.37.0  |
| <a name="provider_local"></a> [local](#provider_local) | n/a     |
| <a name="provider_tls"></a> [tls](#provider_tls)       | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                             | Type        |
| -------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_instance.machine](https://registry.terraform.io/providers/hashicorp/aws/4.37.0/docs/resources/instance)                     | resource    |
| [aws_key_pair.key_pair](https://registry.terraform.io/providers/hashicorp/aws/4.37.0/docs/resources/key_pair)                    | resource    |
| [aws_security_group.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/4.37.0/docs/resources/security_group)       | resource    |
| [local_sensitive_file.private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource    |
| [tls_private_key.key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key)                   | resource    |
| [aws_ami.linux](https://registry.terraform.io/providers/hashicorp/aws/4.37.0/docs/data-sources/ami)                              | data source |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/4.37.0/docs/data-sources/subnet)                     | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/4.37.0/docs/data-sources/vpc)                            | data source |

## Inputs

| Name                                                                                             | Description                                                                                                       | Type           | Default                                                                         | Required |
| ------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------- | -------------- | ------------------------------------------------------------------------------- | :------: |
| <a name="input_accepted_cidrs"></a> [accepted_cidrs](#input_accepted_cidrs)                      | List of CIDRs that are allowed to communicate with the created instances                                          | `list(string)` | n/a                                                                             |   yes    |
| <a name="input_ansible_dir"></a> [ansible_dir](#input_ansible_dir)                               | Path to local ansible directory                                                                                   | `string`       | n/a                                                                             |   yes    |
| <a name="input_aws_ami_owner_strings"></a> [aws_ami_owner_strings](#input_aws_ami_owner_strings) | List of AWS Owner IDs under which to search for AMIs                                                              | `list(string)` | <pre>[<br> "099720109477"<br>]</pre>                                            |    no    |
| <a name="input_aws_ami_strings"></a> [aws_ami_strings](#input_aws_ami_strings)                   | List of paths to search for the desired AMI                                                                       | `list(string)` | <pre>[<br> "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"<br>]</pre> |    no    |
| <a name="input_aws_subnet_id"></a> [aws_subnet_id](#input_aws_subnet_id)                         | The ID of the AWS Subnet in which to deploy the EC2 instances                                                     | `string`       | n/a                                                                             |   yes    |
| <a name="input_aws_vpc_id"></a> [aws_vpc_id](#input_aws_vpc_id)                                  | The ID of the AWS VPC in which to deploy the EC2 instances                                                        | `string`       | n/a                                                                             |   yes    |
| <a name="input_delete_ebs_on_term"></a> [delete_ebs_on_term](#input_delete_ebs_on_term)          | Should the EBS Volume used as the root block device for the EC2 instance be deleted when the instance is deleted? | `bool`         | `true`                                                                          |    no    |
| <a name="input_ebs_volume_size"></a> [ebs_volume_size](#input_ebs_volume_size)                   | The size, in GiB, of the EBS volume used for the root block device                                                | `string`       | `"50"`                                                                          |    no    |
| <a name="input_ebs_volume_type"></a> [ebs_volume_type](#input_ebs_volume_type)                   | The volume type to use for the EBS volume used for the root block device                                          | `string`       | `"gp3"`                                                                         |    no    |
| <a name="input_encrypt_ebs_volume"></a> [encrypt_ebs_volume](#input_encrypt_ebs_volume)          | Whether or not to encrypt the EBS volume use for the root block device                                            | `bool`         | `true`                                                                          |    no    |
| <a name="input_ingress_ports"></a> [ingress_ports](#input_ingress_ports)                         | List of ports on which to allow inbound traffic to the EC2 instance(s)                                            | `list(string)` | n/a                                                                             |   yes    |
| <a name="input_instance_count"></a> [instance_count](#input_instance_count)                      | Number of EC2 instances to create                                                                                 | `number`       | `1`                                                                             |    no    |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type)                         | The AWS EC2 Instance Type to Use                                                                                  | `string`       | `"t3.large"`                                                                    |    no    |
| <a name="input_service_name"></a> [service_name](#input_service_name)                            | The name of the service that will be deployed on these EC2 instances                                              | `string`       | n/a                                                                             |   yes    |
| <a name="input_ssh_key_name"></a> [ssh_key_name](#input_ssh_key_name)                            | Name to use for the ssh key file that will be generated                                                           | `string`       | n/a                                                                             |   yes    |
| <a name="input_user"></a> [user](#input_user)                                                    | The name of the user account in the AMI used                                                                      | `string`       | n/a                                                                             |   yes    |

## Outputs

| Name                                                              | Description                                               |
| ----------------------------------------------------------------- | --------------------------------------------------------- |
| <a name="output_private_ip"></a> [private_ip](#output_private_ip) | List of the private ips assigned to created EC2 instances |

<!-- END_TF_DOCS -->
