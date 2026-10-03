Lab 15: Provision a Multi-Tier Network with Terraform

Create a new Terraform project with variables.tf (region, vpc_cidr, public_subnet_cidr, private_subnet_cidr), main.tf, and outputs.tf
In main.tf, define an aws_vpc resource, an aws_subnet for public and one for private, an aws_internet_gateway, and an aws_route_table with association
Run 'terraform plan' and confirm the resource count and dependency order look correct before applying anything
Run 'terraform apply' and verify in the AWS console that the VPC, subnets, IGW, and route table match exactly what was planned
Add an output block that surfaces the VPC ID and public subnet ID after apply
Make a deliberate change (e.g., resize the public subnet's CIDR) and run 'terraform plan' — read carefully whether Terraform proposes an in-place update or a destroy-and-recreate, and explain which and why
Run 'terraform destroy' to tear down the entire environment in one command, and confirm nothing remains in the console


The complete Terraform project folder (all .tf files), plus terminal output showing the full plan and apply cycle for the multi-resource network.
