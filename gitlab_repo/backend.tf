terraform{
    backend "s3" {
        bucket = "tfstste-gitlab-tmo"
        key = "gitlab.tfstate"
        region = "us-gov-west-1"
        profile = "default"
    }

}
