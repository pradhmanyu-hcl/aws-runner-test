ECS

This configuration creates and ecs cluster and uts task definitions. Please refer to the below details for reference:

1. main.tf: This configuration file has the resource block for creating ecs cluster with a particular name. Further an ecs task definition is there of a particualr family and network mode. cpu amd memory are defined as variables. IAM role with assume ecs-tasks policy is attached to this task definition. Finally an ecs service blovk is there where cluster and task defintaions are attached to a particular subnet and security group to launch it in a vpc.

2. variables.tf: This configuration file has the variables declared in main configuration file. Default values has been set up for testing purpose. These values can be changes as per the deployment requirements.

3. output.tf: This configuration file has 2 output blocks which will output the ecs cluster name and ecs task definiation family once created.