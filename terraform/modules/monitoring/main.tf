module "vpc_flow_logs" {
  source = "./flow_logs"
  vpc_id = var.vpc_id
}