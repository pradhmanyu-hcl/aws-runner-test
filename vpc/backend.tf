terraform{
    backend "s3" {
        bucket = "tfstate-102320235505"
        key = "vpc_npe.tfstate"
        region = "us-gov-west-1"
        profile = "default"
    }


}