terraform {
  backend "s3" {
    bucket = "an-my-terraform-state"
    key = "global/s3/terraform.tfstate"
    region = "af-south-1"
    use_lockfile = true
  }
}