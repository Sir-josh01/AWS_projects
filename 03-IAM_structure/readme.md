# Project 03: IAM Groups, Users, Policies and Roles

## Objective
Practice least-privilege access using IAM groups, users, a custom inline policy and a role.

## 1. Groups
- `Developers`: AmazonS3ReadOnlyAccess
- `Admins`: AdministratorAccess

![Groups](./images/Screenshot%20(90).png)

## 2. Users
| User | Group |
|------|-------|
| dev-user | Developers |
| ops-user | Admins |

## 3. Custom Inline Policy for dev-user
Explain in your own words what each part does (Effect, Action, Resource).

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:DescribeVolumeStatus",
                "ec2:DescribeVolumes",
                "ec2:DescribeInstanceTypes",
                "ec2:DescribeVolumesModifications",
                "ec2:DescribeInstanceEventNotificationAttributes",
                "ec2:DescribeInstanceEventWindows",
                "ec2:DescribeInstanceStatus"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "ec2:StartInstances",
                "ec2:DescribeInstanceAttribute",
                "ec2:StopInstances",
                "ec2:DescribeVolumeAttribute"
            ],
            "Resource": [
                "arn:aws:resource-groups:*:206238482722:group/*",
                "arn:aws:license-manager:*:206238482722:license-configuration:*",
                "arn:aws:ec2:*:206238482722:volume/*",
                "arn:aws:ec2:*:206238482722:instance/*"
            ]
        }
    ]
}
```
Full file: [dev-user-ec2-policy.json](dev-user-ec2-policy.json)

## 4. IAM Role: EC2-S3-ReadOnly-Role
### Describe the trust policy and why a role is used instead of a user.

- Think of an IAM User as a permanent identity meant for a single human or service—it comes with long-term credentials (like passwords or permanent API access keys) that never expire unless you change them manually. If those keys leak, anyone can access your AWS environment.

- An IAM Role, on the other hand, is a temporary identity with no permanent credentials. When a human developer or an AWS service (like an EC2 instance or Lambda function) needs access, they assume the role to get temporary, auto-expiring security tokens.

### Using roles instead of users gives you:

- Better Security: No long-term access keys sitting in code, configuration files, or local### The Trust Policy
- An IAM Trust Policy is a JSON policy attached directly to an IAM Role. It defines who (which AWS services, IAM users, external AWS accounts, or federated identity providers) is allowed to assume that role.

- Think of it as a gatekeeper: while permissions policies define what actions can be performed, the trust policy specifies who is trusted to put on the mask and take on those permissions.

### Why Use a Role Instead of a User?
- No Long-Term Credentials: IAM Users come with long-lived credentials (passwords and permanent Access Keys) that can be leaked or compromised. Roles use short-lived, temporary security tokens issued by AWS STS that expire automatically.

- Service-to-Service Authorization: AWS resources (like an EC2 instance or Lambda function) cannot "log in" as a human user. Attaching a role directly to the resource allows it to securely access other services without hardcoding secret keys inside your application code.

- Temporary Access & Delegation: Roles allow you to grant cross-account access or federated access (e.g., logging in via Google or Okta) dynamically without creating permanent IAM accounts for every external person or system.


![Trust relationship](./images/Screenshot%20(93).png)

## 5. Testing
- Stop instance: succeeded
- Terminate instance: Access Denied

![Stop an instance successfully](./images/Screenshot%20(91).png)
![Access denied](./images/Screenshot%20(92).png)

## What I Learned
### Least privilege, implicit deny, groups vs roles, why trust policies matter.

- Least Privilege: Roles make it easy to hand out temporary permissions for specific tasks and automatically revoke them when the session ends, rather than leaving broad permanent access on a user account.

- Implicit Deny: In IAM, everything is denied by default. Unless a trust policy explicitly allows an entity to assume a role, access is completely blocked.

- Groups vs. Roles: You assign IAM Groups to human team members (e.g., Developers, Admins) to attach shared long-term permissions policies. You use IAM Roles when machines, applications, external accounts, or temporary sessions need temporary credentials to perform work.
