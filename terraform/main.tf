// --- NETWORKING ---
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

  inst_ami  = "ami-0914bddde8faa93a0"
  inst_type = "t3.micro"

  // Networking IDs
  vpc_id              = module.network.vpc_id
  availability_zones  = module.network.availability_zones
  public_subnet_ids   = module.network.public_subnet_ids
  app_subnet_ids      = module.network.app_subnet_ids
  database_subnet_ids = module.network.database_subnet_ids

  // App Server Instance Profile Name
  app_server_instance_profile_name = module.security.app_server_instance_profile_name
}

// --- DATABASE ---
module "database" {
  source = "./database"

  db_identifier   = "my-app-db"
  db_engine       = "mysql"
  db_eng_version  = "8.0.41"
  db_inst_class   = "db.t3.micro"
  db_storage_size = 10
  secret_name     = "rds-credentials"

  // Networking IDs
  vpc_id              = module.networking.vpc_id
  availability_zones  = module.networking.availability_zones
  app_subnet_ids      = module.networking.app_subnet_ids
  database_subnet_ids = module.networking.database_subnet_ids

  // Compute IDs
  app_server_sg_id = module.compute.app_server_sg_id

  // KMS KEY
  kms_key_id = module.security.kms_key_id
}

// --- FRONTEND --- 
module "frontend" {
  source = "./frontend"
}

// --- STORAGE ---
module "storage" {
  source = "./storage"

  kms_key_arn = module.security.kms_key_arn
}

// --- SECURITY ---
module "security" {
  source = "./security"

  user_data_arn = module.storage.user_data_arn
}