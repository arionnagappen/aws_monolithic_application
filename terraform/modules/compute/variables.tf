// --- LAUNCH TEMPLATE ---
variable "inst_ami" {
  type = string
  description = "AMI of the instance"
}

variable "inst_type" {
  type = string
  description = "Instance Type"
}

variable "name_prefix" {
  type =  string
  description = "Launch template name prefix"
}

variable "launch_temp_tag" {
  type =  string
  description = "Launch template tag"
}

// --- AUTO-SCALING GROUP ---
variable "asg_name" {
  type = string
  description = "ASG Name"
}

variable "maximum_size" {
  type = number
  description = "Max. number of instances"
}

variable "minimum_size" {
  type = number
  description = "Min. number of instances"
}

variable "desired_cap" {
  type = number
  description = "Default number of instances"
}

variable "asg_tag" {
  type = string
  description = "ASG Tag"
}

variable "health_chk_type" {
  type = string
  description = "ASG Health Check Type"
}

variable "health_chk_grace_period" {
  type = number
  description = "Health Check Grace Period"
}

// --- APPLICATION LOAD BALANCER ---
variable "alb_tg_name" {
  type = string
  description = "ALB TG Name"
}

variable "alb_protocol" {
  type = string
  description = "ALB Protocol"
}

variable "alb_health_interval" {
  type = number
  description = "ALB Health check interval"
}

variable "alb_health_timeout" {
  type = number
  description = "ALB health check timeout"
}

variable "alb_healthy_threshold" {
  type = number
  description = "ALB healthy threshold"
}

variable "alb_unhealthy_threshold" {
  type = number
  description = "ALB unhealthy threshold"
}

variable "alb_health_matcher" {
  type = number
  description = "ALB health matcher"
}

variable "alb_name" {
  type = string
  description = "ALB name"
}

// --- BASTION HOST ---
variable "bastion_inst_ami" {
  type = string
  description = "Bastion Host AMI"
}

variable "bastion_inst_type" {
  type = string
  description = "Bastion Host Instance Type"
}

variable "bastion_tag" {
  type = string
  description = "Bastion Tag"
}

// --- FROM NETWORKING MODULE ---
variable "vpc_id" {
  type = string
  description = "VPC ID to launch EC2 instance into"
}
variable "availability_zones" {
  type = list(string)
  description = "List of availability zones"
}

variable "public_subnet_ids" {
  type = list(string)
  description = "List of public subnet IDs"
}

variable "app_subnet_ids" {
  type = list(string)
  description = "List of app server IDs"
}

variable "database_subnet_ids" {
  type = list(string)
  description = "List of database subnet IDs"
}


// --- FROM SECURITY MODULE ---
variable "app_server_instance_profile_name" {
  type = string
}