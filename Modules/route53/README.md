Route 53

This configuration will create a route 53 service with a hosted zone and record entries.

1. main.tf: This configuration file has a resource block for route53 private hosted zone for which the domain name is passed through variables. Further vpc id is also passed so that it can connect to a particular vpc. Further we have a resource block for a record set for the above private hosted zone. Db endpoint for this record set is passed through variables along with record name and type.

2. variables.tf: This configuration file has all the variables declared in main.tf. Some of the default values are passed for testing purpose which can be changed as per the configuration requirements.
