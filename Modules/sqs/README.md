SQS - Simple queue service

This configuration create sqs queue which can be used to process messages for an application

1. main.tf: This configuraion file has resource block to create sqs queue. The dependencies like visibility timeout, message retention, max size, delay etc all important values are passed through variables to make it modular.

2. variables.tf: This configuration file has the variables passed in main cnfiguraion file. Default values are added for testing purpose which can be modified as per the configuration requirement and the variable type.

