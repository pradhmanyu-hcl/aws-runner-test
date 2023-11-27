ALB- Application Load balancer

This terraform configuration creates an application load balancer with its components.The configuration has the following files with the mentioned resources:

1. main.tf: This configuration file has the resource block of application load balancer, its listener to be configured on a specific port. Then we have the target group block which includes healthcheck threshold values passed through the variables. Further, we have a target group attachment block for adding the available targets to the target group.

2. variables.tf: This configuration file has all the variables declared that are being used in the main terraform file. The values can be set as per the required type.

3. output.tf: This file has an output block which will output the load balancer id once it is created.