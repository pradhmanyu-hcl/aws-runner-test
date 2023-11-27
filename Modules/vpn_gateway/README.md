VPN Gateway

This configuration creates vpn gateway attached to vpc

1. main.tf: First we have a resource block to create a vpn gateway. vpc is passed through variables. Secondly, we have a resource block for vpn gateway attachment where the above created vpn gateway is used to club with the vpc id. lastly we have customer gateway resource block with specific asn, ip address and type for which values have been passed through variables.

2. variables.tf: This configuration has the variables declared in main.tf file. The values are changable and can be modified as per the configuration requirements and variable type.