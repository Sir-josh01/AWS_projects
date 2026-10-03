Launch a t3.micro EC2 instance using Amazon Linux 2023 AMI
Create a new key pair, download and secure the .pem file (chmod 400 on Mac/Linux)
Configure the security group to allow SSH (22) from your IP only, and HTTP (80) from anywhere
Connect via SSH from your terminal
Manually install and start Apache (httpd) or Nginx, create a custom index.html with your name
Confirm the page loads via the instance's public IP in a browser
Stop the instance, note the public IP changes on restart — discuss why (dynamic vs static IPs, foreshadowing Elastic IP)
Terminate the instance to avoid ongoing charges

Screenshot of your custom webpage loading in a browser via the EC2 public IP.