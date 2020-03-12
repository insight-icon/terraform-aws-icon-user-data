#########
# General
#########
variable "type" {
  description = "The type of instance - prep, citizen, sentry"
  type        = string
  default     = "prep"
}

variable "linux_os" {
  description = "The OS flavor"
  type        = string
  default     = "debian"
}

#######
# Flags
#######
variable "disable_ipv6" {
  description = "Bool for ipv6"
  type        = bool
  default     = false
}

variable "consul_enabled" {
  description = "Bool for consul"
  type        = bool
  default     = false
}

variable "prometheus_enabled" {
  description = "Bool for prom"
  type        = bool
  default     = false
}

#########
# Consul
#########
variable "node_tags" {
  type        = string
  default     = "prep"
  description = "The tag to put into the node exporter for consul to pick up the tag of the instance and associate the proper metrics"
}

#########
# Sentry
#########
variable "prep_ip" {
  description = "IP of prep"
  type        = string
  default     = ""
}

#####
# NAT
#####
variable "vpc_cidr" {
  type    = string
  default = ""
}

variable "nlb_dns" {
  type    = string
  default = ""
}

#########
# Volumes
#########
variable "driver_type" {
  description = "standard or nitro (nvme) drivers"
  type        = string
  default     = ""
}

variable "instance_store_enabled" {
  description = "Bool to indicate attached storage"
  type        = bool
  default     = false
}