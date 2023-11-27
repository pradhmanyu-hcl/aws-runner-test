Cloudwatch

This configuration creates the cloudwatch monitoring dashboard and alarms. Configuration file contents are described in detail:


1. main.tf - This terraform configuration file consists of resource blocks of cloudwatch dashboard with AWS/EC2 metric for CPUUtilzation, NetworkIn and NetworkOut. Cloudwatch metric alarm block for creating an alarm . There is a resource block for creation of log group. Eventbridge rule block for creating ec2 scaling events. Cloudwatch log resource policy attachment to the eventbridge to put the logs on tp the cloudwatch log group.

2. variables.tf - This terraform configuration consists of the values passed through parameters in main.tf file which includes dashboard name, region, metric for CW alarm, evaluations, comparison operators, threshold for the alarm, etc. Alarm actions and ok actions are also added which can be updated as per teh requirements.

3. output.tf: This configuration file has the resource block which will output the cloudmetric alarm name once it is created.