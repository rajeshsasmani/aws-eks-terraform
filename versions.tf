
terraform {
  required_version = ">= 1.5.7"

  cloud {
    organization = "aws-infra-creation"

    workspaces {
      name = "aws-eks-terraform"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.9"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.3"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.69"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.9"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.3"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.4"
    }
  }
}