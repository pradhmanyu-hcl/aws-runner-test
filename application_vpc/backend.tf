terraform{
    backend "s3" {
        bucket = "testbucket11152023"
        key = "vpc.tfstate"
        region = "us-west-2"
        profile = "default"
    }

}