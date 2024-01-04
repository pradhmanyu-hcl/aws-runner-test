terraform{
    backend "s3" {
        bucket = "testbucket11152023"
        key = "gitlab.tfstate"
        region = "us-gov-west-1"
        profile = "default"
    }

}
