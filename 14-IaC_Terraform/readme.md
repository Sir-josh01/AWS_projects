Lab 14: Deploy Your First Terraform Configuration

Install Terraform CLI and verify with 'terraform version'
Write a main.tf defining the AWS provider (region) and a Security Group (SSH from your IP, HTTP from anywhere)
Add an aws_instance resource using that security group, with a user_data block installing a web server
Run 'terraform init' to initialize the working directory and download the AWS provider
Run 'terraform plan' and read the output carefully — confirm it shows exactly 2 resources to add, nothing more
Run 'terraform apply', type 'yes' to confirm, and verify the EC2 instance and Security Group were created exactly as defined
Modify the configuration (change the instance type or add a tag), run 'terraform plan' again to preview the change, then 'terraform apply'
Run 'terraform destroy' to tear down everything cleanly, and confirm in the console that both resources are gone

The final main.tf file, plus terminal output showing a successful 'terraform apply' and the resulting public IP from an output block.