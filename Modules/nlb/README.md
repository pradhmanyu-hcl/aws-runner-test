NLB- Network Load balancer

This terraform configuration creates a network load balancer with its components.The configuration has the following files with the mentioned resources:

1. main.tf: This configuration file has the resource block of network load balancer, its listener to be configured on a specific port. Then we have the target group block attached to particular vpc on a specif port. Port, vpc, tg name etc all values are passed through varaibles.

2. varaibles.tf: This configuration has the variables passed in main configuration file. The default values can be changes as per the configuration requirements.
