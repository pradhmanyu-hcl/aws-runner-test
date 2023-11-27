Security Group

This configuration creates a security group to be attached to a particular reource to restrict the inbound and outbound access over the internet. This is a standalone module which can be called within a vpc to add security to a resource.

1. main.tf: This configuration file has a resource block for spinning up a security group attached to a vpc whose values is passed through varaibles. Further ingress amd egress rules are added on particular ports and protocol passed as variables. cidr block range for destination is passed as variables which can be modified from vpc to vpc.

2. variabbles.tf: This configurayion file has the variables declared in main configuration file. These values can be changed as per the configuration requirements.

3. output.tf: This configuration has an output block which will output the security group id once it is created.