locals {
  primary_azs = [
    for az in var.primary_azs :
    "${var.primary_region}${az}"
  ]

  replica_azs = [
    for az in var.replica_azs :
    "${var.replica_region}${az}"
  ]
}


############################
# Primary Region
############################

module "network_primary" {
  source = "../../modules/network"

  azs = local.primary_azs
}

module "alb_primary" {
  source = "../../modules/alb"

  vpc_id     = module.network_primary.vpc_id
  subnet_ids = module.network_primary.public_subnet_ids
}

module "compute_primary" {
  source = "../../modules/compute"

  vpc_id           = module.network_primary.vpc_id
  subnet_ids       = module.network_primary.private_subnet_ids
  alb_sg_id        = module.alb_primary.security_group_id
  target_group_arn = module.alb_primary.target_group_arn
}

module "aurora_primary" {
  source = "../../modules/aurora"

  vpc_id     = module.network_primary.vpc_id
  subnet_ids = module.network_primary.private_subnet_ids
}

############################
# Replica Region
############################

# module "network_replica" {
#   source = "../../modules/network"

#   providers = {
#     aws = aws.replica
#   }

#   azs = local.replica_azs
# }

# module "aurora_replica" {
#   source = "../../modules/aurora_replica"

#   providers = {
#     aws = aws.replica
#   }

#   # network
#   vpc_id     = module.network_replica.vpc_id
#   subnet_ids = module.network_replica.private_subnet_ids
#   # aurora
#   source_cluster_arn = module.aurora_primary.cluster_arn
#   aurora_engine      = module.aurora_primary.aurora_engine
# }
