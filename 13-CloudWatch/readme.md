CloudWatch — Monitoring, MetriLab 13: Build a Monitoring & Alerting Pipeline
cs, Logs & Alarms

Launch a t3.micro EC2 instance (or reuse one), install the CloudWatch Agent, configure it to send memory and disk metrics
Create a CloudWatch Alarm on CPUUtilization > 70% for 5 minutes
Create an SNS Topic 'ops-alerts', subscribe your email, confirm the subscription
Wire the alarm to publish to the SNS topic on ALARM state
Stress the CPU (e.g., 'yes > /dev/null &' briefly, or a stress-ng tool) to trigger the alarm and confirm you receive the email
Ship the web server's access log to a CloudWatch Log Group using the agent
Build a CloudWatch Dashboard with 3 widgets: CPU, memory, and a log widget showing recent access log lines

Screenshot of the received SNS alert email, plus a screenshot of your finished dashboard.