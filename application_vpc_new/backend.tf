terraform{
    backend "s3" {
        bucket = "testbucket11152023"
        key = "appvpc.tfstate"
        region = "us-west-2"
        profile = "default"
    }

}