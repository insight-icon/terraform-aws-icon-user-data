
module "defaults" {
  source = "../.."
  type   = "prep"
}

output "user_data" {
  value = module.defaults.user_data
}