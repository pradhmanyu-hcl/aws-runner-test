VPC - Virtual Private Cloud

This configuration creates a virtual private cloud to work in. This is a stanadlone module where only vpc will spin up with multiple cidr ranges.

1. data.tf: This configuration has a data block for assume role for vpc flow logs. Secondly we have a data block with default policy to create log groups.

2. main.tf: This configuration file has resource block to create a vpc with a particular cidr range. Then we have a secondary cidr association to the above vpc. There is a resource block to create iam role for vpc flow logs. A cloudwatch log group block which will act as the destination for flow logs. Then we have a resource block to create vpc flow logs where the above iam role and log group arn is clubbed. Finally, we have a resource block where the iam role is getting attached to the policy which has permissions to create logs.

3. variables.tf: This configuration file has all the variables declared in main.tf for which the default values can be passed depends upon the variable type.

4. output.tf: This configuration file has 2 output block which will output the vpc id and secondary cidr association id once this module is exceuted successfully.