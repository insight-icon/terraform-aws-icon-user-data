

variable "consul_enabled" {
  type = bool
  default = false
}
variable "prometheus_enabled" {
  type = bool
  default = false
}

variable "type" {
  type = string
}

//------------ Sentry

variable "prep_ip" {
  type = string
  default = ""
}