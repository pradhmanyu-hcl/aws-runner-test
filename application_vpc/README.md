Application VPC

This deployment will create multiple resources which are a part of VPC. For example- vpc, subnets, internet gateway, ec2, alb, route tables & their associations.
The above mentioned components are created as separate modules which are then called in a single configuration to associate them as per the requirements. These modules are stanalone modules and are reusable.

Below are the configuration files which have their own functionalities:
1. main.tf: This is the main configuration file wherein the modules are called in the order of their creation. Depends on flag has been used wherever required. 
Firstly, the vpc module is called with its source path which will spin up a vpc, associated the secondary cidr range to it, iam role & policy for creating flow logs which are then being sent to cloudwatch log group.
Following the vpc, subnet module is called which creates 6 subnets- (2 Public, 2 Private, 2 Database).
Module igw is further called to create the internet gatway and associate to the above created vpc.
Module nat is called to spin up the eip with the nat gateway which is being used to create the further routes for private subnets.
Module sg is called to create the security group with a particular port allowed. In this case, we have allowed port 22 which can be modified too. this security group will be attached to the above created vpc in the module block.
Module ec2 is called to spin up ec2 instances in the private subnets in each AZ. user data is also added to the resource block in the individual ec2 configuration which can be modified as per the requirements.
Module alb is called to create application load balancer in the above created public subnets in the vpc.
Next route table module is called where in 3 route tables are created which are then attached to the respective subnets created already. Routes to get to the internet are also added into these route tables.
Public route table has the route to connect to internet through igw and private and database route table has the route to connect to internet through natgw created in one of the public subnets.

2. provider.tf: This configuration file has aws provider block with the required version and then the cinfiguration of that provider along with the region passed in the variables.

3. backend.tf: This configuration acts as a remote state where in the terraform state file are being stored in an s3 bucket mentioned in the particular region.

4. variables.tf: This variable file has all the variables declared in main configuration file. Variable types have been specified in this file too. No default values are passed here.

5. terraform.tfvars: The default values of the variables declared in variables.tf have been entered here based on the variable type. Any changes in the configuration can be made by changing the default values here.

Configuration modules used in this configuration are:
Modules/vpc
Modules/subnet
Modules/igw
Modules/nat
Modules/sg
Modules/ec2
Modules/alb
Modules/route_table