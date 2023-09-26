variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "cluster_name" {
  type        = string
  description = "The name of the ROSA cluster to create"
  default     = "rosa-cluster"
}

# variable "network_type" {
#         type = string
#         validation {
#             condition = contains(["public", "private"], var.network_type)
#             error_message = "Network type must be one of [public,private]"
#         }
# }

# variable "external_id" {
#     type = string
#     description = "Optional external ID to link to ROSA cluster"
#     default = ""
# }

variable "rosa_version" {
  type        = string
  description = "The version of ROSA to be deployed"
  default     = "4.13.13"
}

variable "replicas" {
  type        = string
  description = "The number of computer nodes to create. Must be a minimum of 2 for a single-AZ cluster, 3 for multi-AZ."
  default     = "3"
}

variable "compute_node_instance_type" {
  type        = string
  description = "The EC2 instance type to use for compute nodes"
  default     = "m5.xlarge"
}

variable "host_prefix" {
  type        = string
  description = "The subnet mask to assign to each compute node in the cluster"
  default     = "23"
}

variable "offline_access_token" {
  type        = string
  description = "The OCM API access token for your account"
}

variable "availability_zones" {
  type        = list(any)
  description = "The availability zones to use for the cluster"
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "machine_cidr_block" {
  type        = string
  description = "value of the CIDR block to use for the VPC"
  default     = "10.66.0.0/16"
}

variable "private_subnet_cidrs" {
  type        = list(any)
  description = "The CIDR blocks to use for the private subnets"
  default     = ["10.66.1.0/24", "10.66.2.0/24", "10.66.3.0/24"]
}

variable "public_subnet_cidrs" {
  type        = list(any)
  description = "The CIDR blocks to use for the public subnets"
  default     = ["10.66.101.0/24", "10.66.102.0/24", "10.66.103.0/24"]
}

variable "enable_private_link" {
  type        = bool
  description = "This enables private link"
  default     = false
}

#variable "operator_role_prefix" {
#  type = string
#}

#variable "account_role_prefix" {
#  type = string
#}

variable "htpasswd_username" {
  type        = string
  description = "htpasswd username"
  default     = "kubeadmin"
}

variable "htpasswd_password" {
  type        = string
  description = "htpasswd password"
  sensitive   = true
}

variable "url" {
  type        = string
  description = "Provide OCM environment by setting a value to url"
  default     = "https://api.openshift.com"
}

variable "machine_type" {
  description = "The AWS instance type that used for the instances creation ."
  type        = string
}

variable "machineset_replicas" {
  description = "The amount of the machine created in this machine pool."
  type        = number
  default     = null
}

variable "multi_availability_zone_machinepool" {
  description = "Multi Availaibility Zone for the machine pool. If the ROSA cluster is with HA, this variable needs to be true"
  type        = bool
  default     = false
}

variable "spot_instances_machinepool" {
  description = "Usage of Spot Instances for the machine poll"
  type        = bool
  default     = true
}

variable "autoscaling_enabled" {
  description = "Enables autoscaling. This variable requires you to set a maximum and minimum replicas range using the `max_replicas` and `min_replicas` variables."
  type        = string
  default     = "false"
}

variable "min_replicas" {
  description = "The minimum number of replicas for autoscaling."
  type        = number
  default     = null
}

variable "max_replicas" {
  description = "The maximum number of replicas not exceeded by the autoscaling functionality."
  type        = number
  default     = null
}

variable "labels" {
  description = "Labels for the machine pool. Format should be a comma-separated list of 'key = value'. This list will overwrite any modifications made to node labels on an ongoing basis."
  type        = map(string)
  default     = null
}

