# Project 04: Launching and Configuring an EC2 Web Server

## Objective
Launch an EC2 instance, connect with SSH, and host a simple web page.

## 1. Instance Setup
- AMI: Amazon Linux 2023
- Type: t3.micro
- Key pair: my-key (.pem, permissions set with chmod 400)

## 2. Security Group Rules
| Type | Port | Source |
|------|------|--------|
| SSH  | 22   | My IP  |
| HTTP | 80   | Anywhere |

## 3. SSH Connection
![SSH connected](./images/Screenshot%20(100).png)
![SSH connected](./images/Screenshot%20(94).png)


## 4. Web Server Installation
```bash
sudo dnf install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
```
![SSH connected](./images/Screenshot%20(95).png)
![SSH connected](./images/Screenshot%20(96).png)

## 5. Custom Web Page
![Web page](./images/Screenshot%20(99).png)

## 6. Stop and Restart: IP Change
Old IP vs new IP, and why it changed (dynamic vs static IP, Elastic IP).
When you launch a standard EC2 instance, AWS assigns it a dynamic public IP address from its shared pool of IPv4 addresses.

When you stop an instance, AWS releases that public IP address back into the general AWS pool so another customer can use it. When you start (fire up) the instance again, AWS assigns it a brand-new public IP address from the available pool.

Here is why AWS does this:

IPv4 Scarcity & Cost: Public IPv4 addresses are limited and expensive. AWS avoids holding an IP reserved for an inactive, stopped server.

Pool Efficiency: Holding onto public IPs for stopped instances would waste address space across millions of servers.


![Web page](./images/Screenshot%20(99).png)
![Web page](./images/Screenshot%20(101).png)


## 7. Clean Up
Instance terminated to avoid charges.

## What I Learned
-
