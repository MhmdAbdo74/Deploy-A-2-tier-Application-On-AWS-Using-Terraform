
# creating VPC
module "VPC" {
  source           = "../modules/vpc"
  REGION           = var.REGION
  PROJECT_NAME     = var.PROJECT_NAME
  VPC_CIDR         = var.VPC_CIDR
  PUB_SUB_1_A_CIDR = var.PUB_SUB_1_A_CIDR
  PUB_SUB_2_B_CIDR = var.PUB_SUB_2_B_CIDR
  PRI_SUB_3_A_CIDR = var.PRI_SUB_3_A_CIDR
  PRI_SUB_4_B_CIDR = var.PRI_SUB_4_B_CIDR
  PRI_SUB_5_A_CIDR = var.PRI_SUB_5_A_CIDR
  PRI_SUB_6_B_CIDR = var.PRI_SUB_6_B_CIDR
}
# cretea NAT-NAT-GW
module "NAT-GW" {
  source = "../modules/nat"

  PUB_SUB_1_A_ID = module.VPC.PUB_SUB_1_A_ID
  IGW_ID         = module.VPC.IGW_ID
  PUB_SUB_2_B_ID = module.VPC.PUB_SUB_2_B_ID
  VPC_ID         = module.VPC.VPC_ID
  PRI_SUB_3_A_ID = module.VPC.PRI_SUB_3_A_ID
  PRI_SUB_4_B_ID = module.VPC.PRI_SUB_4_B_ID
  PRI_SUB_5_A_ID = module.VPC.PRI_SUB_5_A_ID
  PRI_SUB_6_B_ID = module.VPC.PRI_SUB_6_B_ID
}

module "key" {
  source = "../modules/key" 
}
# Creating Application Load balancer
module "ALB" {
  source         = "../modules/alb"
  PROJECT_NAME   = module.VPC.PROJECT_NAME
  ALB_SG_ID      = module.SG.ALB_SG_ID
  PUB_SUB_1_A_ID = module.VPC.PUB_SUB_1_A_ID
  PUB_SUB_2_B_ID = module.VPC.PUB_SUB_2_B_ID
  VPC_ID         = module.VPC.VPC_ID
}
module "SG" {
source = "../modules/sg"
VPC_ID = module.VPC.VPC_ID
}
# Crating Auto Scaling group
module "ASG" {
  source         = "../modules/asg"
  PROJECT_NAME   = module.VPC.PROJECT_NAME
  KEY_NAME       = module.key.KEY_NAME
  CLIENT_SG_ID   = module.SG.CLIENT_SG_ID
  PRI_SUB_3_A_ID = module.VPC.PRI_SUB_3_A_ID
  PRI_SUB_4_B_ID = module.VPC.PRI_SUB_4_B_ID
  TG_ARN         = module.ALB.TG_ARN

}
# launching JUMP server or Bastion host 
module "SERVER" {
  source         = "../modules/EC2"
  JUMP_SG_ID     = module.SG.JUMP_SG_ID
  PUB_SUB_1_A_ID = module.VPC.PUB_SUB_1_A_ID
  KEY_NAME       = module.key.KEY_NAME
}


module "RDS" {
  source         = "../modules/rds"
  DB_SG_ID       = module.SG.DB_SG_ID
  PRI_SUB_5_A_ID = module.VPC.PRI_SUB_5_A_ID
  PRI_SUB_6_B_ID = module.VPC.PRI_SUB_6_B_ID
  DB_USERNAME    = var.DB_USERNAME
  DB_PASSWORD    = var.DB_PASSWORD
}
# create cloudfront distribution 
module "CLOUDFRONT" {
  source = "../modules/cloudfront"
  CERTIFICATE_DOMAIN_NAME = var.CERTIFICATE_DOMAIN_NAME
  ALB_DOMAIN_NAME = module.ALB.ALB_DNS_NAME
  ADDITIONAL_DOMAIN_NAME = var.ADDITIONAL_DOMAIN_NAME
  PROJECT_NAME = module.VPC.PROJECT_NAME
}
module "ROUTE53" {
  source = "../modules/route53"
  CLOUDFRONT_DOMAIN_NAME = module.CLOUDFRONT.CLOUDFRONT_DOMAIN_NAME
  CLOUDFRONT_HOSTED_ZONE_ID = module.CLOUDFRONT.CLOUDFRONT_HOSTED_ZONE_ID

}
