# Project 07: Build a Custom VPC from Scratch

## Objective
Build a custom VPC with a public and a private subnet, and test internet access for each.

## Why This Matters
Subnets divide a VPC into isolated network segments to enforce security through network segmentation.

* **Public Subnets:** Designed for internet-facing resources (such as Web Servers, Load Balancers, or Bastion Hosts). They have direct routes to the Internet Gateway, assigning public IP addresses to resources so external users can access them.
* **Private Subnets:** Designed to isolate backend components (such as Application Servers, APIs, and Databases) from direct internet exposure. They lack direct routes to an Internet Gateway, preventing unauthorized inbound access while protecting critical data.

## 1. VPC and Subnets
| Resource | Value |
|----------|-------|
| VPC | Project-vpc, 10.0.0.0/16 |
| Public subnet | 10.0.1.0/24 (AZ a) |
| Private subnet | 10.0.2.0/24 (AZ b) |

## 2. Internet Gateway and Route Tables
* **Public Route Table:** Contains an explicit route targeting `0.0.0.0/0` (all IPv4 traffic) to an attached **Internet Gateway (IGW)**, allowing bidirectional internet communication.
* **Private Route Table:** Contains only local VPC routes (`10.0.0.0/16`), isolating instances from direct inbound and outbound internet access (or routing outbound traffic through a **NAT Gateway**).

![VPC diagram](./images/Screenshot%20(131).png)

## 3. Testing
* **Public Server:** Assigned a public IP address and successfully verified outbound internet connectivity via ping/curl.
![VPC diagram](./images/Screenshot%20(132).png)

* **Private Server:** Has only a private IP address. Verified that it cannot be reached directly from the internet and cannot access external networks without a NAT device.
![VPC diagram](./images/Screenshot%20(133).png)

## 4. Network Diagram
![VPC diagram](./images/Screenshot%20(130).png)

## What I Learned
* **VPC Architecture:** How to create custom IP address spaces using CIDR blocks (`10.0.0.0/16`) and partition them across Availability Zones.
* **Network Segmentation:** Why sensitive workloads (like databases) belong in private subnets without public IPs.
* **Route Table Logic:** How associating subnets with specific route tables determines whether resources are publicly accessible or isolated.