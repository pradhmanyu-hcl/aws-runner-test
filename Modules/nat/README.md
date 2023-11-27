NAT Gateway

Thsi configuration is a standalone module to spin up nat gateway which can be called in a vpc to complete the application configuration.

1. main.tf: This configurayion file has a resource block for elastic ip which is required for the creation of nat gateway within the domain vpc. Tags associated are passed through varaibles. further we have a resource block for nat gw which will get the allocation id from the above eip block and a subnet in which nat gw is created, subnet id has to be passed through the variables.

2. variables.tf: his configuration file has the variables declared in main configuration file like subnet and tags. The default values can be passed as per the deployment requirements.

3. output.tf: This configuration has an output block which will output the nat gw id once it is created within a subnet in vpc.