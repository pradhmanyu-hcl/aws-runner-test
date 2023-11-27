Autoscaling

This configuration creates a autoscaling group and the other dependednt components. Each file has the configuration described as below:

1. main.tf: This configuration has the resource block for autoscaling alaunch configuration which has some required parameters for the spinup of resources through autoscaling. Then we have autoscaling group block with its min and max size along with the healthecheck configurations.

2. variables.tf: his configuration file has all the variables declared that are being used in the main terraform file. The values can be set as per the required type.

3. output.tf: This file has an output block which will output the autoscaling group id once it is created.