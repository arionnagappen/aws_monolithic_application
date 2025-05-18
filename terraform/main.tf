module "networking" {
  source = "./networking"
}
module "compute" {
  source = "./compute"

  vpc_id = module.networking.vpc_id
  availability_zones = module.networking.availability_zones
  public_subnet_ids = module.networking.public_subnet_ids
  app_subnet_ids = module.networking.app_subnet_ids
  database_subnet_ids = module.networking.database_subnet_ids

}