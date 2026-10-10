output "virtual_machines" {
  description = "Map (same keys as var.virtual_machines) of every output from each virtual machines created -- see upstream module docs for the full shape."
  value       = module.virtual_machine
}
