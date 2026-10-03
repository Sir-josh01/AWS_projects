Lab 12: Build a Serverless REST API

Create a Lambda function (Python or Node.js) named 'visitor-api'
Attach an execution role granting it PutItem/GetItem/Scan on the Visitors DynamoDB table from Lab 11
Write function code that inserts a new visitor record (name + timestamp) into DynamoDB and returns a JSON response
Test the function directly in the Lambda console using a sample test event
Create a new REST API in API Gateway with a POST /visitors route wired to this Lambda
Deploy the API to a 'prod' stage, enable CORS
Test the live endpoint using curl or Postman, confirm new items appear in DynamoDB
Write a second Lambda + GET route to list all visitors, deploy and test it

The Lambda function code, the API Gateway invoke URL, and a curl/Postman screenshot showing a successful POST and GET against the live endpoint.