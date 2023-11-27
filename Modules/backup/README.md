AWS backup

This configuration creates the backup related configuration required to take backup of a particular aws resource.Below is the detail about the resources being created in this configuration:

1. main.tf: This configuration file has resource block for backup vault(required destination for the backup) and backup plan (the configuration describe the frequency, window, lifecycle and other important components for the plan).

2. variables.tf: This configuration file has all the variables declared in main configuration file. Default values has been set which can be changes as per the requirements.

3. output.tf: This configuration file has the output blocks which will output the backup vault and backup plan ids once created.
