Subnet

This configuration create the subnet within the vpc to create resources in. This is a stanadlone module where subnets(public, private & databse) can be spinned up in a 2 AZ setup.
More details on the configuration files are as follows:

1. main.tf: This configuration file has the resource blocks to create public, private and database subnet in each AZ. Availability zone, vpc id and subnet cidr are passed through variables.

2. variables.tf: This configuration file has all the variables declared in main.tf for which the default values can be passed depends upon the variable type.

3. output.tf: This configuration file has 3 output block which will output the subnet(public, private, database) ids when they are created.
