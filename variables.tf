variable "aws_region" {
  type        = string
  description = "Region AWS"
  default     = "eu-west-3"
}

variable "environment" {
  type        = string
  description = "Environnement de deploiement"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment doit etre dev, staging ou prod."
  }
}

variable "project_name" {
  type        = string
  description = "Prefixe noms de ressources"
  default     = "formation"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR du VPC"
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "vpc_cidr doit etre un CIDR valide (ex: 10.0.0.0/16)."
  }
}

variable "azs" {
  type        = list(string)
  description = "Liste des AZ"
  default     = ["eu-west-3a", "eu-west-3b"]

  validation {
    condition     = length(var.azs) >= 2
    error_message = "HA 2 AZ requises minimum"
  }
}

variable "bastion_allowed_cidr" {
  type        = string
  description = "CIDR autorise en SSH sur le bastion"
  default     = "0.0.0.0/0"
}
