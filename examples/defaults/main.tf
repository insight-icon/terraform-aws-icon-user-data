
module "defaults" {
  source = "../.."
}

output "user_data" {
  value = module.defaults.user_data
}