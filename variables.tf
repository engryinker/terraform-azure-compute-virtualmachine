variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "virtual_machines" {
  description = "Map of virtual machines to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-compute-virtualmachine/azurerm v0.21.0 (https://registry.terraform.io/modules/Azure/avm-res-compute-virtualmachine/azurerm/0.21.0) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                                   = string
    tags                                                   = optional(map(string))
    enable_telemetry                                       = optional(bool)
    zone                                                   = string
    boot_diagnostics_storage_account_uri                   = optional(string, null)
    data_disk_existing_disks                               = optional(any, {})
    network_interfaces                                     = optional(any, null)
    platform_fault_domain                                  = optional(number, null)
    dedicated_host_resource_id                             = optional(string, null)
    enable_automatic_updates                               = optional(bool, true)
    eviction_policy                                        = optional(string, null)
    lock                                                   = optional(any, null)
    plan                                                   = optional(any, null)
    maintenance_configuration_resource_ids                 = optional(map(string), {})
    disable_password_authentication                        = optional(bool, null)
    dedicated_host_group_resource_id                       = optional(string, null)
    diagnostic_settings                                    = optional(any, null)
    secure_boot_enabled                                    = optional(bool, null)
    source_image_reference                                 = optional(any, { "offer" = "WindowsServer", "publisher" = "MicrosoftWindowsServer", "sku" = "2022-datacenter-g2", "version" = "latest" })
    account_credentials                                    = optional(any, null)
    availability_set_resource_id                           = optional(string, null)
    os_type                                                = optional(string, null)
    termination_notification                               = optional(any, null)
    boot_diagnostics                                       = optional(bool, null)
    custom_data                                            = optional(string, null)
    encryption_at_host_enabled                             = optional(bool, true)
    os_managed_disk_id                                     = optional(string, null)
    sku_size                                               = optional(string, null)
    computer_name                                          = optional(string, null)
    role_assignments_system_managed_identity               = optional(any, null)
    disk_controller_type                                   = optional(string, null)
    admin_ssh_keys                                         = optional(any, [])
    hotpatching_enabled                                    = optional(bool, false)
    proximity_placement_group_resource_id                  = optional(string, null)
    source_image_resource_id                               = optional(string, null)
    data_disk_managed_disks                                = optional(any, null)
    patch_assessment_mode                                  = optional(string, "ImageDefault")
    additional_unattend_contents                           = optional(any, null)
    capacity_reservation_group_resource_id                 = optional(string, null)
    reboot_setting                                         = optional(string, null)
    gallery_applications                                   = optional(any, null)
    timeouts                                               = optional(any, {})
    generate_admin_password_or_ssh_key                     = optional(bool, true)
    allow_extension_operations                             = optional(bool, true)
    managed_identities                                     = optional(any, null)
    os_disk_attach_mode                                    = optional(bool, null)
    extensions                                             = optional(any, null)
    extensions_time_budget                                 = optional(string, "PT1H30M")
    role_assignments                                       = optional(any, null)
    user_data                                              = optional(string, null)
    vtpm_enabled                                           = optional(bool, null)
    generated_secrets_key_vault_secret_config              = optional(any, null)
    edge_zone                                              = optional(string, null)
    license_type                                           = optional(string, null)
    winrm_listeners                                        = optional(any, null)
    admin_username                                         = optional(string, null)
    os_disk                                                = optional(any, null)
    patch_mode                                             = optional(string, null)
    priority                                               = optional(string, "Regular")
    public_ip_configuration_details                        = optional(any, null)
    admin_password                                         = optional(string, null)
    run_commands                                           = optional(any, {})
    run_commands_secrets                                   = optional(any, {})
    shutdown_schedules                                     = optional(any, {})
    vm_additional_capabilities                             = optional(any, null)
    azure_backup_configurations                            = optional(any, {})
    timezone                                               = optional(string, null)
    virtual_machine_scale_set_resource_id                  = optional(string, null)
    bypass_platform_safety_checks_on_user_schedule_enabled = optional(bool, false)
    max_bid_price                                          = optional(number, -1)
    provision_vm_agent                                     = optional(bool, true)
    secrets                                                = optional(any, null)
  }))
  default = {}
}
