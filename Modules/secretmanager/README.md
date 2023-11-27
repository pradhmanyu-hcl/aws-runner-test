Secret Manager

This configuration creates a secret manager service to manage secrets.

1. maintf: This configuration has a resource block which will create Secret manager resource in aws with unique name with default period. Secret manager version block will maintain the secret manager string version by default.

2. variables.tf: This configuration file has all the variables declared in main.tf for which the default values can be passed depends upon the configuration requirements.

3. output.tf: This configuration has an output block which will output the secret manager arn once created.