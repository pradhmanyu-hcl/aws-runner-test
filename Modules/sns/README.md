SNS - Simple notification service

this configuratyion create an sns topic and its components on aws platform.

1. main.tf: This configuration file has ressource block to create an sns topic. Then we have a default policy block which is associated to the sns topic. This policy is customizable. Lastly we have a sns topic subscription block which has the protocol on which it will work and the endpoint where to deliver the notification.

2. variables.tf: This configuration has the variables declared in main.tf file. The values are changable and can be modified as per the configuration requirements.

3. output.tf: This configuration has an output block which will outpt the arn of sns topic once it is created.