# Project 08: Secure Access to a Private Instance

## Objective
Reach a private server using a bastion host and then using Session Manager, and compare both.

## Why This Matters

Private servers are intentionally cut off from the public internet—meaning they have no public IP addresses and no direct route to the outside world. This network isolation keeps core databases and backend logic safe from automated internet scanners and malicious actors, but it also creates an administrative challenge: administrators still need a way to reach them for updates, maintenance, and debugging.

Managing private servers safely bridges that gap without compromising their security. Without a controlled, secure management path, infrastructure quickly becomes vulnerable due to a few key risks:

Eliminating the Need for Public Exposure: If private servers had direct public pathways for management (like open SSH ports facing the internet), they would instantly lose their primary security benefit. Safe management methods—such as routing traffic through a hardened bastion host or using IAM-controlled tunnels—keep the servers entirely hidden while still letting authorized engineers connect.

Cryptographic Authentication: Relying on secure key pairs or IAM roles rather than standard passwords prevents brute-force attacks, credential stuffing, and unauthorized access attempts.

Auditability and Traceability: Safe management frameworks ensure that every connection is logged. Knowing who accessed a private server, when they connected, and what changes were made provides vital visibility for security and compliance.

In short, managing a private server safely is about building a secure, locked "backstage entrance" that lets you do your work without ever unlocking the front door to the world.


## 1. Security Groups
- Bastion SG: SSH (22) from my IP only
- Private SG: SSH (22) from the bastion's security group

## 2. SSH Through the Bastion

- Bastion host: 10.0.1.203
- Private server: 10.0.2.124
![SSH jump](images/Screenshot%20(141).png)

## 3. Deliberate Misconfiguration
What I removed, what happened (timeout), and how I fixed it.

- Removed the inbound rule that allowed SSH from bastion host to the private server.
- Delayed, timeout and connection error message thrown from AWS due to the break of connection in the Security group connection of bastion host to the private server.
- Fixed it by adding a new inbound rule permittng the connection of bastion host security group to SSH into the private server.
![Timeout](images/Screenshot%20(142).png)
![Timeout](images/Screenshot%20(142).png)

## 4. Session Manager
IAM role used, VPC endpoints created, and result.
![Session Manager](images/Screenshot%20(145).png)
![Session Manager](images/Screenshot%20(147).png)

## 5. Comparison: Bastion/SSH vs Session Manager

| Feature | Bastion Host / SSH | AWS Systems Manager (SSM) Session Manager |
| :--- | :--- | :--- |
| **Inbound Network Ports** | **Yes.** Requires port 22 open on both the bastion host and the private server. | **No.** It initiates outbound connections, meaning zero inbound ports need to be opened. |
| **Authentication Keys** | **Yes.** Requires a `.pem` private key file. | **No.** Authentication is handled natively through AWS IAM. |
| **Infrastructure Requirements** | **Yes.** Requires a public server (the bastion) and a functioning route to it. | **No.** Instances connect directly without needing a public bastion or gateway. |
| **Access Control** | Managed via **Security Groups** and `.pem` key files. | Managed via **AWS IAM permissions** (policies and roles). |
| **Activity Logging** | **Not by default.** Requires manual configuration. | **Yes.** Sessions can be fully logged to S3/CloudWatch, and CloudTrail records user activity. |
| **Cost Implications** | The bastion EC2 instance runs continuously, incurring steady hourly compute costs. | The SSM service itself is free, but deploying it in a fully private subnet requires VPC endpoints or a NAT Gateway, which incur hourly fees. |

In this project I connected to a private server in two ways. With the bastion host, I SSH’d into a public server first and then jumped to the private one. This needed port 22 open on both servers, a key file, and an extra public instance that has to be kept running and secured. If the key is stolen or the bastion is attacked, the private network is at risk.

With Session Manager, I connected from the AWS console. It needed no open inbound port, no key file and no bastion. Access is controlled by IAM, so I can decide exactly who may connect, and sessions can be logged. Its setup was harder, because the private server needed an IAM role and VPC endpoints, and I had to fix security group and DNS problems before it worked.

Only the bastion approach needed an open inbound port. For production I would recommend Session Manager. It removes the attack surface, there is no key to lose, every session can be traced to a person, and permissions are managed in one place with IAM. The bastion approach is simpler for learning, but it is riskier and needs more maintenance.

## What I Learned
An instance needs an IAM role attached before Session Manager can work.
The SSM Agent reads its credentials at startup, so rebooting after attaching a role helps.
Fleet Manager shows whether an instance has registered with Systems Manager.
Reading the exact error message tells me which part is broken (role, endpoint or DNS).

Fleet Manager only shows servers that have registered with Systems Manager.
When something won’t connect, I check things one at a time in order: region, role, settings, network.
Session Manager has several parts (role, agent, endpoints, DNS), and each one must be correct.
The console is region-based, so I must always check I’m looking at the right region.

Session Manager worked with no SSH rule, no key and no bastion.
Endpoints have their own security group, and it must allow HTTPS (443) from my VPC.
A security group with no inbound rule blocks all traffic.
Fleet Manager showing my server Online means the agent has registered successfully.
When one setting is wrong, the error can point to a different cause, so I check every part one at a time.