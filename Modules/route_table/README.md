Route tables

This configuration creates the route tables and its associations. This is a stanalone module which can be called within a vpc to create public, private and database route tables along with their associations within a 2 AZ setup.

1. main.tf: This configuration file has resource block for route tables associated to a vpc(vpc values passed through variables). Then we have routes to go to intenet for each route table. Public route table has igw to go to internet and private and database route table has nat gw to go to internet. Then we have their association blocks where each subnet will get associated to its respective route table.

2. variables.tf: This configuration file has all the variables declared in main.tf for which the default values can be passed depends upon the variable type.

3. output.tf: This configuration file has the output block to output the public, private and database route table ids once they are created.