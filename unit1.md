# Unit 1: Cloud Computing

## Cloud Computing
- Cloud services like compute, storage, database, networking, etc.
- **Why Cloud Computing?**: On-demand, Scalability, Flexibility, High Availability, Pay-as-you-go
- **Benefits**: Cost saving, Scalability, Flexibility, No need to set up infrastructure
- **Why AWS?**: Reliability

## AWS Regions
- Geo-regions that host AWS centers to prevent fault tolerance

## AWS Availability Zone (AZ)
- Zones that allow hosting applications across various AZs
- **Global Reach**: 31+ Regions and 99+ AZs

## Types of AWS Services
1. **Compute**
   - AWS EC2: Virtual Servers
   - AWS Lambda: Serverless compute for small tasks

2. **Storage**
   - S3: Backups, images, and large files
   - EBS: Running databases or apps on EC2

3. **Databases**
   - AWS RDS: Relational database
   - AWS DynamoDB: NoSQL database

4. **Networking**
   - AWS VPC: Private Cloud
   - AWS CloudFront: Content Delivery Network (CDN)

5. **Security**
   - IAM

6. **Monitoring**
   - AWS CloudWatch

## Key Features of AWS EC2
1. Scalability
2. Cost-effective
3. Elasticity
4. AMI setup
5. Integration

## Types of EC2 Instances
1. General Purpose
2. Compute
3. Memory
4. Storage
5. Accelerated Computing

## Key Concepts
1. Load Balancer (ELB)
2. Auto-scaling
3. EBS
4. Key Pair

## S3 Features
1. **Bucket**: Used for storing object files
2. **Data Management**: Managing data via lifecycle policy
3. **Data Security**: Securing data
4. **Data Access**: SSH API
5. **Storage Classes**:
   - S3 Standard: Regular
   - S3 Intelligent: Auto cost optimization
   - S3 Glacier: Long-term storage

### IAM Policy for S3
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-demo-bucket/*"
    }
  ]
}
```

- Enable versioning: Store different versions
- Lifecycle to Glacier: Delete after a specific time
- Command to copy from S3:
```bash
aws s3 cp s3:<link> .localfile
```

## Key Features of IAM
1. User management
2. Groups
3. Roles
4. Policies
5. MFA
6. Federation
7. Access Key

### Best Practices
1. Enable MFA
2. Use Groups
3. Regular security checks
4. Avoid long-term access keys

### Monitoring Tools
1. CloudTrail
2. Access Analyzer

## Key Features of CloudWatch
1. Metrics
2. Visualize Dashboard
3. Logs
4. Alarm
5. Insights
6. Events

### Example Flow
1. Browse EC2 > Per instance > CPU > 70% > Amazon SNS > Alarm
2. Dashboard > Create Dashboard > Line Graph
3. IAM Role > Install CloudWatch Agent
```bash
sudo yum install amazon-cloudwatch-agent
```
4. Filter and Sort Fields

