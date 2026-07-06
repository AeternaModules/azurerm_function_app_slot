output "function_app_slots" {
  description = "All function_app_slot resources"
  value       = azurerm_function_app_slot.function_app_slots
  sensitive   = true
}
output "function_app_slots_app_service_plan_id" {
  description = "List of app_service_plan_id values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.app_service_plan_id]
}
output "function_app_slots_app_settings" {
  description = "List of app_settings values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.app_settings]
}
output "function_app_slots_auth_settings" {
  description = "List of auth_settings values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.auth_settings]
  sensitive   = true
}
output "function_app_slots_connection_string" {
  description = "List of connection_string values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.connection_string]
  sensitive   = true
}
output "function_app_slots_daily_memory_time_quota" {
  description = "List of daily_memory_time_quota values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.daily_memory_time_quota]
}
output "function_app_slots_default_hostname" {
  description = "List of default_hostname values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.default_hostname]
}
output "function_app_slots_enable_builtin_logging" {
  description = "List of enable_builtin_logging values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.enable_builtin_logging]
}
output "function_app_slots_enabled" {
  description = "List of enabled values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.enabled]
}
output "function_app_slots_function_app_name" {
  description = "List of function_app_name values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.function_app_name]
}
output "function_app_slots_https_only" {
  description = "List of https_only values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.https_only]
}
output "function_app_slots_identity" {
  description = "List of identity values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.identity]
}
output "function_app_slots_kind" {
  description = "List of kind values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.kind]
}
output "function_app_slots_location" {
  description = "List of location values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.location]
}
output "function_app_slots_name" {
  description = "List of name values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.name]
}
output "function_app_slots_os_type" {
  description = "List of os_type values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.os_type]
}
output "function_app_slots_outbound_ip_addresses" {
  description = "List of outbound_ip_addresses values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.outbound_ip_addresses]
}
output "function_app_slots_possible_outbound_ip_addresses" {
  description = "List of possible_outbound_ip_addresses values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.possible_outbound_ip_addresses]
}
output "function_app_slots_resource_group_name" {
  description = "List of resource_group_name values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.resource_group_name]
}
output "function_app_slots_site_config" {
  description = "List of site_config values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.site_config]
}
output "function_app_slots_site_credential" {
  description = "List of site_credential values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.site_credential]
}
output "function_app_slots_storage_account_access_key" {
  description = "List of storage_account_access_key values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.storage_account_access_key]
  sensitive   = true
}
output "function_app_slots_storage_account_name" {
  description = "List of storage_account_name values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.storage_account_name]
}
output "function_app_slots_tags" {
  description = "List of tags values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.tags]
}
output "function_app_slots_version" {
  description = "List of version values across all function_app_slots"
  value       = [for k, v in azurerm_function_app_slot.function_app_slots : v.version]
}

