Load balancing and high avaliability

Create a Launch Template using your custom AMI from Lab 5 (or a fresh User Data script)
Create a second public subnet in a different AZ within bootcamp-vpc, with its own route to the IGW
Create an Application Load Balancer spanning both public subnets
Create a Target Group with a health check on '/' and register it to the ALB listener on port 80
Create an Auto Scaling Group using the Launch Template, min 2 / desired 2 / max 4, attached to the Target Group, across both AZs
Confirm the ALB DNS name serves the page, and refresh multiple times to observe requests hitting different instances (vary the index.html per instance to prove it)
Manually terminate one instance and observe the ASG automatically launch a replacement
Clean up: delete the ASG, Load Balancer, and Target Group to stop charges

Screenshot of the ALB DNS name serving traffic, and a screen recording or before/after screenshot showing the ASG replacing a terminated instance.