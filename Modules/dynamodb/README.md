Dynamodb

This configuration creates a dynamodb on aws environment. Configuration resources are mentioned as below:

1. main.tf: This configuration file has a resource block to create a dynamodb with a particular name and billing mode. read and write capacity has been specified. Attributes for hashkey and sortkey are added along with ttl attribute.
Along with that global secondary index with non key attributes are also added.

2. variables.tf: This configuration file has all the variables declared in the main terraform configuration file. Default values has also been set which can be changed as per the configuration requirements.

3. output.tf: This configuration file has the resource block which will output the dynamodb id once it is created.