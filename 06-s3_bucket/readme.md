# Project 06: S3 Deep Dive: Storage Classes, Policies and Static Hosting

## Objective
Host a static website on S3, control access with a bucket policy, and explore storage classes.

## Why This Matters
Explain in your own words: low-cost hosting, the risks of public buckets, and saving money with storage classes.

- Low cost hostiing : is simply spending as little as possible to host your website or a server via the varrious provision made and provided by AWS services.

- The risks of public buckets is that anyone anywhere can access the information because the files of the bukcet will be live. leaking information and vital details.

- Storage classes: There are varrious storage classes provided via AWS services in bucket storage. The difference is that some storage allows easy access of files after storage but it is expensive, but others do not allow for such quick access but it is cheaper.

## 1. Bucket and Website Files
Bucket name: `egene-joshua-aws-portfolio`

![Lifecycle rule](./images/Screenshot%20(122).png)
![Lifecycle rule](./images/Screenshot%20(123).png)
![Lifecycle rule](./images/Screenshot%20(124).png)


## 2. Static Website Hosting
Live URL: http://egene-joshua-aws-portfolio.s3-website-us-east-1.amazonaws.com/index.html

## 3. Bucket Policy
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::egene-joshua-aws-portfolio/*"
    }
  ]
}
```
Giving permission to any user from everywhere to have access to the information.

## 4. Lifecycle Rule
![Lifecycle rule](./images/Screenshot%20(125).png)
![Lifecycle rule](./images/Screenshot%20(126).png)
![Lifecycle rule](./images/Screenshot%20(127).png)
![Lifecycle rule](./images/Screenshot%20(128).png)


## 5. Glacier Test
What happened when I tried to download resume.pdf, and why.

![Lifecycle rule](./images/Screenshot%20(129).png)

- This object is stored in the Glacier Flexible Retrieval (formerly Glacier) storage class
In order to access it you must first restore it.

- The Glacier flexible Retrieval storage classes is cheaper but keeps files for longer periods before user can demand and access them. 

## What I Learned
- How to host static pages and websites

- Proper use of storage classes and the package to use per the kind of files you want to store.

- Making websites public or blocking public addresses from accessing a website.
