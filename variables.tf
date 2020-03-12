


variable "disable_ipv6" {
  type    = bool
  default = true
}

variable "consul_enabled" {
  type    = bool
  default = false
}

variable "node_tags" {
  type        = string
  default     = "prep"
  description = "The tag to put into the node exporter for consul to pick up the tag of the instance and associate the proper metrics"
}

variable "prometheus_enabled" {
  type    = bool
  default = false
}

variable "type" {
  type = string
}

//------------ Sentry

variable "prep_ip" {
  type    = string
  default = ""
}


//------------ NAT

variable "vpc_cidr" {
  type    = string
  default = ""
}

variable "nlb_dns" {
  type    = string
  default = ""
}

//------------- Volume

variable "driver_type" {
  type    = string
  default = ""
}

