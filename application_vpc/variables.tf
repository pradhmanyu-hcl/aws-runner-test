variable "region" {
  description = "Region name in which the vpc need to be created"
  type = string
}

#vpc
variable "vpc_cidr" {
  description = "cidr block for vpc"
  type = string
}
variable "vpc_sec_cidr" {
  description = "secondary cidr range for public subnets"
  type = string
}
variable "tags" {
  description = "tag associated to vpc"
  type = string
}
variable "role_name" {
  description = "Name of iam role created for vpc flow logs"
  type = string
}
variable "loggroup_name" {
  description = "Name of cloudwatch log group where the flow logs will be stored"
  type = string
}
variable "retention_days" {
  description = "Retention period of cloudwatch log group in days"
  type = number
}
variable "flow_logs_tags" {
  description = "tag associated to vpc flow log"
  type = string
}
variable "iam_policy" {
  description = "Name of iam policy assigned to the iam role for vpc flow logs"
  type = string
}

#subnet
variable "availability_zone" {
  description = "Azs used to create subnets"
  type = list(string)
}
variable "pusnet_cidr" {
  description = "cidr range of public subnets"
  type = list(string)
}
variable "pusnet_tags" {
  description = "tags associated with public subnet"
  type = list(string)
}
variable "prsnet_cidr" {
  description = "cidr of private subnet"
  type = list(string)
}
variable "prsnet_tags" {
  description = "tags associated with Private subnets"
  type = list(string)
}
variable "dbsnet_cidr" {
  description = "cidr of the db subnet"
  type = list(string)
}
variable "dbsnet_tags" {
  description = "tags associated with database subnets"
  type = list(string)
}

#igw
variable "igw_tags" {
  description = "tag associated to igw"
  type = string
}

#nat
variable "eip_tags" {
  description = "tag associated to eip"
  type = string
}
variable "nat_tags" {
  description = "tag associated with nat gw"
  type = string
}

#sg
variable "sg_name" {
  description = "Name given to security group"
  type = string
}
variable "ingress_from_port" {
  description = "starting port number for inbound traffic"
  type = string
}
variable "ingress_to_port" {
  description = "ending port number for inbound traffic"
  type = string
}
variable "ingress_protocol" {
  description = "Protocol on which allowed ports work for inbound traffic"
  type = string
}
variable "egress_from_port" {
  description = "starting port number for outbound traffic"
  type = string
}
variable "egress_to_port" {
  description = "ending port number for outbound traffic"
  type = string
}
variable "egress_protocol" {
  description = "Protocol on which ports work for outbound traffic"
  type = string
}
variable "sg_tags" {
  description = "tags associated with sg"
  type = string
}

#ec2
variable "ami" {
  description = "Image id used to launch ec2"
  type = string
}
variable "instance_type" {
  description = "instance type to be used"
  type = string
}
variable "delete_on_termination" {
  description = "Whether to delete the root volume on deletion"
  type = bool
}
variable "ec2_tags" {
  description = "tags associated to ec2 instances"
  type = list(string)
}


#alb
variable "alb_name" {
  description = "Name of Application load balancer"
  type = string
}
variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection"
  type = bool
}
variable "alb_tags" {
  description = "tags associated to alb"
  type = string
}
variable "port" {
  description = "port number allowed on alb"
  type = string
}
variable "protocol" {
  description = "protocol for the allowed port"
  type = string
}
variable "alb_tg_name" {
  description = "target group name for alb"
  type = string
}
variable "healthy_threshold" {
  description = "Healthy threshold value for healthcheck"
  type = number
}
variable "unhealthy_threshold" {
  description = "UnHealthy threshold value for healthcheck"
  type = number
}
variable "timeout" {
  description = "timeout for healthcheck"
  type = number
}
variable "resource_count" {
  description = "count for targets to be attached"
  type = number
}


#route table
variable "purt_tags" {
  description = "tags associated to Public route table"
  type = string
}
variable "prrt_tags" {
  description = "tags associated to Private route table"
  type = string
}
variable "dbrt_tags" {
  description = "tags associated to database route table"
  type = string
}


