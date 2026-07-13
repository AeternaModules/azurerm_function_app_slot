data "azurerm_key_vault_secret" "storage_account_access_key" {
  for_each     = { for k, v in var.function_app_slots : k => v if v.storage_account_access_key_key_vault_id != null && v.storage_account_access_key_key_vault_secret_name != null }
  name         = each.value.storage_account_access_key_key_vault_secret_name
  key_vault_id = each.value.storage_account_access_key_key_vault_id
}
resource "azurerm_function_app_slot" "function_app_slots" {
  for_each = var.function_app_slots

  app_service_plan_id        = each.value.app_service_plan_id
  function_app_name          = each.value.function_app_name
  location                   = each.value.location
  name                       = each.value.name
  resource_group_name        = each.value.resource_group_name
  storage_account_access_key = each.value.storage_account_access_key != null ? each.value.storage_account_access_key : try(data.azurerm_key_vault_secret.storage_account_access_key[each.key].value, null)
  storage_account_name       = each.value.storage_account_name
  app_settings               = each.value.app_settings
  daily_memory_time_quota    = each.value.daily_memory_time_quota
  enable_builtin_logging     = each.value.enable_builtin_logging
  enabled                    = each.value.enabled
  https_only                 = each.value.https_only
  os_type                    = each.value.os_type
  tags                       = each.value.tags
  version                    = each.value.version

  dynamic "auth_settings" {
    for_each = each.value.auth_settings != null ? [each.value.auth_settings] : []
    content {
      dynamic "active_directory" {
        for_each = auth_settings.value.active_directory != null ? [auth_settings.value.active_directory] : []
        content {
          allowed_audiences = active_directory.value.allowed_audiences
          client_id         = active_directory.value.client_id
          client_secret     = active_directory.value.client_secret
        }
      }
      additional_login_params        = auth_settings.value.additional_login_params
      allowed_external_redirect_urls = auth_settings.value.allowed_external_redirect_urls
      default_provider               = auth_settings.value.default_provider
      enabled                        = auth_settings.value.enabled
      dynamic "facebook" {
        for_each = auth_settings.value.facebook != null ? [auth_settings.value.facebook] : []
        content {
          app_id       = facebook.value.app_id
          app_secret   = facebook.value.app_secret
          oauth_scopes = facebook.value.oauth_scopes
        }
      }
      dynamic "google" {
        for_each = auth_settings.value.google != null ? [auth_settings.value.google] : []
        content {
          client_id     = google.value.client_id
          client_secret = google.value.client_secret
          oauth_scopes  = google.value.oauth_scopes
        }
      }
      issuer = auth_settings.value.issuer
      dynamic "microsoft" {
        for_each = auth_settings.value.microsoft != null ? [auth_settings.value.microsoft] : []
        content {
          client_id     = microsoft.value.client_id
          client_secret = microsoft.value.client_secret
          oauth_scopes  = microsoft.value.oauth_scopes
        }
      }
      runtime_version               = auth_settings.value.runtime_version
      token_refresh_extension_hours = auth_settings.value.token_refresh_extension_hours
      token_store_enabled           = auth_settings.value.token_store_enabled
      dynamic "twitter" {
        for_each = auth_settings.value.twitter != null ? [auth_settings.value.twitter] : []
        content {
          consumer_key    = twitter.value.consumer_key
          consumer_secret = twitter.value.consumer_secret
        }
      }
      unauthenticated_client_action = auth_settings.value.unauthenticated_client_action
    }
  }

  dynamic "connection_string" {
    for_each = each.value.connection_string != null ? each.value.connection_string : []
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "site_config" {
    for_each = each.value.site_config != null ? [each.value.site_config] : []
    content {
      always_on           = site_config.value.always_on
      app_scale_limit     = site_config.value.app_scale_limit
      auto_swap_slot_name = site_config.value.auto_swap_slot_name
      dynamic "cors" {
        for_each = site_config.value.cors != null ? [site_config.value.cors] : []
        content {
          allowed_origins     = cors.value.allowed_origins
          support_credentials = cors.value.support_credentials
        }
      }
      dotnet_framework_version = site_config.value.dotnet_framework_version
      elastic_instance_minimum = site_config.value.elastic_instance_minimum
      ftps_state               = site_config.value.ftps_state
      health_check_path        = site_config.value.health_check_path
      http2_enabled            = site_config.value.http2_enabled
      dynamic "ip_restriction" {
        for_each = site_config.value.ip_restriction != null ? site_config.value.ip_restriction : []
        content {
          action = ip_restriction.value.action
          dynamic "headers" {
            for_each = ip_restriction.value.headers != null ? ip_restriction.value.headers : []
            content {
              x_azure_fdid      = headers.value.x_azure_fdid
              x_fd_health_probe = headers.value.x_fd_health_probe
              x_forwarded_for   = headers.value.x_forwarded_for
              x_forwarded_host  = headers.value.x_forwarded_host
            }
          }
          ip_address                = ip_restriction.value.ip_address
          name                      = ip_restriction.value.name
          priority                  = ip_restriction.value.priority
          service_tag               = ip_restriction.value.service_tag
          virtual_network_subnet_id = ip_restriction.value.virtual_network_subnet_id
        }
      }
      java_version                     = site_config.value.java_version
      linux_fx_version                 = site_config.value.linux_fx_version
      min_tls_version                  = site_config.value.min_tls_version
      pre_warmed_instance_count        = site_config.value.pre_warmed_instance_count
      runtime_scale_monitoring_enabled = site_config.value.runtime_scale_monitoring_enabled
      dynamic "scm_ip_restriction" {
        for_each = site_config.value.scm_ip_restriction != null ? site_config.value.scm_ip_restriction : []
        content {
          action = scm_ip_restriction.value.action
          dynamic "headers" {
            for_each = scm_ip_restriction.value.headers != null ? scm_ip_restriction.value.headers : []
            content {
              x_azure_fdid      = headers.value.x_azure_fdid
              x_fd_health_probe = headers.value.x_fd_health_probe
              x_forwarded_for   = headers.value.x_forwarded_for
              x_forwarded_host  = headers.value.x_forwarded_host
            }
          }
          ip_address                = scm_ip_restriction.value.ip_address
          name                      = scm_ip_restriction.value.name
          priority                  = scm_ip_restriction.value.priority
          service_tag               = scm_ip_restriction.value.service_tag
          virtual_network_subnet_id = scm_ip_restriction.value.virtual_network_subnet_id
        }
      }
      scm_type                    = site_config.value.scm_type
      scm_use_main_ip_restriction = site_config.value.scm_use_main_ip_restriction
      use_32_bit_worker_process   = site_config.value.use_32_bit_worker_process
      vnet_route_all_enabled      = site_config.value.vnet_route_all_enabled
      websockets_enabled          = site_config.value.websockets_enabled
    }
  }
}

