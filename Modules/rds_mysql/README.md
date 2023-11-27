RDS - Relational Database Service

Thsi configuration craete a rds db instance with its components. We have tested this configurayion to create db instance with mysql db. The configuration details are as follows:

1. main.tf: This configuration file has the resource block to create a subnet group where the subnet values are passed through varaibles. Further we have a resource block to create a parameter group for which the family is defined in varaibles(mysql). Then we have a resource block which uses the above to blocks to create an rds db instance. Other dependent values like engine, security group, instance class,storage type, whether multi or not- all the values are passed though variables along with the tags.

2. variables.tf: This configuration file has all the variables declared in main.tf for which the default values can be passed depends upon the configuration requirements.

3. output.tf: This configuration file has an output blovk to output the rds db insatnce id once it is created.