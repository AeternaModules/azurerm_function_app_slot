output "function_app_slots_id" {
  description = "Map of id values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.id }
}
output "function_app_slots_app_service_plan_id" {
  description = "Map of app_service_plan_id values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.app_service_plan_id }
}
output "function_app_slots_app_settings" {
  description = "Map of app_settings values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.app_settings }
}
output "function_app_slots_auth_settings" {
  description = "Map of auth_settings values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.auth_settings }
  sensitive   = true
}
output "function_app_slots_connection_string" {
  description = "Map of connection_string values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.connection_string }
  sensitive   = true
}
output "function_app_slots_daily_memory_time_quota" {
  description = "Map of daily_memory_time_quota values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.daily_memory_time_quota }
}
output "function_app_slots_default_hostname" {
  description = "Map of default_hostname values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.default_hostname }
}
output "function_app_slots_enable_builtin_logging" {
  description = "Map of enable_builtin_logging values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.enable_builtin_logging }
}
output "function_app_slots_enabled" {
  description = "Map of enabled values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.enabled }
}
output "function_app_slots_function_app_name" {
  description = "Map of function_app_name values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.function_app_name }
}
output "function_app_slots_https_only" {
  description = "Map of https_only values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.https_only }
}
output "function_app_slots_identity" {
  description = "Map of identity values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.identity }
}
output "function_app_slots_kind" {
  description = "Map of kind values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.kind }
}
output "function_app_slots_location" {
  description = "Map of location values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.location }
}
output "function_app_slots_name" {
  description = "Map of name values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.name }
}
output "function_app_slots_os_type" {
  description = "Map of os_type values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.os_type }
}
output "function_app_slots_outbound_ip_addresses" {
  description = "Map of outbound_ip_addresses values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.outbound_ip_addresses }
}
output "function_app_slots_possible_outbound_ip_addresses" {
  description = "Map of possible_outbound_ip_addresses values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.possible_outbound_ip_addresses }
}
output "function_app_slots_resource_group_name" {
  description = "Map of resource_group_name values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.resource_group_name }
}
output "function_app_slots_site_config" {
  description = "Map of site_config values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.site_config }
}
output "function_app_slots_site_credential" {
  description = "Map of site_credential values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.site_credential }
}
output "function_app_slots_storage_account_access_key" {
  description = "Map of storage_account_access_key values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.storage_account_access_key }
  sensitive   = true
}
output "function_app_slots_storage_account_name" {
  description = "Map of storage_account_name values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.storage_account_name }
}
output "function_app_slots_tags" {
  description = "Map of tags values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.tags }
}
output "function_app_slots_version" {
  description = "Map of version values across all function_app_slots, keyed the same as var.function_app_slots"
  value       = { for k, v in azurerm_function_app_slot.function_app_slots : k => v.version }
}

