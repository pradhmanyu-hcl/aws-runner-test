terraform{
    backend "s3" {
        bucket = "tfstste-backend-tmo"
        key = "adx.tfstate"
        region = "us-west-2"
        profile = "default"
    }

}