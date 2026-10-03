S3 Deep Dive — Storage Classes, Policies & Static Hosting

Create an S3 bucket with a unique name (e.g., yourname-aws-portfolio)
Build a simple index.html + error.html (can be plain HTML/CSS, no framework needed)
Upload the files, enable Static Website Hosting in bucket properties
Turn off Block Public Access and attach a bucket policy allowing public GetObject
Confirm the site loads via the S3 website endpoint URL
Create a lifecycle rule that transitions objects older than 30 days to Standard-IA (configure only, no need to wait)
Upload a second 'resume.pdf' file and set its storage class manually to Glacier, then attempt to download it and observe the retrieval behavior

The live S3 website URL, and a screenshot of your configured lifecycle rule.