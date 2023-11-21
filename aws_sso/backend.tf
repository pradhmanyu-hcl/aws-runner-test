terraform{
    backend "s3" {
        bucket = "tfstste-backend-tmo"
        key = "sso.tfstate"
        region = "us-west-2"
        profile = "default"
    }

}