s3

This configuration create s3 bucket with some required functionalities for the compliance.

1. main.tf: This configuratyion has following reource blocks:
s3 bucket resource block will create an s3 bucket.
Object lock is enabled on the bucket.
Force destroy is set to true. 
s3 bucket object ownership is with bucket owner.
bucket versioning is enabled.
server side encryption is enabled by default.

2. variables.tf: This configuration file has a bucket variabled declared in main configurayion file. Rest all has been covered in the code part.