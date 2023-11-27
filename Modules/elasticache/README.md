Elasticache

This configuration create an elasticache replication group in a subnet group.For now, it has been tested with redis cluster.
The configuration resources are described as below:

1. main.tf: This configuration has a subnet grouo resource to which subnet values are passed through variables. Further within this subnet group an elasticache replication group is added which has a specific name and description passed through the variables. Dependencies like engine, port, parameter group details, number of cache details are passed through the variables.

2. variables.tf: This configuration file has the variables declared in main configuration file. Default values has been set up for testing purpose. These values can be changes as per the deployment requirements.

3. output.tf: This configuration file has an output block which will output the elasticcache replication group id once it is created.
