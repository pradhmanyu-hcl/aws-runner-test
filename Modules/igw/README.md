Internet Gateway

This configguration will create an interner gateway to communicate a vpc to the internet.

1. main.tf: This configuration has a resource block to create an igw within a vpc. Here the vpc id is passed through variables. So the module can be independently called in a vpc where it is required.

2. variables.tf: This configuration file has the variables declared in main configuration file like vpc id and tags associated with the internet gateway.

3. output.tf: This configuration file has an output block to output the igw id once it is created.