terraform{
    backend "s3" {
        bucket = "sample-bucket-10232023"
        key = "sso.tfstate"
        region = "us-west-2"
        profile = "default"
    }

}