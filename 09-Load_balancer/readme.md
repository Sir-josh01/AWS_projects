# Project 09: Load Balancing and High Availability

## Objective
Build a highly available web app using a Launch Template, an Application Load Balancer and an Auto Scaling Group.

## Why This Matters
Explain in your own words why one server is risky and how multiple AZs and auto scaling help.


## 1. Network and Security Groups
- Second public subnet in a different AZ, routed to the IGW
- `alb-sg`: HTTP (80) from anywhere
- `web-sg`: HTTP (80) from `alb-sg` only

## 2. Launch Template
Name, AMI and User Data script.
Full file: [user-data-alb.sh](user-data-alb.sh)

## 3. Load Balancer and Target Group
Health check path `/`, listener on port 80.
![Health Check](images/Screenshot%20(153).png)


## 4. Auto Scaling Group
Min 2 / Desired 2 / Max 4, across both AZs.

## 5. Proof the Load Balancer Works
![ALB serving traffic](images/Screenshot%20(148).png)
![ALB serving traffic](images/Screenshot%20(149).png)

## 6. Self-Healing Test
![Before termination](images/Screenshot%20(152).png)
![After termination](images/Screenshot%20(154).png)

## 7. Clean Up
Deleted the ASG, load balancer and target group.

## What I Learned

- In this project I built a highly available web application on AWS. I created a Launch Template with a User Data script, a second public subnet in a different AZ, an Application Load Balancer, a Target Group with a health check, and an Auto Scaling Group with a minimum of 2 and maximum of 4 servers. I confirmed the load balancer shared visitors between servers, then terminated one server and watched the Auto Scaling Group replace it. Troubleshooting unhealthy targets taught me that security group rules must match on both sides, and that error messages point to the cause. I cleaned up by deleting the ASG, load balancer and target group to avoid charges.

user-data:
#!/bin/bash
# Project 09 - User Data script for the Launch Template
# Every instance builds a page that shows ITS OWN instance ID and Availability Zone.

# 1. Install, start and enable Apache
dnf install -y httpd
systemctl start httpd
systemctl enable httpd


# 2. Ask the instance who it is (IMDSv2: get a token first, then ask)
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/availability-zone)

# 3. Use the last 6 characters of the instance ID as a background color,
#    so every instance looks different
COLOR=${INSTANCE_ID: -6}

# 4. Write the page (no quotes around EOF, so the $variables are filled in)
cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Load Balanced Server</title>
  <style>
    body {
      margin: 0;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: Arial, Helvetica, sans-serif;
      color: white;
      text-align: center;
      background: #$COLOR;
    }
    .card {
      background: rgba(0, 0, 0, 0.65);
      padding: 40px;
      border-radius: 20px;
      max-width: 520px;
      width: 90%;
    }
    .emoji { font-size: 60px; }
    .name { color: #ffd166; }
    .badge {
      display: inline-block;
      background: #ff9900;
      color: #111;
      font-weight: bold;
      padding: 6px 14px;
      border-radius: 20px;
      margin: 6px;
    }
    code { background: rgba(255, 255, 255, 0.15); padding: 4px 8px; border-radius: 6px; }
  </style>
</head>
<body>
  <div class="card">
    <div class="emoji">&#9878;&#65039;</div>
    <h1>Hi, I'm <span class="name">Egene Joshua</span></h1>
    <p>This page was served by:</p>
    <p><code>$INSTANCE_ID</code></p>
    <div class="badge">Zone: $AZ</div>
    <div class="badge">Behind an Application Load Balancer</div>
    <p>Refresh the page. If the ID and color change, the load balancer is working!</p>
  </div>
</body>
</html>
EOF