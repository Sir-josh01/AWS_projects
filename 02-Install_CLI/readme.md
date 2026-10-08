# Project: AWS Account Security and CLI Setup

## Objective
Secure the AWS account with MFA, install and configure the AWS CLI v2,
and set up a cost budget.

## 1. MFA Configuration
- Enabled MFA on the root account using an authenticator app
- Enabled MFA on IAM user `sirjosh01`

![images](./images/Screenshot%20(84).png)
![images](./images/Screenshot%20(83).png)


## 2. AWS CLI v2 Installation
```bash
aws --version
```
![CLI version](images/Screenshot%20(85).png)

## 3. CLI Configuration and Identity Verification
```bash
aws configure
aws sts get-caller-identity
aws s3 ls
```
![get-caller-identity output](images/Screenshot%20(86).png)
![get-caller-identity output](images/Screenshot%20(89).png)

## 4. Budget Configuration
![Budget setup](images/Screenshot%20(87).png)
![Budget setup](images/Screenshot%20(88).png)

## What I Learned
Short notes on why root should be locked down and why IAM users plus MFA are best practice.
- if root is hackced, attacker controls everything.
- If shared, you cannot tell WHO used root and what they did. No trail.
- Root has the ability to bypass all securities, with this power in a wrong hands, huge damages will occur.

### IAM User
- IAM alone can be hacked and details stolen via phishing, keylogger, reuse and brute force.
- MFA adds a second wall that even if access password and user was given to a strange body without the third party (google authenticator) access is not given.