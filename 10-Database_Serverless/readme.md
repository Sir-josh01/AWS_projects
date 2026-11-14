# Project 10: Databases and RDS

## Objective
Launch a private MySQL RDS database, connect from EC2, and practice backup and restore with snapshots.

## Why This Matters

- Databases hold the most valuable data, so they go in private subnets with no public access.
- Letting only your app server reach port 3306 means a stranger can’t even try to log in.
- Snapshots are your safety net against mistakes, bugs and attacks. Knowing how to restore is a core cloud skill.

## 1. Network Setup
- Second private subnet in a different AZ
- DB Subnet Group with both private subnets
- `rds-sg`: MySQL (3306) from the EC2 security group only

## 2. RDS Instance
Engine MySQL, db.t3.micro, Multi-AZ disabled, public access No.

## 3. Connection and Query from EC2
![Connection and query](images/Screenshot%20(158).png)
![Connection and query](images/Screenshot%20(159).png)

## 4. Manual Snapshot
![Snapshot list](images/Screenshot%20(161).png)
![Snapshot list](images/Screenshot%20(162).png)

## 5. Disaster and Restore
What I deleted, how I restored, and the result.

- Deleted "Ada" from the table
- Restored it by running a new instance using snapshot
- The restored database instance came back with "Ada" back to the table.

![Disaster caused](images/Screenshot%20(163).png)
![Disaster caused](images/Screenshot%20(164).png)
![Disaster fixed](images/Screenshot%20(165).png)

## 6. When to Enable Multi-AZ

- What it is: AWS keeps a standby copy of your database in another AZ and switches to it automatically if the first one fails.
- Purpose: high availability, so there’s little downtime.
- Implication: it roughly doubles the cost, and it’s not a backup. A deleted row is deleted in both copies. That’s why you still need snapshots.
- Enable it for: production systems, customer-facing apps, anything where downtime costs money or reputation.
- Skip it for: learning labs, test environments and low-importance data, which is why this lab turns it off.

## 7. Clean Up
Deleted both RDS instances and the snapshot.

## What I Learned

- RDS is a managed database, so AWS handles patching and backups.
- A DB Subnet Group needs subnets in at least two AZs.
- Databases belong in private subnets with public access turned off.
- Using the app server’s security group as the source means only that server can reach port 3306.
- A snapshot is a point-in-time backup that I can restore from.
- Restoring a snapshot creates a new database with a new endpoint.
- Multi-AZ gives high availability but is not a backup, and it costs about double.
- Snapshots and databases both cost money, so I delete them when I’m done.