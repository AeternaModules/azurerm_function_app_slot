variable "function_app_slots" {
  description = <<EOT
Map of function_app_slots, attributes below
Required:
    - app_service_plan_id
    - function_app_name
    - location
    - name
    - resource_group_name
    - storage_account_access_key
    - storage_account_access_key_key_vault_id (alternative to storage_account_access_key - read from Key Vault instead)
    - storage_account_access_key_key_vault_secret_name (alternative to storage_account_access_key - read from Key Vault instead)
    - storage_account_name
Optional:
    - app_settings
    - daily_memory_time_quota
    - enable_builtin_logging
    - enabled
    - https_only
    - os_type
    - tags
    - version
    - auth_settings (block):
        - active_directory (optional, block):
            - allowed_audiences (optional)
            - client_id (required)
            - client_secret (optional)
        - additional_login_params (optional)
        - allowed_external_redirect_urls (optional)
        - default_provider (optional)
        - enabled (required)
        - facebook (optional, block):
            - app_id (required)
            - app_secret (required)
            - oauth_scopes (optional)
        - google (optional, block):
            - client_id (required)
            - client_secret (required)
            - oauth_scopes (optional)
        - issuer (optional)
        - microsoft (optional, block):
            - client_id (required)
            - client_secret (required)
            - oauth_scopes (optional)
        - runtime_version (optional)
        - token_refresh_extension_hours (optional)
        - token_store_enabled (optional)
        - twitter (optional, block):
            - consumer_key (required)
            - consumer_secret (required)
        - unauthenticated_client_action (optional)
    - connection_string (block):
        - name (required)
        - type (required)
        - value (required)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - site_config (block):
        - always_on (optional)
        - app_scale_limit (optional)
        - auto_swap_slot_name (optional)
        - cors (optional, block):
            - allowed_origins (required)
            - support_credentials (optional)
        - dotnet_framework_version (optional)
        - elastic_instance_minimum (optional)
        - ftps_state (optional)
        - health_check_path (optional)
        - http2_enabled (optional)
        - ip_restriction (optional, block):
            - action (optional)
            - headers (optional, block):
                - x_azure_fdid (optional)
                - x_fd_health_probe (optional)
                - x_forwarded_for (optional)
                - x_forwarded_host (optional)
            - ip_address (optional)
            - name (optional)
            - priority (optional)
            - service_tag (optional)
            - virtual_network_subnet_id (optional)
        - java_version (optional)
        - linux_fx_version (optional)
        - min_tls_version (optional)
        - pre_warmed_instance_count (optional)
        - runtime_scale_monitoring_enabled (optional)
        - scm_ip_restriction (optional, block):
            - action (optional)
            - headers (optional, block):
                - x_azure_fdid (optional)
                - x_fd_health_probe (optional)
                - x_forwarded_for (optional)
                - x_forwarded_host (optional)
            - ip_address (optional)
            - name (optional)
            - priority (optional)
            - service_tag (optional)
            - virtual_network_subnet_id (optional)
        - scm_type (optional)
        - scm_use_main_ip_restriction (optional)
        - use_32_bit_worker_process (optional)
        - vnet_route_all_enabled (optional)
        - websockets_enabled (optional)
EOT

  type = map(object({
    app_service_plan_id                              = string
    function_app_name                                = string
    location                                         = string
    name                                             = string
    resource_group_name                              = string
    storage_account_access_key                       = string
    storage_account_access_key_key_vault_id          = optional(string)
    storage_account_access_key_key_vault_secret_name = optional(string)
    storage_account_name                             = string
    app_settings                                     = optional(map(string))
    daily_memory_time_quota                          = optional(number)
    enable_builtin_logging                           = optional(bool) # Default: true
    enabled                                          = optional(bool) # Default: true
    https_only                                       = optional(bool) # Default: false
    os_type                                          = optional(string)
    tags                                             = optional(map(string))
    version                                          = optional(string) # Default: "~1"
    auth_settings = optional(object({
      active_directory = optional(object({
        allowed_audiences = optional(list(string))
        client_id         = string
        client_secret     = optional(string)
      }))
      additional_login_params        = optional(map(string))
      allowed_external_redirect_urls = optional(list(string))
      default_provider               = optional(string)
      enabled                        = bool
      facebook = optional(object({
        app_id       = string
        app_secret   = string
        oauth_scopes = optional(list(string))
      }))
      google = optional(object({
        client_id     = string
        client_secret = string
        oauth_scopes  = optional(list(string))
      }))
      issuer = optional(string)
      microsoft = optional(object({
        client_id     = string
        client_secret = string
        oauth_scopes  = optional(list(string))
      }))
      runtime_version               = optional(string)
      token_refresh_extension_hours = optional(number) # Default: 72
      token_store_enabled           = optional(bool)   # Default: false
      twitter = optional(object({
        consumer_key    = string
        consumer_secret = string
      }))
      unauthenticated_client_action = optional(string)
    }))
    connection_string = optional(list(object({
      name  = string
      type  = string
      value = string
    })))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    site_config = optional(object({
      always_on           = optional(bool) # Default: false
      app_scale_limit     = optional(number)
      auto_swap_slot_name = optional(string)
      cors = optional(object({
        allowed_origins     = set(string)
        support_credentials = optional(bool) # Default: false
      }))
      dotnet_framework_version = optional(string) # Default: "v4.0"
      elastic_instance_minimum = optional(number)
      ftps_state               = optional(string)
      health_check_path        = optional(string)
      http2_enabled            = optional(bool) # Default: false
      ip_restriction = optional(list(object({
        action = optional(string) # Default: "Allow"
        headers = optional(object({
          x_azure_fdid      = optional(set(string))
          x_fd_health_probe = optional(set(string))
          x_forwarded_for   = optional(set(string))
          x_forwarded_host  = optional(set(string))
        }))
        ip_address                = optional(string)
        name                      = optional(string)
        priority                  = optional(number) # Default: 65000
        service_tag               = optional(string)
        virtual_network_subnet_id = optional(string)
      })))
      java_version                     = optional(string)
      linux_fx_version                 = optional(string)
      min_tls_version                  = optional(string)
      pre_warmed_instance_count        = optional(number)
      runtime_scale_monitoring_enabled = optional(bool) # Default: false
      scm_ip_restriction = optional(list(object({
        action = optional(string) # Default: "Allow"
        headers = optional(object({
          x_azure_fdid      = optional(set(string))
          x_fd_health_probe = optional(set(string))
          x_forwarded_for   = optional(set(string))
          x_forwarded_host  = optional(set(string))
        }))
        ip_address                = optional(string)
        name                      = optional(string)
        priority                  = optional(number) # Default: 65000
        service_tag               = optional(string)
        virtual_network_subnet_id = optional(string)
      })))
      scm_type                    = optional(string)
      scm_use_main_ip_restriction = optional(bool) # Default: false
      use_32_bit_worker_process   = optional(bool) # Default: true
      vnet_route_all_enabled      = optional(bool)
      websockets_enabled          = optional(bool) # Default: false
    }))
  }))
}

