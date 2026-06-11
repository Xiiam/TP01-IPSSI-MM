module "vpc" {
  source = "../../modules/vpc"

  environment          = "staging"
  project_name         = "maxime-formation"
  vpc_cidr             = "10.20.0.0/16" # dev : plage 10.10.x
  azs                  = ["eu-west-3a", "eu-west-3b"]
  bastion_allowed_cidr = "0.0.0.0/0"
}
