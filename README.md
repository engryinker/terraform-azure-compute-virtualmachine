# terraform-azure-compute-virtualmachine

Org-standard Terraform wrapper for: **virtual machines**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/<org>/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/<org>/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "compute-virtualmachine" {
  source = "git::https://github.com/<org>/terraform-azure-compute-virtualmachine.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  virtual_machines = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `virtual_machines` (virtual machines)

Wraps [Azure/avm-res-compute-virtualmachine/azurerm](https://registry.terraform.io/modules/Azure/avm-res-compute-virtualmachine/azurerm/0.21.0) v0.21.0.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `zone` | `string` | yes |  |
| `boot_diagnostics_storage_account_uri` | `string` | no |  |
| `data_disk_existing_disks` | `any` | no |  |
| `network_interfaces` | `any` | no |  |
| `platform_fault_domain` | `number` | no |  |
| `dedicated_host_resource_id` | `string` | no |  |
| `enable_automatic_updates` | `bool` | no |  |
| `eviction_policy` | `string` | no |  |
| `lock` | `any` | no |  |
| `plan` | `any` | no |  |
| `maintenance_configuration_resource_ids` | `map(string)` | no |  |
| `disable_password_authentication` | `bool` | no |  |
| `dedicated_host_group_resource_id` | `string` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `secure_boot_enabled` | `bool` | no |  |
| `source_image_reference` | `any` | no |  |
| `account_credentials` | `any` | no |  |
| `availability_set_resource_id` | `string` | no |  |
| `os_type` | `string` | no |  |
| `termination_notification` | `any` | no |  |
| `boot_diagnostics` | `bool` | no |  |
| `custom_data` | `string` | no |  |
| `encryption_at_host_enabled` | `bool` | no |  |
| `os_managed_disk_id` | `string` | no |  |
| `sku_size` | `string` | no |  |
| `computer_name` | `string` | no |  |
| `role_assignments_system_managed_identity` | `any` | no |  |
| `disk_controller_type` | `string` | no |  |
| `admin_ssh_keys` | `any` | no |  |
| `hotpatching_enabled` | `bool` | no |  |
| `proximity_placement_group_resource_id` | `string` | no |  |
| `source_image_resource_id` | `string` | no |  |
| `data_disk_managed_disks` | `any` | no |  |
| `patch_assessment_mode` | `string` | no |  |
| `additional_unattend_contents` | `any` | no |  |
| `capacity_reservation_group_resource_id` | `string` | no |  |
| `reboot_setting` | `string` | no |  |
| `gallery_applications` | `any` | no |  |
| `timeouts` | `any` | no |  |
| `generate_admin_password_or_ssh_key` | `bool` | no |  |
| `allow_extension_operations` | `bool` | no |  |
| `managed_identities` | `any` | no |  |
| `os_disk_attach_mode` | `bool` | no |  |
| `extensions` | `any` | no |  |
| `extensions_time_budget` | `string` | no |  |
| `role_assignments` | `any` | no |  |
| `user_data` | `string` | no |  |
| `vtpm_enabled` | `bool` | no |  |
| `generated_secrets_key_vault_secret_config` | `any` | no |  |
| `edge_zone` | `string` | no |  |
| `license_type` | `string` | no |  |
| `winrm_listeners` | `any` | no |  |
| `admin_username` | `string` | no |  |
| `os_disk` | `any` | no |  |
| `patch_mode` | `string` | no |  |
| `priority` | `string` | no |  |
| `public_ip_configuration_details` | `any` | no |  |
| `admin_password` | `string` | no |  |
| `run_commands` | `any` | no |  |
| `run_commands_secrets` | `any` | no |  |
| `shutdown_schedules` | `any` | no |  |
| `vm_additional_capabilities` | `any` | no |  |
| `azure_backup_configurations` | `any` | no |  |
| `timezone` | `string` | no |  |
| `virtual_machine_scale_set_resource_id` | `string` | no |  |
| `bypass_platform_safety_checks_on_user_schedule_enabled` | `bool` | no |  |
| `max_bid_price` | `number` | no |  |
| `provision_vm_agent` | `bool` | no |  |
| `secrets` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `virtual_machines` -- map (same keys as the input) of every output from each created virtual machines.
