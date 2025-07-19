terraform {
  backend "s3" {
    bucket       = "an-my-terraform-state-dev"
    key          = "global/s3/terraform-dev.tfstate"
    region       = "af-south-1"
    use_lockfile = true
  }
}