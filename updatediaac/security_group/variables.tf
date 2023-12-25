variable "app_subnet_cidr" {}
variable "alb_subnet_cidr" {}

variable "alb_rails_sg_from_port" {
  description = "From port for ALB Rails SG"
  type        = number
  default     = 80
}

variable "alb_rails_sg_to_port" {
  description = "To port for ALB Rails SG"
  type        = number
  default     = 80
}

variable "alb_rails_sg_protocol" {
  description = "protocol for ALB Rails SG"
  type = string
  default = "tcp"
}

variable "alb_rails_sg_from_port1" {
  description = "From port for ALB Rails SG"
  type        = number
  default     = 443
}

variable "alb_rails_sg_to_port1" {
  description = "To port for ALB Rails SG"
  type        = number
  default     = 443
}

variable "alb_rails_sg_protocol1" {
  description = "protocol for ALB Rails SG"
  type = string
  default = "tcp"
}

variable "rds_git_sg_from_port" {
  description = "From port for ALB Rails SG"
  type        = number
  default     = 5432
}

variable "rds_git_sg_to_port" {
  description = "To port for ALB Rails SG"
  type        = number
  default     = 5432
}

variable "rds_git_sg_protocol" {
  description = "protocol for ALB Rails SG"
  type = string
  default = "tcp"
}

variable "elastic_cache_sg_from_port" {
  description = "From port for ALB Rails SG"
  type        = number
  default     = 6379
}

variable "elastic_cache_sg_to_port" {
  description = "To port for ALB Rails SG"
  type        = number
  default     = 6379
}

variable "elastic_cache_sg_protocol" {
  description = "protocol for ALB Rails SG"
  type = string
  default = "tcp"
}

variable "nlb_sg_from_port" {
  description = "From port for ALB Rails SG"
  type        = number
  default     = 2305
}

variable "nlb_sg_to_port" {
  description = "To port for ALB Rails SG"
  type        = number
  default     = 2305
}

variable "nlb_sg_protocol" {
  description = "protocol for ALB Rails SG"
  type = string
  default = "tcp"
}

variable "gitlay_server_sg_from_port" {
  description = "From port for ALB Rails SG"
  type        = number
  default     = 8075
}

variable "gitlay_server_sg_to_port" {
  description = "To port for ALB Rails SG"
  type        = number
  default     = 8075
}

variable "gitlay_server_sg_protocol" {
  description = "protocol for ALB Rails SG"
  type = string
  default = "tcp"
}

variable "praefect_server_sg_from_port" {
  description = "From port for ALB Rails SG"
  type        = number
  default     = 2305
}

variable "praefect_server_sg_to_port" {
  description = "To port for ALB Rails SG"
  type        = number
  default     = 2305
}

variable "praefect_server_sg_protocol" {
  description = "protocol for ALB Rails SG"
  type = string
  default = "tcp"
}

variable "rails_server_sg_from_port" {
  description = "From port for ALB Rails SG"
  type        = number
  default     = 80
}

variable "rails_server_sg_to_port" {
  description = "To port for ALB Rails SG"
  type        = number
  default     = 80
}

variable "rails_server_sg_protocol" {
  description = "protocol for ALB Rails SG"
  type = string
  default = "tcp"
}

variable "rails_server_sg_from_port1" {
  description = "From port for ALB Rails SG"
  type        = number
  default     = 443
}

variable "rails_server_sg_to_port1" {
  description = "To port for ALB Rails SG"
  type        = number
  default     = 443
}

variable "rails_server_sg_protocol1" {
  description = "protocol for ALB Rails SG"
  type = string
  default = "tcp"
}
variable "rds_praefect_sg_from_port" {
  description = "From port for ALB Rails SG"
  type        = number
  default     = 5432
}

variable "rds_praefect_sg_to_port" {
  description = "To port for ALB Rails SG"
  type        = number
  default     = 5432
}

variable "rds_praefect_sg_protocol" {
  description = "protocol for ALB Rails SG"
  type = string
  default = "tcp"
}