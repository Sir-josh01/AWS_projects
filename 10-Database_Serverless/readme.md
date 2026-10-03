Databases & Serverless

Create a second private subnet in bootcamp-vpc (different AZ) so you have 2 private subnets for a DB Subnet Group
Create a DB Subnet Group using both private subnets
Launch a db.t3.micro MySQL RDS instance, Multi-AZ disabled for cost (discuss when you WOULD enable it), inside the DB Subnet Group
Create a Security Group for RDS allowing port 3306 only from your EC2 instance's Security Group
Connect from your EC2 bastion/app instance using the MySQL client, create a test database and table
Take a manual snapshot, then simulate disaster: delete a row, restore from snapshot into a new instance, and verify the data returned
Delete both RDS instances at the end of the lab to avoid charges

Terminal output showing a successful connection and query from EC2 to RDS, plus a screenshot of the manual snapshot listing.