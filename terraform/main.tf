// --- NETWORKING ---
module "networking" {
  source = "./networking"

  vpc_cidr = "10.0.0.0/16"
  availability_zones = [ "af-south-1a", "af-south-1b" ]
  public_subnet_cidrs = [ "10.0.1.0/24", "10.0.2.0/24" ]
  app_subnet_cidrs = [ "10.0.3.0/24", "10.0.4.0/24" ]
  database_subnet_cidrs = [ "10.0.5.0/24", "10.0.6.0/24" ]
}

// --- COMPUTE ---
module "compute" {
  source = "./compute"

  inst_ami = "ami-0914bddde8faa93a0"
  inst_type = "t3.micro"

  // Networking IDs
  vpc_id = module.networking.vpc_id
  availability_zones = module.networking.availability_zones
  public_subnet_ids = module.networking.public_subnet_ids
  app_subnet_ids = module.networking.app_subnet_ids
  database_subnet_ids = module.networking.database_subnet_ids
}

// --- DATABASE ---
module "database" {
  source = "./database"

  db_identifier = "my-app-db"
  db_engine = "mysql"
  db_eng_version = "8.0.41"
  db_inst_class = "db.t3.micro"
  db_storage_size = 10
  secret_name = "rds-credentials"

  // Networking IDs
  vpc_id = module.networking.vpc_id
  availability_zones = module.networking.availability_zones
  app_subnet_ids = module.networking.app_subnet_ids
  database_subnet_ids = module.networking.database_subnet_ids

  // Compute IDs
  app_server_sg_id = module.compute.app_server_sg_id
}

// --- FRONTEND --- 
module "frontend" {
  source = "./frontend"

  
}