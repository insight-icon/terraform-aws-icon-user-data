

variable "consult_enabled" {
  type = bool
  default = true
}
variable "prometheus_enabled" {
  type = bool
  default = true
}

variable "type" {
  type = string
  default = "sentry"
}
