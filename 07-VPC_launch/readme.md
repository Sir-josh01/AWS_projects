Networking Essentials
Lab 7: Build a Custom VPC from Scratch

Create a custom VPC with CIDR 10.0.0.0/16, name it 'bootcamp-vpc'
Create a public subnet 10.0.1.0/24 and a private subnet 10.0.2.0/24, each in a different AZ
Create and attach an Internet Gateway to the VPC
Create a route table for the public subnet with a 0.0.0.0/0 route to the IGW, associate it with the public subnet
Confirm the private subnet uses the default (no internet) route table
Launch a t3.micro instance in the public subnet, confirm it gets a public IP and can reach the internet
Launch a second t3.micro instance in the private subnet, confirm it has NO public IP and cannot be reached directly

A simple network diagram (hand-drawn or diagrams.net) of your VPC showing both subnets, the IGW, and route table associations.
