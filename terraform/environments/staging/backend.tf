terraform {
  backend "s3" {
    bucket = "an-my-terraform-state-staging"
    key = "global/s3/terraform-staging.tfstate"
    region = "af-south-1"
    use_lockfile = true
  }
}