Create IAM group 'Developers' and attach AmazonS3ReadOnlyAccess
Create IAM group 'Admins' and attach AdministratorAccess
Create 2 new IAM users: 'dev-user' (add to Developers) and 'ops-user' (add to Admins)
Write a custom inline policy for dev-user that ALSO allows only starting/stopping EC2 instances (not terminating) — practice writing raw JSON
Create an IAM Role named 'EC2-S3-ReadOnly-Role' with a trust policy for EC2, attach AmazonS3ReadOnlyAccess
Test: log in as dev-user and confirm you CANNOT terminate an EC2 instance, but CAN stop one
Document the policy JSON you wrote in a text file for your portfolio
The custom JSON policy file, and a screenshot showing the Access Denied error when dev-user attempts a forbidden action.