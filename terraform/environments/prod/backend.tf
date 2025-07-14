terraform {
  backend "s3" {
    bucket = "an-my-terraform-state-prod"
    key = "global/s3/terraform-prod.tfstate"
    region = "af-south-1"
    use_lockfile = true
  }
}