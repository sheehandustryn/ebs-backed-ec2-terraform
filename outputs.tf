output "private_ip" {
  description = "List of the private ips assigned to created EC2 instances"
  value       = ["${aws_instance.machine.*.private_ip}"]
}
