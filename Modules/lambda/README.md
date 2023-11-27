Aws Lambda

This configuration creates a lambda function and its dependencies like execution role and policy assigned to thr role. For details on the configuratin files, please refer below:

1. main.tf: This configuration file has a data block which will output the runtime file to zip file. This zip file will further be used in the execution of the lambda. The runtime we have taken here is python. Then we have a resource block to create an iam role which is assuming the lambda role.We have a policy attached to this iam role which has the permission to craete log groups, describe ec2 instances etc. This policy can be custmized. Further we have a resurce block to create lambda function with a particular runtime and handler and the above role is attached to it. Additionally vpc configuration is added to this block to create the lambda within a vpc. So the subnet ids and security group details have been passed through the variables. There is a resource block to create s3 endpoint in case the lambda is in private zone.

2. variables.tf: This configuration file has the variables declared in main configuration file. These varaibles can have specific values as per the configuration requirement.

3. There is a folder name python which has hello-python.py with lambda code in runtime python.
