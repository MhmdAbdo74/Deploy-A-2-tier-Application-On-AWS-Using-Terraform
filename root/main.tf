
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
