# Securing and Scaling a Legacy AWS App with Terraform

> ⚠️ This is a fictional scenario created for educational and portfolio purposes.

## Scenario

**ZenLedgerX**, a fictional fintech startup, built a monolithic internal tool to manage sensitive financial data. Initially deployed using AWS Console configurations, the setup became increasingly fragile and insecure as the company scaled.

### Key Issues Identified

- **Security Risks**
  - App and database shared a public subnet.
  - Hardcoded credentials.
  - No encryption on data.
- **No Access Controls**
  - Shared root/admin credentials.
  - No IAM roles or least-privilege enforcement.
- **Lack of Scalability**
  - Single EC2 instance.
  - No auto scaling or load balancing.
- **Flat Network Architecture**
  - No segmentation.
  - Public exposure of critical resources.
- **No Monitoring**
  - Manual issue detection.
- **No Infrastructure-as-Code**
  - Console-driven deployments with no version control.

---

## Solution Overview

A secure, scalable, and production-ready AWS environment was built using **Terraform**. It includes:

- Multi-AZ architecture
- Subnet segmentation
- Auto Scaling and Load Balancing
- KMS encryption and IAM best practices
- Monitoring, alerting, and secrets management

---

## Infrastructure Architecture

### Network Design

- **Multi-AZ Strategy**: High availability across 2 AZs.
- **Subnets**:
  - Public subnet: Load balancer, NAT, bastion host
  - Private subnet (App): EC2 auto scaling group
  - Private subnet (DB): RDS instance

### Internet Access

- **Internet Gateway**: Attached to public subnets
- **NAT Gateway**: Allows private app servers to access the internet for updates

### Load Balancer

- **ALB** routes HTTP requests from the internet to private app servers on port 80.

### Bastion Host

- Deployed in the public subnet to securely SSH into private EC2 instances.

---

## Compute Solution

### Auto Scaling Group (ASG)

- Dynamically adjusts app server instances based on traffic.
- Health checks via ALB.
- EC2 security groups only allow:
  - Port 80 from ALB
  - Port 22 from Bastion Host

### Load Balancing

- Evenly distributes traffic across AZs and replaces unhealthy instances.

---

## Database Solution

- **RDS in Private Subnet**: No internet access
- **KMS Encryption**: Protects data at rest and in transit
- **Secrets Manager**: Stores database credentials securely
- **Multi-AZ Deployment**: Standby instance for failover

---

## Static Frontend & CDN

- **Amazon S3** stores frontend assets (public access blocked)
- **CloudFront CDN** caches assets globally for low latency
- Bucket policy restricts access to CloudFront only

---

## User Content Storage

- **Separate S3 Bucket** with:
  - Blocked public access
  - KMS encryption (customer-managed key)
  - IAM role allowing only app servers access

---

## IAM Strategy

### IAM Groups & Policies

- Department-specific groups:
  - Developers, Operations, Finance, Analysts
- Least-privilege policies enforced for each group

### Account Hardening

- **Multi-Factor Authentication**
- **Strong Password Policy**:
  - 14+ characters
  - Symbols, numbers, uppercase & lowercase
  - 90-day rotation
  - No reuse of last 5 passwords

---

## Monitoring & Alerting

### CloudWatch Alarms

- Monitors average EC2 CPU utilization
- Triggers scale-out/in policies for ASG

### Amazon SNS

- Sends email alerts on alarm trigger for immediate response

---

## Testing

- **Amazon Stress** utility used to simulate high CPU load
- CloudWatch alarms trigger correctly and scale-out policy is activated
- SNS delivers alert email in real-time

---

## Infrastructure as Code (IaC)

### Problems with AWS Console Approach

- Inconsistent environments
- No version control
- No testing before deployment
- No modularity

### Terraform Solution

- Modular, reusable architecture with:
  - `terraform validate`
  - `terraform plan`
  - Version control (Git)
- Environments:
  - Dev
  - Staging
  - Production

---

## Key Troubleshooting Scenarios

### 1. App Servers Constantly Terminating

- Cause: ALB health check failed (no web server running)
- Fix: Added `user_data` script with correct `dnf` commands to install and run Nginx on Amazon Linux 2023

### 2. SSH Timeout to App Servers

- Cause: Missing **egress rule** on Bastion Host's security group
- Fix: Added outbound rule for port 22

### 3. CloudWatch Alarm Not Triggering

- Cause: Incorrect namespace (`AWS/ASG` instead of `AWS/EC2`)
- Fix: Updated alarm to reference `AWS/EC2`

---

## Summary

This project:

- Transformed insecure console-managed infrastructure into production-grade IaC
- Introduced segmentation, security, scalability, and observability
- Used Terraform for repeatable, testable, and collaborative infrastructure management

✅ The system now supports multiple environments and handles traffic surges automatically.

---

## Possible Next Steps

- Add CI/CD pipeline with GitHub Actions to automate:
  - Validation
  - Planning
  - Deployment

---

## Contact

📩 [LinkedIn – Arion Nagappen](https://www.linkedin.com/in/arion-nagappen)


