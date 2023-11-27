KMS - Key management System

This configuration creates a customer managed key used for encryption.

1. main.tf: This configuration file has a resource block for creating kms key with a particular specification. Key usage, whether multi region, key rotation and deletion window all important properties are added through variables. Then we have a resource block for key alias for the above create kms key.

2. variables.tf: This configuration file has the variables declared in main.tf. Default values have been passed for testing. These can be changes as per the configuration requirements.

3. output.tf: This configuration file has 3 output blocks which will output the kms key id, arn and alias once the excution is successful.