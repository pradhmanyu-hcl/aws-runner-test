variable "region" {
  description = "Region name in which the vpc need to be created"
  type = string
}

# #vpc
# variable "vpc_cidr" {
#   description = "cidr block for vpc"
#   type = string
# }
# variable "vpc_sec_cidr" {
#   description = "secondary cidr block range for vpc"
#   type = string
# }
# variable "vpc_tags" {
#   description = "tag associated to vpc"
#   type = string
# }
# variable "role_name" {
#   description = "Name of iam role created for vpc flow logs"
#   type = string
# }
# variable "loggroup_name" {
#   description = "Name of cloudwatch log group where the flow logs will be stored"
#   type = string
# }
# variable "retention_days" {
#   description = "Retention period of cloudwatch log group in days"
#   type = number
# }
# variable "flow_logs_tags" {
#   description = "tag associated to vpc flow log"
#   type = string
# }
# variable "iam_policy" {
#   description = "Name of iam policy assigned to the iam role for vpc flow logs"
#   type = string
# }

#subnet
variable "vpc_id" {
  description = "vpc id in which resources will be created"
  type = string
}
variable "vpc_cidr" {
  description = "cidr block for vpc"
  type = string
}
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

#natgw
variable "eip_tags" {
  description = "tag associated to eip"
  type = list(string)
}

variable "nat_tags" {
  description = "tag associated with nat gw"
  type = list(string)
}

#ec2 rails
variable "sgec2_name" {
  description = "ec2 security group name"
  type = string
}
variable "sgec2_ingress_from_port" {
  description = "starting port number for inbound traffic"
  type = string
}
variable "sgec2_ingress_to_port" {
  description = "ending port number for inbound traffic"
  type = string
}
variable "sgec2_ingress_protocol" {
  description = "Protocol on which allowed ports work for inbound traffic"
  type = string
}
variable "sgec2_egress_from_port" {
  description = "starting port number for outbound traffic"
  type = string
}
variable "sgec2_egress_to_port" {
  description = "ending port number for outbound traffic"
  type = string
}
variable "sgec2_egress_protocol" {
  description = "Protocol on which ports work for outbound traffic"
  type = string
}
variable "sgec2_tags" {
  description = "tags associated with sg"
  type = string
}
variable "ssmrole_name" {
  description = "iam role name for ec2 to access system manager"
  type = string
}
variable "instance_profile" {
  description = "Name of instance profile"
  type = string
}
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
#variable "launch_conf_name_rails" {
#  description = "Name of launch configuration for rails servers"
#  type = string
#}
#variable "autoscaling_group_name_rails" {
#  description = "Name of autoscaling group for rails servers"
#  type = string
#}
#variable "min_size_rails" {
#  description = "Minimum size of asg"
#  type = number
#}
#variable "max_size_rails" {
#  description = "Maximum size of asg"
#  type = number
#}
#variable "health_check_grace_period_rails" {
#  description = "The healthcheck grace period in seconds"
#  type = number
#}
#variable "force_delete_rails" {
#  description = "Whether to force delete the asg"
#  type = bool
#}
#variable "health_check_type_rails" {
#  description = "the healthcheck type for autoscaling group"
#  type = string
#}
variable "rails_ebs_volume_size" {
    description = "ebs volume for praefect servers"
  type        = number
}


#ec2 praefect
variable "sgec2_praefect_name" {
  description = "ec2 praefect security group name"
  type        = string
}
variable "sgec2_praefect_ingress_from_port" {
  description = "starting port number for inbound traffic for praefect servers"
  type        = string
}
variable "sgec2_praefect_ingress_to_port" {
  description = "ending port number for inbound traffic for praefect servers"
  type        = string
}
variable "sgec2_praefect_ingress_protocol" {
  description = "Protocol on which allowed ports work for inbound traffic for praefect servers"
  type        = string
}
variable "sgec2_praefect_egress_from_port" {
  description = "starting port number for outbound traffic for praefect servers"
  type        = string
}
variable "sgec2_praefect_egress_to_port" {
  description = "ending port number for outbound traffic for praefect servers"
  type        = string
}
variable "sgec2_praefect_egress_protocol" {
  description = "Protocol on which ports work for outbound traffic for praefect servers"
  type        = string
}
variable "sgec2_praefect_tags" {
  description = "tags associated with praefect sg"
  type        = string
}
variable "ssmpraefectrole_name" {
  description = "iam role name for ec2 praefect to access through system manager"
  type        = string
}
variable "instance_profile_praefect" {
  description = "instance profile name for ec2 praefect"
}
variable "praefect_ami" {
  description = "Image id used to launch ec2 praefect"
  type        = string
}
variable "praefect_instance_type" {
  description = "instance type to be used for ec2 praefect"
  type        = string
}
variable "praefect_delete_on_termination" {
  description = "Whether to delete ec2 praefect root ebs on termination"
  type        = bool
}
variable "ec2praefect_tags" {
  description = "tags associated to ec2 praefect"
  type        = list(string)
}
/*
variable "launch_conf_name_praefect" {
  description = "Name of launch configuration for rails servers"
  type        = string
}
variable "autoscaling_group_name_praefect" {
  description = "Name of autoscaling group for rails servers"
  type        = string
}
variable "min_size_praefect" {
  description = "Minimum size of asg"
  type        = number
}
variable "max_size_praefect" {
  description = "Maximum size of asg"
  type        = number
}
variable "health_check_grace_period_praefect" {
  description = "The healthcheck grace period in seconds"
  type        = number
}
variable "force_delete_praefect" {
  description = "Whether to force delete the asg"
  type        = bool
}
variable "health_check_type_praefect" {
  description = "the healthcheck type for autoscaling group"
  type        = string
}*/
variable "praefect_ebs_volume_size" {
  description = "ebs volume for praefect servers"
  type        = number
}



#ec2 gitlay
variable "sgec2_gitlay_name" {
  description = "ec2 gitlay security group name"
  type        = string
}
variable "sgec2_gitlay_ingress_from_port" {
  description = "starting port number for inbound traffic for gitlay servers"
  type        = string
}
variable "sgec2_gitlay_ingress_to_port" {
  description = "ending port number for inbound traffic for gitlay servers"
  type        = string
}
variable "sgec2_gitlay_ingress_protocol" {
  description = "Protocol on which allowed ports work for inbound traffic for gitlay servers"
  type        = string
}
variable "sgec2_gitlay_egress_from_port" {
  description = "starting port number for outbound traffic for gitlay servers"
  type        = string
}
variable "sgec2_gitlay_egress_to_port" {
  description = "ending port number for outbound traffic for gitlay servers"
  type        = string
}
variable "sgec2_gitlay_egress_protocol" {
  description = "Protocol on which ports work for outbound traffic for gitlay servers"
  type        = string
}
variable "sgec2_gitlay_tags" {
  description = "tags associated with gitlay sg"
  type        = string
}
variable "ssmgitlayrole_name" {
  description = "iam role name for ec2 gitlay servers to access through system manager"
  type        = string
}
variable "instance_profile_gitlay" {
  description = "instance profile name for ec2 gitlay"
  type        = string
}
variable "gitlay_ami" {
  description = "Image id used to launch ec2 gitlay"
  type        = string
}
variable "gitlay_instance_type" {
  description = "instance type to be used for ec2 gitlay"
  type        = string
}
variable "gitlay_delete_on_termination" {
  description = "Whether to delete root ebs on termination of ec2 gitlay"
  type        = bool
}
variable "ec2gitlay_tags" {
  description = "tags associated with gitlay servers"
  type        = list(string)
}
variable "gitlay_ebs_volume_size" {
  description = "ebs volume for gitlay servers"
  type        = number
}


#alb rails
variable "sgalb_name" {
  description = "Name of alb security group"
  type        = string
}
variable "sgalb_tags" {
  description = "tag associated with alb security group"
  type        = string
}
variable "sgalb_type" {
  description = "type of traffic to allow on security group rule 1"
  type        = string
}
variable "sgalb_from_port" {
  description = "starting port to allow on the above traffic type"
  type        = string
}
variable "sgalb_to_port" {
  description = "ending port to allow on the above traffic type"
  type        = string
}
variable "sgalb_protocol" {
  description = "protocol on which the port numbers are allowed"
  type        = string
}
variable "alb_name" {
  description = "Name of Application load balancer"
  type        = string
}
variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection"
  type        = bool
}
variable "alb_tags" {
  description = "tags associated to alb"
  type        = string
}
variable "listener_port" {
  description = "port number allowed on alb"
  type        = string
}
variable "listener_protocol" {
  description = "protocol for the allowed port"
  type        = string
}
variable "alb_tg_name" {
  description = "target group name for alb"
  type        = string
}
variable "tg_port" {
  description = "port number for target group"
  type        = string
}
variable "tg_protocol" {
  description = "protocol for above target group port"
  type        = string
}
variable "healthy_threshold" {
  description = "Healthy threshold value for healthcheck"
  type        = number
}
variable "unhealthy_threshold" {
  description = "UnHealthy threshold value for healthcheck"
  type        = number
}
variable "timeout" {
  description = "timeout for healthcheck"
  type        = number
}

#alb praefect
variable "sgnlb_praefect_name" {
  description = "security group name for praefect alb"
  type        = string
}
variable "sgnlb_praefect_tags" {
  description = "tags associated with praefect alb security group"
  type        = string
}
variable "sgnlb_praefect_type" {
  description = "Type of traffic allowed on praefect alb security group"
  type        = string
}
variable "sgnlb_praefect_from_port" {
  description = "starting port number to allow on the above traffic type"
  type        = string
}
variable "sgnlb_praefect_to_port" {
  description = "ending port number to allow on the above traffic type"
  type        = string
}
variable "sgnlb_praefect_protocol" {
  description = "protocol on which the port numbers are allowed"
  type        = string
}
variable "nlb_praefect_name" {
  description = "Name of Praefect application load balancer"
  type        = string
}
variable "praefect_enable_deletion_protection" {
  description = "Whether to enable the deletion protection in praefect alb"
  type        = bool
}
variable "nlb_praefect_tags" {
  description = "tags associated with praefect alb"
  type        = string
}
variable "listener_praefect_port" {
  description = "listener port for praefect alb"
  type        = string
}
variable "listener_praefect_protocol" {
  description = "listener protocol for prafect alb"
  type        = string
}

variable "nlb_tg_prafect_name" {
  description = "target group name for praefect alb"
  type        = string
}
variable "tg_praefect_port" {
  description = "target group port number for praefect alb"
  type        = string
}
variable "tg_praefect_protocol" {
  description = "target group protocol for praefect alb"
  type        = string
}
variable "praefect_healthy_threshold" {
  description = "healthy threshold value for praefect healthcheck"
  type        = number
}
variable "praefect_unhealthy_threshold" {
  description = "Unhealthy threshols value for praefect healthcheck"
  type        = number
}
variable "praefect_timeout" {
  description = "timeut period for praefect healthcheck"
  type        = number
}


#rds gitlab
variable "sgrds_name" {
  description = "Name of rds security group"
  type = string
}
variable "sgrds_tags" {
  description = "Tag associated with rds security group"
  type = string
}
variable "sgrds_type" {
  description = "Type of traffic to be allowed on the rds security group rule 1"
  type = string
}
variable "sgrds_from_port" {
  description = "Starting port number to allow on above traffice type"
  type = string
}
variable "sgrds_to_port" {
  description = "Ending port number to allow on above traffic type"
  type = string
}
variable "sgrds_protocol" {
  description = "protocol on which the port numbers are allowed"
  type = string
}
variable "subnet_group_name" {
  description = "The name of database subnet group"
  type = string
}
variable "subnet_group_desc" {
  description = "description of the db subnet group"
  type = string
}
variable "parameter_group_name" {
  description = "Name of the parameter group"
  type = string
}
variable "parameter_group_desc" {
  description = "Description for paramter group"
  type = string
}
variable "family" {
  description = "pg family"
  type = string
}

variable "rds_role" {
  description = "name of iam role created for rds monitoring"
  type = string
}
variable "identifier" {
  description = "database identifier"
  type = string
}
variable "allocated_storage" {
  description = "storage allocated to db instance"
  type = number
}
variable "db_name" {
  description = "Name of the database"
  type = string
}
variable "db_instance_class" {
  description = "instance class for database"
  type = string
}
variable "engine" {
  description = "engine used in database"
  type = string
}
variable "engine_version" {
  description = "verion of db engine"
  type = string
}
variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot"
  type = bool
}
variable "storage_type" {
  description = "type of storage used for db instance"
  type = string
}
variable "storage_encrypted" {
  description = "Whether the dtorage is encrypted"
  type = bool
}
variable "multi_az" {
  description = "Whether tthe db instance is multi az"
  type = bool
}
variable "username" {
  description = "username for database"
  type = string
}
variable "password" {
  description = "the password for database"
  type = string
}
variable "db_retention_days" {
  description = "retention of db backup in days"
  type = number
}
variable "backup_window" {
  description = "backup window"
  type = string
}
variable "maintenance_window" {
  description = "backup maintenance window"
  type = string
}
variable "db_log_retention" {
  description = "retention period of cloudwatch log group"
  type = number
}
variable "performance_insights_enabled" {
  description = "Whether to enable performance insights"
  type = bool
}
variable "monitoring_interval" {
  description = "rds monitoring interval in seconds"
  type = number
}
variable "rds_tags" {
  description = "tags associated to rds instance"
  type = string
}


#rds praefect
variable "sgrds_praefect_name" {
  description = "Name of rds praefect security group"
  type = string
}
variable "sgrds_praefect_tags" {
  description = "Tag associated with rds praefect security group"
  type = string
}
variable "sgrds_praefect_type" {
  description = "Type of traffic to be allowed on the rds praefect security group rule 1"
  type = string
}
variable "sgrds_praefect_from_port" {
  description = "Starting port number to allow on above traffice type for rds praefect"
  type = string
}
variable "sgrds_praefect_to_port" {
  description = "Ending port number to allow on above traffic type for praefect"
  type = string
}
variable "sgrds_praefect_protocol" {
  description = "protocol on which the port numbers are allowed for praefect"
  type = string
}
variable "subnet_group_name_praefect" {
  description = "The name of database subnet group for rds praefect"
  type = string
}
variable "subnet_group_desc_praefect" {
  description = "description of the db subnet group for rds praefect"
  type = string
}
variable "parameter_group_name_praefect" {
  description = "Name of the parameter group for rds praefect"
  type = string
}
variable "parameter_group_desc_praefect" {
  description = "Description for paramter group for rds praefect"
  type = string
}
variable "family_praefect" {
  description = "pg family for rds praefect"
  type = string
}
variable "rdspraefect_role" {
  description = "name of iam role created for rds monitoring"
  type = string
}
variable "identifier_praefect" {
  description = "database identifier"
  type = string
}
variable "allocated_storage_praefect" {
  description = "storage allocated to db instance"
  type = number
}
variable "db_name_praefect" {
  description = "Name of the database"
  type = string
}
variable "db_instance_class_praefect" {
  description = "instance class for database"
  type = string
}
variable "engine_praefect" {
  description = "engine used in database"
  type = string
}
variable "engine_version_praefect" {
  description = "verion of db engine"
  type = string
}
variable "skip_final_snapshot_praefect" {
  description = "Whether to skip the final snapshot"
  type = bool
}
variable "storage_type_praefect" {
  description = "type of storage used for db instance"
  type = string
}
variable "storage_encrypted_praefect" {
  description = "Whether the dtorage is encrypted"
  type = bool
}
variable "multi_az_praefect" {
  description = "Whether tthe db instance is multi az"
  type = bool
}
variable "username_praefect" {
  description = "username for database"
  type = string
}
variable "password_praefect" {
  description = "the password for database"
  type = string
}
variable "db_retention_days_praefect" {
  description = "retention of db backup in days"
  type = number
}
variable "backup_window_praefect" {
  description = "backup window"
  type = string
}
variable "maintenance_window_praefect" {
  description = "backup maintenance window"
  type = string
}
variable "db_log_retention_praefect" {
  description = "retention period of cloudwatch log group"
  type = number
}
variable "performance_insights_enabled_praefect" {
  description = "Whether to enable performance insights"
  type = bool
}
variable "monitoring_interval_praefect" {
  description = "rds monitoring interval in seconds"
  type = number
}
variable "rdspraefect_tags" {
  description = "tags associated to rds instance"
  type = string
}

#elasticache
variable "sgelc_name" {
  description = "Name of elasticache security group"
  type = string
}
variable "sgelc_ingress_from_port" {
  description = "starting port number to allow inbound traffic"
  type = string
}
variable "sgelc_ingress_to_port" {
  description = "ending port number to allow inbound traffic"
  type = string
}
variable "sgelc_ingress_protocol" {
  description = "protocol for above inbound traffic port numbers"
  type = string
}
variable "sgelc_egress_from_port" {
  description = "starting port number to allow outbound traffic"
  type = string
}
variable "sgelc_egress_to_port" {
  description = "ending port number to allow outbound traffic"
  type = string
}
variable "sgelc_egress_protocol" {
  description = "protocol for above outbound ports"
  type = string
}
variable "cache_subnet_group_name" {
  description = "Name of elastic cache subnet group"
  type = string
}
variable "replication_group_id" {
  description = "name of replication group for redis"
  type = string
}
variable "rep_description" {
  description = "Description for the repl group created"
  type = string
}
variable "automatic_failover_enabled" {
  description = "Whether to enable automatic failover"
  type = bool
}
variable "at_rest_encryption_enabled" {
  description = "Whether to enable encrytion at rest"
  type = bool
}
variable "transit_encryption_enabled" {
  description = "Whether to enable encryption in transit"
  type = bool
}
variable "multi_az_enabled" {
  description = "Whether to enable multi az configuration"
  type = bool
}
variable "cache_engine" {
  description = "the name of engine used for the elasticcache cluster"
  type = string
}
variable "cache_port" {
  description = "required port for the instance"
  type = number
}
variable "node_type" {
  description = "cache node type used"
  type = string
}
variable "num_cache_nodes" {
  description = "Number of cache nodes"
  type = number
}
variable "parameter_group" {
  description = "Name of parameter group to be used"
  type = string
}
variable "snapshot_retention_limit" {
  description = "retention of snapshot in days"
  type = number
}
variable "snapshot_window" {
  description = "snapshot window for redis cache"
  type = string
}

#S3

variable "bucket_name" {
  description = "Name of s3 bucket"
  type = string
}
variable "object_lock_enabled" {
  description = "Whether to enable the s3 object lock"
  type = bool
}
variable "force_destroy" {
  description = "Whether the bucket can forcefully destroyed"
  type = bool
}
variable "object_ownership" {
  description = "bucket ownership.Valid values are BucketOwnerPreferred, BucketOwnerEnforced"
  type = string
}
variable "bucket_acl" {
  description = "acl to apply on bucket. Valid values are private, public-read, public-read-write"
  type = string
}
variable "versioning_status" {
  description = "versioning status. Valid values are Enabled, Suspended"
  type = string
}




