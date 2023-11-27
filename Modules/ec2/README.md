ec2

The configuraion create ec2 instance in a virtual private cloud. The configuration is craeted to spin up the ec2 instance in each availability zone.
Configuration details are as follows:

1. main.tf: This configuration file has the resource block to spin up ec2 in each AZ. Ami id, security group and instance type values are declared as variables. Code is created in a modular way that it can be called to spin up in a vpc. Root volume to be terminated after deletion or not- has also been passed through the variables.Lastly, user data is added which will helpto install ssm agent in the instance at the time of creation.

2. variables.tf: This configuration file has the variables passed in the main configuration file. Default values has not been setup. This can be done as per the decalared type at the time of deployment.

3. output.tf: This configuration file has an output block which will output the ec2 instance ids once created.