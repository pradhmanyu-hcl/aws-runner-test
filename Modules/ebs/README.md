EBS

This is the configuration for spinning uo the ebs volume as and when required.
Configuration file details are as below:

1. main.tf: This configuration file has a resource block for ebs volume of a particular size and a type that can be spinned up in a particular availability zone.

2. variables.tf: This configuration file has the variables declared in the main configuration file. Default values ahs been set for testing which can be changes as per the configurayion requirements.

3. output.tf: This configuration file has the resource block which will output the ebs volume id once it is created.