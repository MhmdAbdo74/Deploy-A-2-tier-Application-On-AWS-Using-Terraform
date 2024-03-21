
=======
# 🚀 Deploy - 2 tier Application throgh terraform 


✨This repository is created to learn and deploy  2-tier application on aws cloud through terraform. 

## 🏠 Architecture
![Architecture of the application](architecture.gif)

# task in steps
# task in steps
#### Step 1: create vpc modules and create on it all infrastructure for this  task .
#### Step 2: create nat gateway module and create on it 2 elatic ip , create nat gateway in pub-subnet1 and nat gateway in pub subnet 2 and creat 2 private route table and attach to private subnets  .
#### Step 3:  create key module and create on it 1 key pair 
#### Step 4: create security group module and create on it 2 security group for EC2 instances and 1 security group for RDS instances .
#### Step 5: create ec2 as module and create on it  1 ec2 instance  .
#### Step 6: create rds as module and create on it 2 rds instance one as primary and one as replica .
#### Step 7: create asg module and          
#### Step 4: create ec2 modules and on it create security group for EC2 instances  and create key that used for ssh and in the end create ec2 instance and make it number dynamic any number of instance can be created  and Distribute in 2 AZ  . 
#### Step 5: create EBS modules and on it create EBS volumes and attach it to EC2 instances 
#### Step 6: create root modules and call on it all modules that we created before and create a stack for this task .

