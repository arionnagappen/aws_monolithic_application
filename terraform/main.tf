// --- network ---
module "network" {
  source = "./modules/network"

  vpc_cidr              = "10.0.0.0/16"
  availability_zones    = ["af-south-1a", "af-south-1b"]
  public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
  app_subnet_cidrs      = ["10.0.3.0/24", "10.0.4.0/24"]
  database_subnet_cidrs = ["10.0.5.0/24", "10.0.6.0/24"]

  vpc_tag = "MyVPC"
  pub_subnet_tag = "PublicSubnet"
  app_subnet_tag = "AppSubnet"
  database_subnet_tag = "DatabaseSubnet"
}

// --- COMPUTE ---
module "compute" {
  source = "./modules/compute"

  // Launch Template //
  name_prefix = "App Server-"
  inst_ami  = "ami-0914bddde8faa93a0"
  inst_type = "t3.micro"
  launch_temp_tag = "MyLaunchTemp"

  // Auto Scaling Group //
  asg_name = "App Server ASG"
  maximum_size = 3
  minimum_size = 1
  desired_cap = 2
  asg_tag = "AppServer"
  health_chk_type = "ELB"
  health_chk_grace_period = 300

  // Application Load Balancer //
  alb_tg_name = "ApplicationTargetGroup"
  alb_protocol = "HTTP"
  alb_health_interval = 30
  alb_health_timeout = 5
  alb_healthy_threshold = 5
  alb_unhealthy_threshold = 2
  alb_health_matcher = 200
  alb_name = "ApplicationLoadBalancer"

  // Bastion Host //
  bastion_inst_ami = "ami-0914bddde8faa93a0"
  bastion_inst_type = "t3.micro"
  bastion_tag = "BastionHost"

  // Import network IDs
  vpc_id              = module.network.vpc_id
  availability_zones  = module.network.availability_zones
  public_subnet_ids   = module.network.public_subnet_ids
  app_subnet_ids      = module.network.app_subnet_ids
  database_subnet_ids = module.network.database_subnet_ids

  // Import App Server Instance Profile Name
  app_server_instance_profile_name = module.security.app_server_instance_profile_name
}

// --- DATABASE ---
module "database" {
  source = "./modules/database"

  // Database Subnet Group
  db_subnet_group_name = "rds-private-subnet-group"
  db_subnet_group_tag = "RDS subnet group"
  
  // Database Instance
  db_identifier   = "my-app-db"
  db_engine       = "mysql"
  db_eng_version  = "8.0.41"
  db_inst_class   = "db.t3.micro"
  db_storage_size = 10
  secret_name     = "rds-credentials"

  // network IDs
  vpc_id              = module.network.vpc_id
  availability_zones  = module.network.availability_zones
  app_subnet_ids      = module.network.app_subnet_ids
  database_subnet_ids = module.network.database_subnet_ids

  // Compute IDs
  app_server_sg_id = module.compute.app_server_sg_id

  // KMS KEY
  kms_key_id = module.security.kms_key_id
}

// --- FRONTEND --- 
module "frontend" {
  source = "./modules/frontend"
}

// --- STORAGE ---
module "storage" {
  source = "./modules/storage"

  kms_key_arn = module.security.kms_key_arn
}

// --- SECURITY ---
module "security" {
  source = "./modules/security"

  user_data_arn = module.storage.user_data_arn
}