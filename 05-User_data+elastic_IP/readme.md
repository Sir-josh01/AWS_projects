EC2 Automation, Elastic IPs & Auto Scaling Basics

Launch a new t3.micro instance with a User Data script that installs and starts a web server AND writes a custom HTML page automatically
Verify the site is live WITHOUT ever SSHing in
Allocate an Elastic IP and associate it with the running instance
Stop and start the instance, confirm the Elastic IP persists and the site is still reachable at the same address
Create an AMI from this instance named 'web-server-baseline-v1'
Launch a second instance from your custom AMI and confirm it comes up pre-configured
Release the Elastic IP and terminate both instances when done (avoid idle-IP charges)

The User Data script text file, plus a screenshot confirming the second instance (launched from your custom AMI) is serving the page.