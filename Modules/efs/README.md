EFS

This configuration creates and elastic file system which can be mounted as per the requirements.

1. main.tf: This configuartion file has a resource block to create efs file system. Efs name, performance type, throughput mode all the parameters are passed through the variables. Server side encryption code is also added that has to be passed in boolean through variables.

2. variables.tf: This configuration file has the variables declared in main configuration file. Default values has been set up for testing purpose. These values can be changes as per the deployment requirements.

3. output.tf: This configuration file has a output block which will output the efs id once it is created.