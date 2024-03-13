# 🚀  2 tier Application throgh terraform 

✨This repository is created to learn and deploy  2-tier application on aws cloud through terraform. 

## 🏠 Architecture
![Architecture of the application](architecture.gif)

# task in steps
# task in steps
#### Step 1: create vpc modules and create on it all infrastructure for this  task .
#### Step 2: after defination vpc modules create on it vpc and internet gateway and choose 2 AZ for creation our ec2 on it .
#### Step 3:  then create subnets and route tables and associate them with the VPC and internet gateway.
#### Step 4: create ec2 modules and on it create security group for EC2 instances  and create key that used for ssh and in the end create ec2 instance and make it number dynamic any number of instance can be created  and Distribute in 2 AZ  . 
#### Step 5: create EBS modules and on it create EBS volumes and attach it to EC2 instances 
#### Step 6: create root modules and call on it all modules that we created before and create a stack for this task .

