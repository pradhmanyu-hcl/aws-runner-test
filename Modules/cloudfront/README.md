CloudFront

This confifuration craetes a cloudfront distribustion for an s3. 
below are the configuration files which the required resources to be spinned up:

1. main.tf - This terraform configuration file includes the resource blocks for s3 bucket with object lock and versioning enabled. Second block is for the cloudfront distribution for the s3 bucket domain which has some cache behoviour methods involved. Target origin is set to s3 bucket. Default cloudfront certificate is enabled.

2. variables.tf - This terraform configuration has the values for the parameters passed in main.tf file which includes region, bucket name, bool values whether to retain the ditribution when not in use, price class, min & max ttl. These values are changable as per the configuration requirements.
