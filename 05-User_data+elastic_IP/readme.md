# Project 05: EC2 Automation, Elastic IPs and AMIs

## Objective
Automate a web server with User Data, use an Elastic IP, and launch an instance from a custom AMI.

## 1. User Data Script
```bash
paste your script here
```
Full file: [user-data.sh](user-data.sh)

## 2. Site Live Without SSH
![First instance](images/first-instance.png)

## 3. Elastic IP
Elastic IP stayed the same after stop and start. Explain why in your own words.

## 4. Custom AMI
Created `web-server-baseline-v1` from the first instance.

## 5. Second Instance from AMI
![Second instance](images/second-instance.png)

## 6. Clean Up
Released the Elastic IP and terminated both instances.

## What I Learned
User Data vs AMI: when to use each, and why Elastic IPs cost money when idle.