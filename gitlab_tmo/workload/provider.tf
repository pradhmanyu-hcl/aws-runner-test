<<<<<<< HEAD
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}
#Configure the Provider
provider "aws" {
  region = var.region
}


=======
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}
#Configure the Provider
provider "aws" {
  region = var.region
}


>>>>>>> 374f69e284680e4c00db5732080818999ea80ab9
