Lab 11: Build a Serverless Data Table

Create a DynamoDB table 'Visitors' with partition key 'visitorId' (String)
Set capacity mode to On-Demand
Using the console, manually add 3 sample items with attributes like name, timestamp, and message
Use the AWS CLI to run a put-item command to insert a 4th item
Use the CLI to run get-item and query commands to retrieve specific records
Add a Global Secondary Index on an attribute like 'timestamp' and query using it
Delete an item via CLI, confirm it's gone via console

A text file containing the exact AWS CLI commands you used for put-item, get-item, and delete-item, with their outputs.
